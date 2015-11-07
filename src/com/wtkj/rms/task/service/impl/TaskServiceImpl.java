package com.wtkj.rms.task.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.User;
import com.wtkj.rms.task.model.Task;
import com.wtkj.rms.task.model.TaskVo;
import com.wtkj.rms.task.service.TaskServiceI;

@Service
public class TaskServiceImpl implements TaskServiceI {

	@Autowired
	private BaseDaoI<Task> taskDao;

	@Override
	public void add(Task vo, HttpServletRequest request) {
		taskDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		Task p = taskDao.get(Task.class, id);
		taskDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from task where id in (" + ids + ")";
		try {
			taskDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Task vo, HttpServletRequest request) {
		taskDao.update(vo);
	}

	@Override
	public Task get(Long id) {
		return taskDao.get(Task.class, id);

	}

	@Override
	public List<Task> dataGrid(TaskVo vo, PageFilter ph, User u, int flag) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Task t ";
		List<Task> l = taskDao.find(hql + whereHql(vo, params, u, flag)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<Task> findAll() {
		return taskDao.find(" from Task t ");
	}

	@Override
	public Long count(TaskVo vo, PageFilter ph, User u, int flag) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Task t ";
		return taskDao.count(
				"select count(*) " + hql + whereHql(vo, params, u, flag),
				params);
	}

	private String whereHql(TaskVo vo, Map<String, Object> params, User u,
			int flag) {
		String hql = " where 1=1 ";
		if (flag == 1) {
			// 加载待办
			String roleNames = u.getRoleNames();
			// 如何是任务分配者(即为任务管理员):查看自己分配的任务,超级管理员或者总经理查看所有的任务
			if (roleNames.indexOf("超级管理员") < 0 ) {
				if (roleNames.indexOf("任务管理员") >= 0) {
					// 分配者查看需要效果确认的任务
					hql += " and t.handlerState = 2";
					hql += " and t.assigner.id = :assignerId";
					params.put("assignerId", u.getId());
				} else {
					// 办理者查看已经分配的任务
					hql += " and t.assignState = 1";
					hql += " and t.receiver.id = :receiverId";
					params.put("receiverId", u.getId());
				}
			}else{
				hql += " and (t.handlerState = 2 or t.assignState = 1) ";
			}
		
			return hql;

		}

		if (vo != null) {
			/**
			 * 自动查询
			 */
			if (u != null) {
				String roleNames = u.getRoleNames();
				// 如何是任务分配者(即为任务管理员):查看自己分配的任务,超级管理员或者总经理查看所有的任务
				if (roleNames.indexOf("超级管理员") < 0
						&& roleNames.indexOf("总经理") < 0) {
					if (roleNames.indexOf("任务管理员") >= 0) {
						hql += " and t.assigner.id = :assignerId";
						params.put("assignerId", u.getId());
					} else {
						// 其他的视为普通办理者:查看自己的任务
						hql += " and t.receiver.id = :receiverId";
						params.put("receiverId", u.getId());
					}
				}
			}

			/**
			 * 业务查询
			 */
			// 按分配人姓名模糊查询
			if (!StringUtils.isEmpty(vo.getAssignerName())) {
				hql += " and t.assigner.name like :name";
				params.put("name", "%%" + vo.getAssignerName() + "%%");
			}

			// 按分配时间断查询
			if (vo.getPageAssignDtSt() != null
					&& vo.getPageAssignDtEt() != null) {
				hql += " and t.assignDt >= :startDT";
				hql += " and t.endDT <= :endDT";
				params.put("startDT", vo.getPageAssignDtSt());
				params.put("endDT", vo.getPageAssignDtEt());
			} else if (vo.getPageAssignDtSt() != null
					&& vo.getPageAssignDtEt() == null) {
				hql += " and t.startDT >= :startDT";
				params.put("startDT", vo.getPageAssignDtSt());
			} else if (vo.getPageAssignDtSt() == null
					&& vo.getPageAssignDtEt() != null) {
				hql += " and t.endDT <= :endDT";
				params.put("endDT", vo.getPageAssignDtEt());
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
