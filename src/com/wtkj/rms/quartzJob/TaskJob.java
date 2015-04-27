package com.wtkj.rms.quartzJob;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.dailymaintain.model.Task;
import com.wtkj.rms.dailymaintain.model.TaskSchedule;

/**
 * 自动产生(安排)任务
 * 
 * @author sunsi
 * 
 */
@Service("TaskJob")
public class TaskJob {

	@Autowired
	private BaseDaoI<Task> taskDao;

	@Autowired
	private BaseDaoI<TaskSchedule> scheduleDao;

	@Transactional
	public void execute() {
		System.out.println("任务计划执行中........");
		// 条件: 已经启动的计划
		String hql = "from TaskSchedule s left join fetch s.task task where s.state = "
				+ GlobalConstant.STATE_START;

		List<TaskSchedule> tsList = scheduleDao.find(hql, null);

		for (TaskSchedule taskSchedule : tsList) {
			Task task = taskSchedule.getTask();

			Date now = DateUtil.getSdate(new Date());// 当前日期

			Date excuteDT = taskSchedule.getExcuteDT();// 执行日期
			excuteDT = DateUtil.getSdate(excuteDT);// 去除时分秒

			int adviceDay = taskSchedule.getSheduleAdvice();// 提前几天
			Date realExcuteDT = DateUtil.dateAdd(excuteDT,
					Calendar.DAY_OF_MONTH, -adviceDay);
			realExcuteDT = DateUtil.getSdate(excuteDT);// 实际生产任务的日期

			if (taskSchedule.getSheduleType() == GlobalConstant.TASK_SCHEDULETYPE_ONE) {
				// 一次性计划,没有时间限制
				if (now.getTime() >= realExcuteDT.getTime()) {// 到规定的时间产生任务
					// 自动安排的任务更新状态
					if (taskSchedule.isAutoArrange()) {
						task.setTaskState(GlobalConstant.TASK_ASSIGNED);
					} else {
						task.setTaskState(GlobalConstant.DEFAULT);
					}
					taskDao.save(task);

					// 一次性计划,产生任务后 ,计划就结束
					taskSchedule.setState(GlobalConstant.STATE_END);
					scheduleDao.save(taskSchedule);
					return;
				}

			} else {
				// 周期性计划,必须在期限内执行
				Date start = taskSchedule.getStartDT();
				start = DateUtil.getSdate(start);// 开始日期

				Date end = taskSchedule.getEndDT();
				end = DateUtil.getSdate(end);// 截止日期

				if ((now.getTime() >= start.getTime())
						&& (now.getTime() <= end.getTime())) {

					// 到规定的时间产生新任务
					if (now == excuteDT) {
						// 自动安排的任务更新状态
						if (taskSchedule.isAutoArrange()) {
							task.setTaskState(GlobalConstant.TASK_ASSIGNED);
						} else {
							task.setTaskState(GlobalConstant.TASK_NOTSTART);
						}
						task.setExcuteDT(excuteDT);
						taskDao.save(task);

						// 任务计划修改
						if (excuteDT.getTime() == end.getTime()) {
							// 当计划中的任务执行时间和期限相同时,这是计划的最后一次执行
							taskSchedule.setState(GlobalConstant.STATE_END);
							scheduleDao.save(taskSchedule);
							return;
						}

						taskSchedule.setState(GlobalConstant.STATE_ING);
						if (taskSchedule.getSheduleType() == GlobalConstant.TASK_SCHEDULETYPE_DAY) {
							excuteDT = DateUtil.dateAdd(excuteDT,
									Calendar.DAY_OF_YEAR, 1);// 执行日期加一天
						} else if (taskSchedule.getSheduleType() == GlobalConstant.TASK_SCHEDULETYPE_WEEK) {
							excuteDT = DateUtil.dateAdd(excuteDT,
									Calendar.WEEK_OF_YEAR, 1);// 执行日期加一周
						} else if (taskSchedule.getSheduleType() == GlobalConstant.TASK_SCHEDULETYPE_MONTH) {
							excuteDT = DateUtil.dateAdd(excuteDT,
									Calendar.MONTH, 1);// 执行日期加一月
						} else if (taskSchedule.getSheduleType() == GlobalConstant.TASK_SCHEDULETYPE_QUARTER) {
							excuteDT = DateUtil.dateAdd(excuteDT,
									Calendar.MONTH, 3);// 执行日期加三个月
						} else if (taskSchedule.getSheduleType() == GlobalConstant.TASK_SCHEDULETYPE_YEAR) {
							excuteDT = DateUtil.dateAdd(excuteDT,
									Calendar.YEAR, 1);// 执行日期加一年

						}
						taskSchedule.setExcuteDT(excuteDT);// 自动修改计划的下个执行日期
						scheduleDao.save(taskSchedule);
						return;
					}

				} else {
					// 可能由于其他原因(断电,系统瘫痪或者其他特殊原因)导致计划已经过期
					taskSchedule.setState(GlobalConstant.STATE_OVER);
					scheduleDao.save(taskSchedule);

				}

			}

		}

	}

}