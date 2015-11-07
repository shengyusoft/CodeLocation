package com.wtkj.rms.task.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.task.model.TaskDetail;
import com.wtkj.rms.task.service.TaskDetailServiceI;

@Service
public class TaskDetailServiceImpl implements TaskDetailServiceI {

	@Autowired
	private BaseDaoI<TaskDetail> taskDetailDao;

	@Override
	public void add(TaskDetail vo, HttpServletRequest request) {
		taskDetailDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		TaskDetail p = taskDetailDao.get(TaskDetail.class, id);
		taskDetailDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from task_detail where id in (" + ids + ")";
		try {
			taskDetailDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(TaskDetail vo, HttpServletRequest request) {
		taskDetailDao.update(vo);
	}

	@Override
	public TaskDetail get(Long id) {
		return taskDetailDao.get(TaskDetail.class, id);

	}

	@Override
	public List<TaskDetail> dataGrid(TaskDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from TaskDetail t ";
		List<TaskDetail> l = taskDetailDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<TaskDetail> findAll() {
		return taskDetailDao.find(" from TaskDetail t ");
	}

	@Override
	public Long count(TaskDetail vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from TaskDetail t ";
		return taskDetailDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	private String whereHql(TaskDetail vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (vo.getTaskId() != null) {
				hql += " and t.taskId = :taskId";
				params.put("taskId", vo.getTaskId());
			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}
}
