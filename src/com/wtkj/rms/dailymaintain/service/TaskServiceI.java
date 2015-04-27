package com.wtkj.rms.dailymaintain.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.dailymaintain.model.Task;
import com.wtkj.rms.dailymaintain.model.TaskVo;

public interface TaskServiceI {

	public List<TaskVo> dataGrid(Long userId, TaskVo vo, PageFilter ph);

	public Long count(Long userId, TaskVo vo, PageFilter ph);

	public TaskVo get(Long id);

	public void add(TaskVo vo, HttpServletRequest request);

	public void edit(TaskVo vo, HttpServletRequest request);

	public void delete(Long id);

	public void delete(String ids);

	public void assign(String ids) throws Exception;

	public void accept(String ids) throws Exception;

	public List<TaskVo> findToDoTask(Long id);

	public void cancel(String ids) throws Exception;

	public List<TaskVo> combox();

	public List<Task> checkRelate(String ids);

	/**
	 * 根据登录用户查找自己assign出去的task admin 或者领导可以看到所有assign出去的task
	 * 
	 * @param id
	 * @return
	 */
	public List<TaskVo> findAssignedTask(TaskVo vo, Long id);

	/**
	 * 根据状态取任务
	 * 
	 * @param ids 选中的记录
	 * @param states 任务状态组以逗号为分隔符,比如1,2,3
	 * @return
	 */
	public List<Task> findTaskByStates(String states, String ids);

}
