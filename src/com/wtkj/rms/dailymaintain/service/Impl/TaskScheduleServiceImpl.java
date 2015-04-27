package com.wtkj.rms.dailymaintain.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.dailymaintain.model.Task;
import com.wtkj.rms.dailymaintain.model.TaskSchedule;
import com.wtkj.rms.dailymaintain.model.TaskScheduleVo;
import com.wtkj.rms.dailymaintain.service.TaskScheduleServiceI;

@Service
public class TaskScheduleServiceImpl implements TaskScheduleServiceI {

	@Autowired
	private BaseDaoI<TaskSchedule> taskScheduleDao;

	@Autowired
	private BaseDaoI<Task> taskDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public void add(TaskScheduleVo vo) {

		// TODO 对于提前几天,如果提前后的日期<当前日期的给予提醒....
		TaskSchedule po = toPo(vo);
		// po.setSendDT(new Date());//发送的时候更新
		taskScheduleDao.save(po);
	}

	@Override
	public void delete(Long id) {
		TaskSchedule p = taskScheduleDao.get(TaskSchedule.class, id);
		taskScheduleDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		// 判断是否有关联,关联任务计划表
		String sql = "delete from DM_TaskSchedule where id in (" + ids + ")";
		try {
			taskScheduleDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(TaskScheduleVo vo) {
		TaskSchedule po = toPo(vo);
		taskScheduleDao.update(po);
	}

	@Override
	public TaskScheduleVo get(Long id) {
		TaskScheduleVo vo = new TaskScheduleVo();
		TaskSchedule po = taskScheduleDao.get(TaskSchedule.class, id);
		vo = toVo(po);
		return vo;

	}

	@Override
	public List<TaskScheduleVo> dataGrid(Long userId, TaskScheduleVo vo,
			PageFilter ph) {
		List<TaskScheduleVo> pl = new ArrayList<TaskScheduleVo>();
		List<TaskSchedule> l = null;
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from TaskSchedule t ";

		if (ph != null) {
			l = taskScheduleDao.find(hql + whereHql(userId, vo, params)
					+ orderHql(ph), params, ph.getPage(), ph.getRows());

		} else {
			l = taskScheduleDao
					.find(hql + whereHql(userId, vo, params), params);
		}

		for (TaskSchedule t : l) {
			TaskScheduleVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(Long userId, TaskScheduleVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from TaskSchedule t ";
		return taskScheduleDao
				.count("select count(*) " + hql + whereHql(userId, vo, params),
						params);
	}

	private String whereHql(Long userId, TaskScheduleVo vo,
			Map<String, Object> params) {
		String hql = "";
		hql += " where 1=1 ";
		if (vo != null) {
			if (!StringUtils.isEmpty(vo.getTaskName())) {
				hql += " and t.task.name like :name";
				params.put("name", "%%" + vo.getTaskName() + "%%");
			}
			if (vo.getState() > 0) {
				hql += " and t.state = :state";
				params.put("state", vo.getState());
			}

		}

		// 此权限归 领导 项目经理 组长,领导可以看到项目经理和组长的计划,项目经理可以看到组长的计划
		if (userId > 0) {
			Tuser user = userDao.get(Tuser.class, userId);
			Long id = user.getUsertype();
			if (id != null) {
				Tdictionary utype = dictionaryDao.get(Tdictionary.class, id);

				if ("zz".equals(utype.getCode())) {
					// 组长只显示自己的任务,领导,组长,项目经理可以看到所有的TaskSchedule
					hql += " and t.addUser.id = :addUserId";
					params.put("addUserId", user.getId());
				}

			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph != null) && (ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public void excute(TaskScheduleVo vo) throws Exception {
		Task task = null;
		if (vo.getTaskId() > 0) {
			task = taskDao.get(Task.class, vo.getTaskId());
		}

		if (vo.isAutoArrange()) {// 自动安排
			task.setTaskState(GlobalConstant.TASK_ASSIGNED);
		}

		// 安排当前所选任务
		taskDao.update(task);

		vo.setState(GlobalConstant.STATE_START);// 更新计划状态为开始

		add(vo);// 保存task

	}

	public TaskSchedule toPo(TaskScheduleVo vo) {
		TaskSchedule po = new TaskSchedule();
		BeanUtils.copyProperties(vo, po);

		if (vo.getTaskId() != null) {
			po.setTask(taskDao.get(Task.class, vo.getTaskId()));
		}

		if (vo.getUserId() != null) {
			po.setAddUser(userDao.get(Tuser.class, vo.getUserId()));
		}

		return po;

	}

	public TaskScheduleVo toVo(TaskSchedule po) {
		TaskScheduleVo vo = new TaskScheduleVo();
		BeanUtils.copyProperties(po, vo);

		if (po.getAddUser() != null) {
			vo.setUserId(po.getAddUser().getId());
			vo.setUserName(po.getAddUser().getName());
		}

		if (po.getTask() != null) {
			vo.setTaskId(po.getTask().getId());
			vo.setTaskName(po.getTask().getName());
		}

		return vo;

	}

	@Override
	public void start(String ids) {

		String sql = "update DM_TaskSchedule set state=1 where id in (" + ids
				+ ")";
		try {
			taskScheduleDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
