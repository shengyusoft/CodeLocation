package com.wtkj.rms.pmcc.soft.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.pmcc.soft.model.ProjectPatrolRegister;

/**
 * 工程巡查登记
 */
public interface ProjectPatrolRegisterServiceI {

	/**
	 * 列表查询
	 * @param o
	 * @param ph
	 * @return
	 */
	public List<ProjectPatrolRegister> dataGrid(ProjectPatrolRegister obj, PageFilter ph);
	/**
	 * 查询总数，分页用
	 * @param q
	 * @param ph
	 * @return
	 */
	public Long count(ProjectPatrolRegister obj, PageFilter ph);
	/**
	 * 新增保存
	 * @param q
	 * @param request
	 * @return
	 */
	public Long save(ProjectPatrolRegister obj, HttpServletRequest request);
	/**
	 * 通过id查询单个
	 * @param id
	 * @return
	 */
	public ProjectPatrolRegister find(Long id);
	/**
	 * 修改保存
	 * @param q
	 * @param request
	 */
	public void update(ProjectPatrolRegister obj, HttpServletRequest request);
	/**
	 * 通过主键单个删除
	 * @param id
	 */
	public void delete(Long id);
	/**
	 * 批量删除
	 * @param ids
	 */
	public void delete(String ids);
	/**
	 * 查询所有
	 * @return
	 */
	public List<ProjectPatrolRegister> queryToCombox();

}
