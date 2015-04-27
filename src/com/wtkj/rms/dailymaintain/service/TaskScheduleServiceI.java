package com.wtkj.rms.dailymaintain.service;

import java.util.List;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.dailymaintain.model.TaskScheduleVo;

public interface TaskScheduleServiceI {

	public List<TaskScheduleVo> dataGrid(Long id, TaskScheduleVo vo,
			PageFilter ph);

	public Long count(Long id, TaskScheduleVo vo, PageFilter ph);

	public TaskScheduleVo get(Long id);

	public void add(TaskScheduleVo vo);

	public void edit(TaskScheduleVo vo);

	public void delete(Long id);

	public void delete(String ids);
	
	public void excute(TaskScheduleVo vo) throws Exception;

	public void start(String ids);

}
