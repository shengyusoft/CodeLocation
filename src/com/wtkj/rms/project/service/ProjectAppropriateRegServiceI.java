package com.wtkj.rms.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.project.model.ProjectAppropriateReg;

public interface ProjectAppropriateRegServiceI {

	public List<ProjectAppropriateReg> dataGrid(ProjectAppropriateReg p,
			PageFilter ph);

	public Long count(ProjectAppropriateReg p, PageFilter ph);

	public ProjectAppropriateReg get(Long id);

	public void add(ProjectAppropriateReg p, HttpServletRequest request);

	public void edit(ProjectAppropriateReg p, HttpServletRequest request);

	public void delete(String ids);

	public void batchUpdateState(String ids, int i);
}
