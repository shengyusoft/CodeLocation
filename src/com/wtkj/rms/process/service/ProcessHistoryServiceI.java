package com.wtkj.rms.process.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.process.model.ProcessHistory;

public interface ProcessHistoryServiceI {

	public List<ProcessHistory> dataGrid(ProcessHistory ProcessHistory,
			PageFilter ph);

	public Long count(ProcessHistory ProcessHistory, PageFilter ph);

	public ProcessHistory get(Long id);

	public Long add(ProcessHistory ProcessHistory, HttpServletRequest request);

	public void edit(ProcessHistory ProcessHistory, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	/**
	 * 根据流程ID删除流程历史记录信息
	 * 
	 * @param ids
	 */
	public void deleteByProcessId(String ids);

	public List<ProcessHistory> findAll();

}
