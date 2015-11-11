package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.User;
import com.wtkj.rms.pmcc.soft.model.LoanApprovalRegister;
import com.wtkj.rms.pmcc.soft.model.LoanApprovalRegisterVo;
import com.wtkj.rms.pmcc.soft.service.LoanApprovalRegisterServiceI;
import com.wtkj.rms.process.model.ProcessVo;

/**
 * 员工借款审批登记
 */
@Service
public class LoanApprovalRegisterServiceImpl implements
		LoanApprovalRegisterServiceI {

	@Autowired
	private BaseDaoI<LoanApprovalRegister> loanApprovalRegisterDao;

	/**
	 * 列表查询
	 */
	@Override
	public List<LoanApprovalRegister> dataGrid(User user,
			LoanApprovalRegisterVo obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from LoanApprovalRegister t ";
		List<LoanApprovalRegister> l = loanApprovalRegisterDao.find(hql
				+ whereHql(user, obj, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		return l;
	}

	/**
	 * 查询总数
	 */
	@Override
	public Long count(User user, LoanApprovalRegisterVo obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from LoanApprovalRegister t ";
		return loanApprovalRegisterDao.count("select count(*) " + hql
				+ whereHql(user, obj, params), params);
	}

	/**
	 * 查询条件
	 * 
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(User user, LoanApprovalRegisterVo vo,
			Map<String, Object> params) {
		String hql = " where 1=1 ";
		if (vo != null) {
			ProcessVo process = vo.getProcess_vo();
			// 权限控制
			if (user != null) {
				// 申请人查看自己申请的
				if (user.getRoleNames().indexOf("总经理") >= 0) {
					// 如果申请人是别人则审批人查看已到到达自己的任务,如果是自己则显示申请人是自己的
					hql += " and (t.process.state = :state or t.process.applyUser.id = :userId)";
					params.put("state", 1);
					params.put("userId", user.getId());
				} else if (user.getRoleNames().indexOf("会计") >= 0) {
					hql += " and (t.process.state = :state or t.process.applyUser.id = :userId)";
					params.put("state", 2);
					params.put("userId", user.getId());
				} else if (user.getRoleNames().indexOf("出纳") >= 0) {
					hql += " and (t.process.state = :state or t.process.applyUser.id = :userId)";
					params.put("state", 3);
					params.put("userId", user.getId());
				} else if (!"admin".equals(user.getName())) {
					// 其他的都视为普通员工
					hql += " and t.process.applyUser.id = :userId";
					params.put("userId", user.getId());
				}
			}

			// 按流程状态以及申请人查询
			if (process != null) {
				if (process.getState() != null) {
					hql += " and t.process.state = :state";
					params.put("state", process.getState());
				}

				// 申请人
				if (process.getApplyUserId() != null
						&& process.getApplyUserId() > 0) {
					hql += " and t.process.applyUser.id = :userId";
					params.put("userId", process.getApplyUserId());
				}

				if (!StringUtils.isEmpty(process.getApplyUserName())) {
					hql += " and t.process.applyUser.name like :username";
					params.put("username", "%%" + process.getApplyUserName()
							+ "%%");
				}

				// 申请时间
				if (vo.getApplyStartDt() != null) {
					hql = hql + " and t.process.startDT >= :rentalTimeST";
					params.put("rentalTimeST", vo.getApplyStartDt());
				}

				if (vo.getApplyEndDt() != null) {
					hql = hql + " and t.process.startDT <= :rentalTimeET";
					params.put("rentalTimeET", vo.getApplyEndDt());
				}
			}

			// 业务查询
			String name = vo.getLoan();
			if (!StringUtils.isEmpty(name)) {
				// 借款人
				hql += " and t.loan like '%" + name + "%' ";
			}

			// 借款时间
			if (vo.getLoanDateSt() != null) {
				hql = hql + " and t.loanDate >= :loadSt";
				params.put("loadSt", vo.getLoanDateSt());
			}

			if (vo.getLoanDateEt() != null) {
				hql = hql + " and t.loanDate <= :loadEt";
				params.put("loadEt", vo.getLoanDateEt());
			}
		}

		return hql;
	}

	/**
	 * 新增保存
	 */
	@Override
	public Long add(LoanApprovalRegister pdrr, HttpServletRequest request) {
		return (Long) loanApprovalRegisterDao.save(pdrr);
	}

	/**
	 * 通过id查询
	 */
	@Override
	public LoanApprovalRegister get(Long id) {
		return loanApprovalRegisterDao.get(LoanApprovalRegister.class, id);
	}

	/**
	 * 修改保存
	 */
	@Override
	public void edit(LoanApprovalRegister pdrr) {
		loanApprovalRegisterDao.update(pdrr);
	}

	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from loan_approval_register where id in (" + ids
				+ ")";
		try {
			loanApprovalRegisterDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 分页
	 * 
	 * @param ph
	 * @return
	 */
	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}
}
