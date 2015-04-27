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
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.code.model.po.Contract;

/**
 * 合同管理VO
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "DM_Task", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Task extends IdEntity implements Serializable {

	private static final long serialVersionUID = -293655645522171826L;
	private String name;// 任务名称
	private Tuser sendUser;// 发起人,任务发起人
	private Tuser acceptUser;// 负责人,任务执行人
	private String place;// 任务运维实施地点
	private Tdictionary taskType;// 任务的类型,运维类型(每周,每天,每月..)

	private Date excuteDT;// 任务计划执行日期
	private Date sendDT;// 任务发起日期
	private Date acceptDT;// 运维人员受理日期
	private String startTime;// 开始时间
	private String endTime;// 结束时间

	private String taskModule;// 任务模块

	private String contactUser;// 业主联系人
	private String contactPhone;// 业主联系电话

	private int level;// 1一般 2重要 3紧急
	private int charge;// 是否收费0不收费1收费
	private int taskState;// 0 未启动任务 1 已分配 2已接受 3任务完成 4 未完成待续(处理中)

	private Contract contract;// 合同
	private String money;// 合同金额

	private String describle;// 问题描述
	private String taskdetail;// 维护任务详情
	private String handlerProcess;// 处理过程
	private String handlerResult;// 处理结果
	private int documented;// 是否存档 1是2否
	private String remark;// 备注

	private int chargeState;// 收费状态 0未收费 1已收费

	private int invoiceState;// 发票状态1已开发票0未开发票

	private String attachmentIds;// 主动关联附件
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "sendUserId")
	public Tuser getSendUser() {
		return sendUser;
	}

	public void setSendUser(Tuser sendUser) {
		this.sendUser = sendUser;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "acceptUserId")
	public Tuser getAcceptUser() {
		return acceptUser;
	}

	public void setAcceptUser(Tuser acceptUser) {
		this.acceptUser = acceptUser;
	}

	public String getContactUser() {
		return contactUser;
	}

	public void setContactUser(String contactUser) {
		this.contactUser = contactUser;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "taskTypeId")
	public Tdictionary getTaskType() {
		return taskType;
	}

	public void setTaskType(Tdictionary taskType) {
		this.taskType = taskType;
	}

	public Date getExcuteDT() {
		return excuteDT;
	}

	public void setExcuteDT(Date excuteDT) {
		this.excuteDT = excuteDT;
	}

	public Date getSendDT() {
		return sendDT;
	}

	public void setSendDT(Date sendDT) {
		this.sendDT = sendDT;
	}

	public Date getAcceptDT() {
		return acceptDT;
	}

	public void setAcceptDT(Date acceptDT) {
		this.acceptDT = acceptDT;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getTaskModule() {
		return taskModule;
	}

	public void setTaskModule(String taskModule) {
		this.taskModule = taskModule;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int charge) {
		this.charge = charge;
	}

	public int getTaskState() {
		return taskState;
	}

	public void setTaskState(int taskState) {
		this.taskState = taskState;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contractId")
	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getDescrible() {
		return describle;
	}

	public void setDescrible(String describle) {
		this.describle = describle;
	}

	public String getTaskdetail() {
		return taskdetail;
	}

	public void setTaskdetail(String taskdetail) {
		this.taskdetail = taskdetail;
	}

	public String getHandlerProcess() {
		return handlerProcess;
	}

	public void setHandlerProcess(String handlerProcess) {
		this.handlerProcess = handlerProcess;
	}

	public String getHandlerResult() {
		return handlerResult;
	}

	public void setHandlerResult(String handlerResult) {
		this.handlerResult = handlerResult;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	public int getDocumented() {
		return documented;
	}

	public void setDocumented(int documented) {
		this.documented = documented;
	}

	public int getChargeState() {
		return chargeState;
	}

	public void setChargeState(int chargeState) {
		this.chargeState = chargeState;
	}

	public int getInvoiceState() {
		return invoiceState;
	}

	public void setInvoiceState(int invoiceState) {
		this.invoiceState = invoiceState;
	}

}
