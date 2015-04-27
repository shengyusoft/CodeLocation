package com.wtkj.rms.statistics.service;

import java.util.List;

import com.wtkj.rms.statistics.model.TaskResponseStatistics;

public interface TaskResponseServiceI {
	public List<TaskResponseStatistics> findAll();

}
