package com.wtkj.rms.dailymaintain.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tuser;

/**
 * 任务产生计划
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "DM_TaskSchedule", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TaskSchedule extends IdEntity implements Serializable {

	private static final long serialVersionUID = -293655645522171826L;

	private Task task;// 关联任务

	private Date addTime;// 添加计划的时间

	private Tuser addUser;// 添加计划的用户

	// 计划产生任务的期限
	private Date startDT;// 任务计划截止日期

	private Date endDT;// 任务计划截止日期

	private Date excuteDT;// /任务的执行日期,如果是周期性的,需要自动修改执行时间

	private int sheduleType;// 计划类型 1仅一次 2 每天 3 每周 4 每月

	private int sheduleAdvice;// 提前产生任务 1天 2天 3天

	private int state;// 计划状态:0 未执行(默认状态) 1 开始 2 进行中..3 已结束(任务到了规定的截止日) 4过期

	private boolean autoArrange;// 产生的任务是否自动安排

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "taskId")
	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public Tuser getAddUser() {
		return addUser;
	}

	public void setAddUser(Tuser addUser) {
		this.addUser = addUser;
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
