package com.wtkj.rms.dailymaintain.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.code.model.po.Contract;
import com.wtkj.rms.dailymaintain.model.Task;
import com.wtkj.rms.dailymaintain.model.TaskVo;
import com.wtkj.rms.dailymaintain.service.TaskServiceI;

@Service
public class TaskServiceImpl implements TaskServiceI {

	@Autowired
	private BaseDaoI<Task> taskDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Contract> contractDao;

	@Override
	public void add(TaskVo vo, HttpServletRequest request) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		if (sessionInfo.getId() > 0) {
			vo.setSendUserId(sessionInfo.getId());
		}

		Task po = toPo(vo);
		// po.setSendDT(new Date());//发送的时候更新
		taskDao.save(po);
	}

	@Override
	public void delete(Long id) {
		Task p = taskDao.get(Task.class, id);
		taskDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		// 删除无关联的记录
		String sql = "delete t from DM_Task t left join DM_TaskSchedule ts on t.id = ts.taskId"
				+ " where ts.id is NULL and ts.taskState < 2 and t.id in ("
				+ ids + ") ";

		try {
			taskDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Task> checkRelate(String ids) {
		// 判断是否有关联,关联任务计划表
		String sql = "select distinct t.* from DM_Task t left join DM_TaskSchedule ts on t.id = ts.taskId "
				+ "where ts.id is not NULL and t.id in (" + ids + ")";

		List<Task> tasks = null;

		try {
			tasks = taskDao.findBySql(sql, Task.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tasks;
	}

	@Override
	public void edit(TaskVo vo, HttpServletRequest request) {
		Task po = toPo(vo);
		taskDao.update(po);
	}

	@Override
	public TaskVo get(Long id) {
		TaskVo vo = new TaskVo();
		Task po = taskDao.get(Task.class, id);
		vo = toVo(po);
		return vo;

	}

	@Override
	public List<TaskVo> dataGrid(Long userId, TaskVo vo, PageFilter ph) {
		List<TaskVo> pl = new ArrayList<TaskVo>();
		List<Task> l = null;
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Task t ";

		if (ph != null) {
			l = taskDao.find(hql + whereHql(userId, vo, params) + orderHql(ph),
					params, ph.getPage(), ph.getRows());

		} else {
			l = taskDao.find(hql + whereHql(userId, vo, params), params);
		}

		for (Task t : l) {
			TaskVo p = toVo(t);
			// for report
			p.setExcuteDtText(DateUtil.getDateTime("yyyy-MM-dd",
					p.getExcuteDT()));
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(Long userId, TaskVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Task t ";
		return taskDao
				.count("select count(*) " + hql + whereHql(userId, vo, params),
						params);
	}

	private String whereHql(Long userId, TaskVo vo, Map<String, Object> params) {
		String hql = "";
		hql += " where 1=1 ";
		if (vo != null) {
			if (!StringUtils.isEmpty(vo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + vo.getName() + "%%");
			}
			if (vo.getLevel() > 0) {
				hql += " and t.level = :level";
				params.put("level", vo.getLevel());
			}

			if (vo.getCharge() > 0) {
				hql += " and t.charge = :charge";
				params.put("charge", vo.getCharge());

			}

			if (vo.getTaskState() > 0) {
				hql += " and t.taskState = :taskState";
				params.put("taskState", vo.getTaskState());
			}

			if (vo.getDocumented() > 0) {
				hql += " and t.documented = :documented";
				params.put("documented", vo.getDocumented());
			}

			if (vo.getChargeState() > 0) {
				hql += " and t.chargeState = :chargeState";
				params.put("chargeState", vo.getChargeState());
			}

			if (vo.getInvoiceState() > 0) {
				hql += " and t.invoiceState = :invoiceState";
				params.put("invoiceState", vo.getInvoiceState());
			}
		}

		if (userId > 0) {
			Tuser user = userDao.get(Tuser.class, userId);
			Long id = user.getUsertype();
			if (id != null) {
				Tdictionary utype = dictionaryDao.get(Tdictionary.class, id);

				if ("zy".equals(utype.getCode())) {
					// 组员只显示自己的任务,领导,组长,项目经理可以看到所有的task
					hql += " and t.acceptUser.id = :acceptUserId";
					params.put("acceptUserId", user.getId());
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

	public Task toPo(TaskVo vo) {
		Task po = new Task();
		BeanUtils.copyProperties(vo, po);

		if (vo.getAcceptUserId() != null) {
			po.setAcceptUser(userDao.get(Tuser.class, vo.getAcceptUserId()));
		}

		if (vo.getSendUserId() != null) {
			po.setSendUser(userDao.get(Tuser.class, vo.getSendUserId()));
		}

		if (vo.getContractId() != null) {
			po.setContract(contractDao.get(Contract.class, vo.getContractId()));
		}

		if (vo.getTaskTypeId() != null) {
			po.setTaskType(dictionaryDao.get(Tdictionary.class,
					vo.getTaskTypeId()));
		}

		return po;

	}

	public TaskVo toVo(Task po) {
		TaskVo vo = new TaskVo();
		BeanUtils.copyProperties(po, vo);

		if (po.getAcceptUser() != null) {
			vo.setAcceptUserId(po.getAcceptUser().getId());
			vo.setAcceptUserName(po.getAcceptUser().getName());
		}

		if (po.getSendUser() != null) {
			vo.setSendUserId(po.getSendUser().getId());
			vo.setSendUserName(po.getSendUser().getName());
		}

		if (po.getContract() != null) {
			vo.setContractId(po.getContract().getId());
			vo.setContractName(po.getContract().getName());
		}

		if (po.getTaskType() != null) {
			vo.setTaskTypeId(po.getTaskType().getId());
			vo.setTaskTypeName(po.getTaskType().getText());
		}

		return vo;

	}

	@Override
	public void assign(String ids) throws Exception {
		// 批量状态修改 0 未启动任务 1 已分配 2已接受(处理中) 3任务完成 4 未完成待续
		String sendDT = DateUtil.getDate(new Date(), "yyyy-MM-dd HH:mm:ss");
		String sql = "update DM_Task set taskState=1,sendDT='" + sendDT
				+ "' where id in(" + ids + ")";

		System.out.println(sql);
		taskDao.executeSql(sql);
	}

	@Override
	public void accept(String ids) throws Exception {
		// 接受任务 state 0 未启动任务 1 已分配 2已接受(处理中) 3任务完成 4 未完成待续
		String acceptDT = DateUtil.getDate(new Date(), "yyyy-MM-dd HH:mm:ss");
		String sql = "update DM_Task set taskState=2,acceptDT='" + acceptDT
				+ "' where id in(" + ids + ")";
		System.out.println(sql);
		try {
			taskDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<TaskVo> findToDoTask(Long userId) {
		List<TaskVo> pl = new ArrayList<TaskVo>();
		List<Task> l = null;
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Task t left join fetch t.taskType taskType where t.taskState >= 1 and t.taskState < 4 and t.acceptUser.id= "
				+ userId;
		l = taskDao.find(hql, params);
		for (Task t : l) {
			TaskVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<TaskVo> findAssignedTask(TaskVo vo, Long userId) {
		List<TaskVo> pl = new ArrayList<TaskVo>();
		List<Task> l = null;
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Task t where t.taskState >= 1";
		if (userId > 0) {
			Tuser user = userDao.get(Tuser.class, userId);
			Long id = user.getUsertype();
			if (id != null) {
				Tdictionary utype = dictionaryDao.get(Tdictionary.class, id);
				// 领导,项目经理可以看到所有的assign的task
				if ("zz".equals(utype.getCode())) {
					// 组长 看到自己assign的task
					hql += " and t.sendUser.id = :sendUserId";
					params.put("sendUserId", user.getId());
				} else if ("zy".equals(utype.getCode())) {
					// 组员看到自己的task
					hql += " and t.acceptUser.id = :acceptUserId";
					params.put("acceptUserId", user.getId());
				}

				// 用户查找条件
				if (!StringUtils.isEmpty(vo.getAcceptUserName())) {
					hql += " and t.acceptUser.name like :acceptUserName";
					params.put("acceptUserName", "%%" + vo.getAcceptUserName()
							+ "%%");
				}

				if (!StringUtils.isEmpty(vo.getPlace())) {
					hql += " and t.place like :place";
					params.put("place", "%%" + vo.getPlace() + "%%");
				}

			}
		}

		l = taskDao.find(hql, params);
		for (Task t : l) {
			TaskVo p = toVo(t);

			// 设置时间周期
			String excuteDtText = t.getExcuteDT().getMonth() + " 月"
					+ t.getExcuteDT().getDate() + " 日  ";
			String limitText = excuteDtText + p.getStartTime() + "-"
					+ p.getEndTime();
			p.setTimeLimitText(limitText);

			// 到了执行日期还没接受任务
			if (GlobalConstant.TASK_ASSIGNED == t.getTaskState()) {
				Date now = DateUtil.getSdate(new Date());
				Date excuteDt = DateUtil.getSdate(t.getExcuteDT());
				if (now.getTime() > excuteDt.getTime()) {
					p.setAcceptState(1);// 异常
				}
			}

			// 接受了任务 过了 执行日期 没有任务处理的
			if (GlobalConstant.TASK_ACCEPTED == t.getTaskState()) {
				Date now = DateUtil.getSdate(new Date());
				Date excuteDt = DateUtil.getSdate(t.getExcuteDT());
				if (now.getTime() > excuteDt.getTime()) {
					p.setAcceptState(2);// 异常
				}
			}

			// 没到执行日期 做了任务
			if (GlobalConstant.TASK_FINSHED == t.getTaskState()) {
				Date now = DateUtil.getSdate(new Date());
				Date excuteDt = DateUtil.getSdate(t.getExcuteDT());
				if (now.getTime() < excuteDt.getTime()) {
					p.setAcceptState(3);// 异常
				}
			}

			pl.add(p);
		}
		return pl;
	}

	@Override
	public void cancel(String ids) throws Exception {
		// 批量状态修改 0 未分配 1 已分配 2已接受(处理中) 3任务完成 4 未完成待续
		String sql = "update DM_Task set taskState=0 where id in(" + ids + ")";
		System.out.println(sql);
		taskDao.executeSql(sql);

	}

	@Override
	public List<TaskVo> combox() {
		List<TaskVo> pl = new ArrayList<TaskVo>();
		List<Task> l = null;
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Task t";
		l = taskDao.find(hql, params);
		for (Task t : l) {
			TaskVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<Task> findTaskByStates(String states, String ids) {
		String hql = "from Task t where t.taskState in(" + states
				+ ") and t.id in(" + ids + ")";
		List<Task> tasks = taskDao.find(hql);
		return tasks;
	}

}
