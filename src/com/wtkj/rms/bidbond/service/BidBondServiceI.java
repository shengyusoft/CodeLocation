package com.wtkj.rms.bidbond.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.code.model.vo.ProjectVo;

public interface BidBondServiceI {

	public List<ProjectVo> dataGrid(ProjectVo ProjectVo, PageFilter ph);

	public Long count(ProjectVo ProjectVo, PageFilter ph);

	public ProjectVo get(Long id);

	public void add(ProjectVo ProjectVo, HttpServletRequest request);

	public void edit(ProjectVo ProjectVo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);
	
	public List<ProjectVo> findAll();

	public List<Project> checkRelate(String ids);
}
