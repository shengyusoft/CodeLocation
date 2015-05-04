package com.wtkj.rms.process.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.process.model.Process;

public interface ProcessServiceI {

	public List<Process> dataGrid(Process Process, PageFilter ph);

	public Long count(Process Process, PageFilter ph);

	public Process get(Long id);

	public Long add(Process Process, HttpServletRequest request);

	public void edit(Process Process, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<Process> findAll();

	public void deleteByDocIds(String ids);

}
