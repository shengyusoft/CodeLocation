package com.wtkj.rms.task.model;

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
 * 任务分配
 * 
 * @author
 * 
 */
@Entity
@Table(name = "task", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Task extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 分配人录入
	 */
	private String topic;// 任务主题
	private String desciption;// 任务描述
	private Tuser assigner;// 分配人
	private Date assignDt;// 分配时间
	private Date demandFinishDt;// 要求完成时间
	/**
	 * 任务状态 0:初始化,未分配 1：已分配
	 */
	private Integer assignState = 0;// 分配状态,分配的时候是否选择承办人

	/**
	 * 承办人录入
	 */
	private Tuser receiver;// 承办人,接收人
	private Date receiveDt;// 承接时间
	private Date planFinishDt;// 计划完成时间

	// 0未办理1办理中2已办理
	private int handlerState;// 办理状态,承办人自己选择

	private String finshDesc;// 完成情况描述

	// 1较差2差3一般4好5较好，分配人录入
	private int effectState;// 效果确认,分配人选择

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDesciption() {
		return desciption;
	}

	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "assigner_id")
	public Tuser getAssigner() {
		return assigner;
	}

	public void setAssigner(Tuser assigner) {
		this.assigner = assigner;
	}

	public Date getAssignDt() {
		return assignDt;
	}

	public void setAssignDt(Date assignDt) {
		this.assignDt = assignDt;
	}

	public Date getDemandFinishDt() {
		return demandFinishDt;
	}

	public void setDemandFinishDt(Date demandFinishDt) {
		this.demandFinishDt = demandFinishDt;
	}

	public Integer getAssignState() {
		return assignState;
	}

	public void setAssignState(Integer assignState) {
		this.assignState = assignState;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "receiver_id")
	public Tuser getReceiver() {
		return receiver;
	}

	public void setReceiver(Tuser receiver) {
		this.receiver = receiver;
	}

	public Date getReceiveDt() {
		return receiveDt;
	}

	public void setReceiveDt(Date receiveDt) {
		this.receiveDt = receiveDt;
	}

	public Date getPlanFinishDt() {
		return planFinishDt;
	}

	public void setPlanFinishDt(Date planFinishDt) {
		this.planFinishDt = planFinishDt;
	}

	public int getHandlerState() {
		return handlerState;
	}

	public void setHandlerState(int handlerState) {
		this.handlerState = handlerState;
	}

	public String getFinshDesc() {
		return finshDesc;
	}

	public void setFinshDesc(String finshDesc) {
		this.finshDesc = finshDesc;
	}

	public int getEffectState() {
		return effectState;
	}

	public void setEffectState(int effectState) {
		this.effectState = effectState;
	}

}
