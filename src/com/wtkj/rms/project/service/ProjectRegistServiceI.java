package com.wtkj.rms.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.project.model.ProjectRegist;

public interface ProjectRegistServiceI {

	public List<ProjectRegist> dataGrid(ProjectRegist p, PageFilter ph);

	public Long count(ProjectRegist p, PageFilter ph);

	public ProjectRegist get(String id);

	public void add(ProjectRegist p, HttpServletRequest request);

	public void edit(ProjectRegist p, HttpServletRequest request);

	public void delete(String ids);
}
