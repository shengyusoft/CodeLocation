package com.wtkj.rms.dailymaintain.model;

import java.io.Serializable;
import java.util.Date;

public class TaskScheduleVo implements Serializable {

	private static final long serialVersionUID = -6482139333521342662L;

	private Long id;

	private Long taskId;

	private String taskName;

	private Date addTime;// 添加计划的时间

	private Long userId;// 添加计划的用户

	private String userName;

	// 计划产生任务的期限
	private Date startDT;// 计划开始日期
	private Date endDT;// 计划结束日期

	private Date excuteDT;// /任务的执行日期,如果是周期性的,需要自动修改执行时间

	private int sheduleType;// 计划类型 1仅一次 2 每天 3 每周 4 每月

	private int sheduleAdvice;// 提前产生任务 1天 2天 3天

	private int state;// 计划状态:1 进行中..2 已结束(任务到了规定的截止日)

	private boolean autoArrange;// 是否安排任务

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}

	public Date getStartDT() {
		return startDT;
	}

	public void setStartDT(Date startDT) {
		this.startDT = startDT;
	}

	public Date getEndDT() {
		return endDT;
	}

	public void setEndDT(Date endDT) {
		this.endDT = endDT;
	}

	public Date getExcuteDT() {
		return excuteDT;
	}

	public void setExcuteDT(Date excuteDT) {
		this.excuteDT = excuteDT;
	}

	public int getSheduleType() {
		return sheduleType;
	}

	public void setSheduleType(int sheduleType) {
		this.sheduleType = sheduleType;
	}

	public int getSheduleAdvice() {
		return sheduleAdvice;
	}

	public void setSheduleAdvice(int sheduleAdvice) {
		this.sheduleAdvice = sheduleAdvice;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public boolean isAutoArrange() {
		return autoArrange;
	}

	public void setAutoArrange(boolean autoArrange) {
		this.autoArrange = autoArrange;
	}

}
