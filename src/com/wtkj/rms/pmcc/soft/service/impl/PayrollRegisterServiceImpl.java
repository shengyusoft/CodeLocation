package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.User;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.pmcc.soft.model.PayrollRegister;
import com.wtkj.rms.pmcc.soft.service.PayrollRegisterServiceI;

/**
 * 工程巡查记录
 */
@Service
public class PayrollRegisterServiceImpl implements PayrollRegisterServiceI {

	@Autowired
	private BaseDaoI<PayrollRegister> payrollRegisterDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<PayrollRegister> dataGrid(User user, 
			PayrollRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PayrollRegister t ";
		List<PayrollRegister> l = 
				payrollRegisterDao.find(hql + whereHql(user, obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(User user,PayrollRegister vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			// 流程标记
			if (user != null) {
				// 申请人查看自己申请的
				if (user.getRoleNames().indexOf("会计") >= 0) {
					// 如果申请人是别人则审批人查看已到到达自己的任务,如果是自己则显示申请人是自己的
					hql += " and (t.processFlag >= :state or (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId)";
					params.put("state", 1);
					params.put("userId", user.getId());
				} else if (user.getRoleNames().indexOf("总经理") >= 0) {
					hql += " and (t.processFlag >= :state or (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId)";
					params.put("userId", user.getId());
					params.put("state", 2);
				} else if (user.getRoleNames().indexOf("出纳") >= 0) {
					hql += " and (t.processFlag >= :state or (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId)";
					params.put("userId", user.getId());
					params.put("state", 3);
				} else if(!"admin".equals(user.getName())) {
					//其他类型都视为普通员工
					hql += " and (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId";
					params.put("userId", user.getId());
				}
			}
			// 按月份搜索
			Date t = vo.getCreatTime();
			if(t != null){
				Date st = DateUtil.getMonthStartTime(vo.getCreatTime());
				Date et = DateUtil.getMonthEndTime(vo.getCreatTime());
				hql += " and creatTime BETWEEN '" + DateUtil.getDate(st) + "' and '" + DateUtil.getDate(et) + "' ";
			}
			
		}

		return hql;
	}
	/**
	 * 查询总数
	 */
	@Override
	public Long count(User user, PayrollRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PayrollRegister t ";
		return payrollRegisterDao.count("select count(*) " + hql + whereHql(user,obj, params), params);
	}
	/**
	 * 新增保存
	 */
	@Override
	public Long add(PayrollRegister pdrr, HttpServletRequest request) {
		return (Long) payrollRegisterDao.save(pdrr);
	}
	/**
	 * 通过id查询
	 */
	@Override
	public PayrollRegister find(Long id) {
		return payrollRegisterDao.get(PayrollRegister.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(PayrollRegister pdrr) {
		payrollRegisterDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		PayrollRegister p = payrollRegisterDao.get(PayrollRegister.class, id);
		payrollRegisterDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from payroll_register where id in (" + ids + ")";
		try {
			payrollRegisterDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 分页
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
