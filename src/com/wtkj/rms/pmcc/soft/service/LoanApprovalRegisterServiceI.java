package com.wtkj.rms.pmcc.soft.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.User;
import com.wtkj.rms.pmcc.soft.model.LoanApprovalRegister;
import com.wtkj.rms.pmcc.soft.model.LoanApprovalRegisterVo;

/**
 * 员工借款审批登记
 */
public interface LoanApprovalRegisterServiceI {

	/**
	 * 列表查询
	 * 
	 * @param o
	 * @param ph
	 * @return
	 */
	public List<LoanApprovalRegister> dataGrid(User user,
			LoanApprovalRegisterVo obj, PageFilter ph);

	/**
	 * 查询总数，分页用
	 * 
	 * @param q
	 * @param ph
	 * @return
	 */
	public Long count(User user, LoanApprovalRegisterVo obj, PageFilter ph);

	/**
	 * 新增保存
	 * 
	 * @param q
	 * @param request
	 * @return
	 */
	public Long add(LoanApprovalRegister obj, HttpServletRequest request);

	/**
	 * 通过id查询单个
	 * 
	 * @param id
	 * @return
	 */
	public LoanApprovalRegister get(Long id);

	/**
	 * 修改保存
	 * 
	 * @param q
	 * @param request
	 */
	public void edit(LoanApprovalRegister obj);

	/**
	 * 批量删除
	 * 
	 * @param ids
	 */
	public void delete(String ids);

}
