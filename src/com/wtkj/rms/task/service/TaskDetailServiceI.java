package com.wtkj.rms.task.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.task.model.TaskDetail;

public interface TaskDetailServiceI {

	public List<TaskDetail> dataGrid(TaskDetail TaskDetail, PageFilter ph);

	public Long count(TaskDetail TaskDetail, PageFilter ph);

	public TaskDetail get(Long id);

	public void add(TaskDetail TaskDetail, HttpServletRequest request);

	public void edit(TaskDetail TaskDetail, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<TaskDetail> findAll();

}
