package com.wtkj.rms.statistics.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.statistics.model.TaskResponseStatistics;
import com.wtkj.rms.statistics.service.TaskResponseServiceI;

@Service
public class TaskResponseServiceImpl implements TaskResponseServiceI {

	@Autowired
	private BaseDaoI<TaskResponseStatistics> taskResponseDao;

	@Override
	public List<TaskResponseStatistics> findAll() {
		List<TaskResponseStatistics> s = taskResponseDao
				.find("from TaskResponseStatistics");
		return s;
	}

}
