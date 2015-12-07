package com.wtkj.rms.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.project.model.ProjectBid;

public interface ProjectBidServiceI {

	public List<ProjectBid> dataGrid(ProjectBid p, PageFilter ph);
	
	public List<ProjectBid> findAll();
	
	public List<ProjectBid> find(ProjectBid p);

	public Long count(ProjectBid p, PageFilter ph);

	public ProjectBid get(String id);
	
	public void add(ProjectBid p, HttpServletRequest request);

	public void edit(ProjectBid p, HttpServletRequest request);

	public void delete(String ids);
}
