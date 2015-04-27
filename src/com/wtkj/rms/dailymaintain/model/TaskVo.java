package com.wtkj.rms.dailymaintain.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 合同管理VO
 * 
 * @author sunsi
 * 
 */
public class TaskVo implements Serializable {

	private static final long serialVersionUID = -167835507217276124L;
	private Long id;
	private String name;// 任务名称
	private Long sendUserId;// 发起人,任务发起人
	private String sendUserName;
	private Long acceptUserId;// 负责人,任务执行人
	private String acceptUserName;
	private String place;// 任务运维实施地点
	private Long taskTypeId;// 任务的类型,运维类型(每周,每天,每月..)
	private String taskTypeName;

	private Date excuteDT;// 任务计划执行日期
	private Date sendDT;// 任务发起日期
	private Date acceptDT;// 运维人员受理日期

	private String startTime;// 开始时间
	private String endTime;// 结束时间

	private String taskModule;// 任务模块

	private String contactUser;// 业主联系人
	private String contactPhone;// 业主联系电话

	private int level;// 1一般 2重要 3紧急
	private int charge;// 是否收费

	private int taskState = 0;//
	private Long contractId;// 合同
	private String contractName;
	private String money;// 合同金额

	private String describle;// 问题描述
	private String taskdetail;// 维护任务详情
	private String handlerProcess;// 处理过程
	private String handlerResult;// 处理结果
	private String remark;// 备注
	private int documented;// 是否存档 1是2否
	private int chargeState;
	private int invoiceState;

	// 封装运维定位人员信息
	private int acceptState;// 运维人员工作状态
	private String timeLimitText;// 工作时间期限值

	// report
	private String excuteDtText;

	private String attachmentIds;// 主动关联附件

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
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

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getCharge() {
		return charge;
	}

	public void setCharge(int isCharge) {
		this.charge = isCharge;
	}

	public int getTaskState() {
		return taskState;
	}

	public void setTaskState(int taskState) {
		this.taskState = taskState;
	}

	public Long getSendUserId() {
		return sendUserId;
	}

	public void setSendUserId(Long sendUserId) {
		this.sendUserId = sendUserId;
	}

	public Long getAcceptUserId() {
		return acceptUserId;
	}

	public void setAcceptUserId(Long acceptUserId) {
		this.acceptUserId = acceptUserId;
	}

	public Long getTaskTypeId() {
		return taskTypeId;
	}

	public void setTaskTypeId(Long taskTypeId) {
		this.taskTypeId = taskTypeId;
	}

	public Long getContractId() {
		return contractId;
	}

	public void setContractId(Long contractId) {
		this.contractId = contractId;
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

	public String getSendUserName() {
		return sendUserName;
	}

	public void setSendUserName(String sendUserName) {
		this.sendUserName = sendUserName;
	}

	public String getAcceptUserName() {
		return acceptUserName;
	}

	public void setAcceptUserName(String acceptUserName) {
		this.acceptUserName = acceptUserName;
	}

	public String getTaskTypeName() {
		return taskTypeName;
	}

	public void setTaskTypeName(String taskTypeName) {
		this.taskTypeName = taskTypeName;
	}

	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
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

	public int getAcceptState() {
		return acceptState;
	}

	public void setAcceptState(int acceptState) {
		this.acceptState = acceptState;
	}

	public String getTimeLimitText() {
		return timeLimitText;
	}

	public void setTimeLimitText(String timeLimitText) {
		this.timeLimitText = timeLimitText;
	}

	public String getExcuteDtText() {
		return excuteDtText;
	}

	public void setExcuteDtText(String excuteDtText) {
		this.excuteDtText = excuteDtText;
	}

}
