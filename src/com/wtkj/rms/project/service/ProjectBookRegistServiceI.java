package com.wtkj.rms.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.project.model.ProjectBookRegistVo;

public interface ProjectBookRegistServiceI {

	public List<ProjectBookRegistVo> dataGrid(
			ProjectBookRegistVo ProjectBookRegistVo, PageFilter ph);

	public Long count(ProjectBookRegistVo ProjectBookRegistVo, PageFilter ph);

	public Long count(ProjectBookRegistVo ProjectBookRegistVo);

	public ProjectBookRegistVo get(Long id);

	public void add(ProjectBookRegistVo ProjectBookRegistVo,
			HttpServletRequest request);

	public void edit(ProjectBookRegistVo ProjectBookRegistVo,
			HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<ProjectBookRegistVo> findAll();

	public long countAll();
}
