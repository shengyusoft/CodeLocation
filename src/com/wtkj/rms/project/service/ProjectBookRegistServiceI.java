package com.wtkj.rms.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.project.model.ProjectBookRegist;

public interface ProjectBookRegistServiceI {

	public List<ProjectBookRegist> dataGrid(
			ProjectBookRegist ProjectBookRegist, PageFilter ph);

	public Long count(ProjectBookRegist ProjectBookRegist, PageFilter ph);

	public Long count(ProjectBookRegist ProjectBookRegist);

	public ProjectBookRegist get(Long id);

	public void add(ProjectBookRegist ProjectBookRegist,
			HttpServletRequest request);

	public void edit(ProjectBookRegist ProjectBookRegist,
			HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<ProjectBookRegist> findAll();

	public long countAll();
}
