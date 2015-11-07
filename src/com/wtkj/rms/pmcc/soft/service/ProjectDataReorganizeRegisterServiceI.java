package com.wtkj.rms.pmcc.soft.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.pmcc.soft.model.ProjectDataReorganizeRegister;

/**
 * 工程资料整编登记
 */
public interface ProjectDataReorganizeRegisterServiceI {

	/**
	 * 列表查询
	 * @param o
	 * @param ph
	 * @return
	 */
	public List<ProjectDataReorganizeRegister> dataGrid(ProjectDataReorganizeRegister obj, PageFilter ph);
	/**
	 * 查询总数，分页用
	 * @param q
	 * @param ph
	 * @return
	 */
	public Long count(ProjectDataReorganizeRegister obj, PageFilter ph);
	/**
	 * 新增保存
	 * @param q
	 * @param request
	 * @return
	 */
	public Long save(ProjectDataReorganizeRegister obj, HttpServletRequest request);
	/**
	 * 通过id查询单个
	 * @param id
	 * @return
	 */
	public ProjectDataReorganizeRegister find(Long id);
	/**
	 * 修改保存
	 * @param q
	 * @param request
	 */
	public void update(ProjectDataReorganizeRegister obj, HttpServletRequest request);
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

}
