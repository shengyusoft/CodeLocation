package com.wtkj.rms.task.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.common.model.User;
import com.wtkj.rms.task.model.Task;
import com.wtkj.rms.task.model.TaskVo;

public interface TaskServiceI {

	/**
	 * load the list grid of the task
	 * @param Task
	 * @param ph
	 * @param u
	 * @param flag:to control the to do grid or the other grids
	 * @return
	 */
	public List<Task> dataGrid(TaskVo Task, PageFilter ph, User u,int flag);
	
	public Long count(TaskVo Task, PageFilter ph, User u,int flag);

	public Task get(Long id);

	public void add(Task Task, HttpServletRequest request);

	public void edit(Task Task, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public List<Task> findAll();

}
