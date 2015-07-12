package com.wtkj.rms.project.service;

import java.math.BigInteger;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.project.model.ProjectAppropriateAccountVo;

public interface ProjectAppropriateAccountServiceI {

	public List<ProjectAppropriateAccountVo> dataGrid(
			ProjectAppropriateAccountVo ProjectAppropriateAccountVo,
			PageFilter ph);

	public Long count(ProjectAppropriateAccountVo ProjectAppropriateAccountVo,
			PageFilter ph);

	public ProjectAppropriateAccountVo get(Long id);

	public void add(ProjectAppropriateAccountVo ProjectAppropriateAccountVo,
			HttpServletRequest request);

	public void edit(ProjectAppropriateAccountVo ProjectAppropriateAccountVo,
			HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<ProjectAppropriateAccountVo> findAll(String type);

	public int findMaxTimes();

	public BigInteger countByRegId(Long id);

	BigInteger countByRegIdAndState(Long id, int state);

}
