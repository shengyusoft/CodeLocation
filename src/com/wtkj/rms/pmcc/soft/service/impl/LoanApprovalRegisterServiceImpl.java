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
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.pmcc.soft.model.LoanApprovalRegister;
import com.wtkj.rms.pmcc.soft.service.LoanApprovalRegisterServiceI;

/**
 * 员工借款审批登记
 */
@Service
public class LoanApprovalRegisterServiceImpl implements LoanApprovalRegisterServiceI {

	@Autowired
	private BaseDaoI<LoanApprovalRegister> loanApprovalRegisterDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<LoanApprovalRegister> dataGrid(
			LoanApprovalRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from LoanApprovalRegister t ";
		List<LoanApprovalRegister> l = 
				loanApprovalRegisterDao.find(hql + whereHql(obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(LoanApprovalRegister vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			// 添加其他条件
			// 总经理查询
			String name = vo.getLoan();
			Date zjld = vo.getCreatTime();
			if(name != null && !"".equals(name)){
				hql += " and loan like '%" + name + "%' ";
			}
			if(zjld != null){
				hql += " and creatTime BETWEEN '" + DateUtil.getDate(zjld) + "' and '" + DateUtil.getDate(zjld) + "' ";
			}
			// 出纳查询
			Date cnd = vo.getApproveDate();
			if(cnd != null){
				hql += " and approveDate BETWEEN '" + DateUtil.getDate(cnd) + "' and '" + DateUtil.getDate(cnd) + "' ";
			}
		}

		return hql;
	}
	/**
	 * 查询总数
	 */
	@Override
	public Long count(LoanApprovalRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from LoanApprovalRegister t ";
		return loanApprovalRegisterDao.count("select count(*) " + hql + whereHql(obj, params), params);
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
	public LoanApprovalRegister find(Long id) {
		return loanApprovalRegisterDao.get(LoanApprovalRegister.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(LoanApprovalRegister pdrr) {
		loanApprovalRegisterDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		LoanApprovalRegister p = loanApprovalRegisterDao.get(LoanApprovalRegister.class, id);
		loanApprovalRegisterDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from loan_approval_register where id in (" + ids + ")";
		try {
			loanApprovalRegisterDao.executeSql(sql);
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
	
	/**
	 * 查询巡查次数
	 * @param id
	 * @return
	 */
	@Override
	public LoanApprovalRegister queryByFId(Long id) {
		
		LoanApprovalRegister obj = new LoanApprovalRegister();
		String hql = " from LoanApprovalRegister t where registerId = " + id + " order by patrolNo DESC ";
		List<LoanApprovalRegister> list = loanApprovalRegisterDao.find(hql);
		if(list != null && list.size() > 0){
			obj = list.get(0);
		}
		return obj;
	}

}
