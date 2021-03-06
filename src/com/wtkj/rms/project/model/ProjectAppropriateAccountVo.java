package com.wtkj.rms.project.model;

import java.util.Date;

/**
 * 工程款到帐及拨付情况
 * 
 * @author sunsi
 * 
 */

public class ProjectAppropriateAccountVo implements java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;

	private Long id;

	private String projectAppRegName;// 工程款拨付项目

	private Long applierId;

	private String applierName;

	private Long projectAppRegId;// 工程款拨付Id

	private int times;// 次数

	private Double toAccountFee;// 到帐金额（元）

	private Date toAccountDT;// 到帐时间

	private Double applyFee;// 申请拨付金额

	private Date applyDT;// 申请拨付时间

	// 以下会计填写
	private Double actualFee;// 实际到帐金额（元）

	private Double actualPayFee;// 实际支付金额（元）

	private Date actualDT;// 实际到帐时间

	private String payee;// 收款人

	private String bank;// 开户行

	private String accountNum;// 帐号

	private String remark1;// 备注1，工程部填写

	private String remark2;// 备注2，会计部填写

	private String remark3;// 出纳备注

	// 会计办理人
	private Long handlerId1;
	private String handlerIdName1;

	// 出纳办理人信息
	private Long handlerId2;
	private String handlerIdName2;

	// 0初始化综合部确认后状态;1工程部提交;会计部提价2
	private int state;// 状态

	private int option;

	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProjectAppRegName() {
		return projectAppRegName;
	}

	public void setProjectAppRegName(String projectAppRegName) {
		this.projectAppRegName = projectAppRegName;
	}

	public Long getProjectAppRegId() {
		return projectAppRegId;
	}

	public void setProjectAppRegId(Long projectAppRegId) {
		this.projectAppRegId = projectAppRegId;
	}

	public int getTimes() {
		return times;
	}

	public void setTimes(int times) {
		this.times = times;
	}

	public Double getToAccountFee() {
		return toAccountFee;
	}

	public void setToAccountFee(Double toAccountFee) {
		this.toAccountFee = toAccountFee;
	}

	public Date getToAccountDT() {
		return toAccountDT;
	}

	public void setToAccountDT(Date toAccountDT) {
		this.toAccountDT = toAccountDT;
	}

	public Double getApplyFee() {
		return applyFee;
	}

	public void setApplyFee(Double applyFee) {
		this.applyFee = applyFee;
	}

	public Date getApplyDT() {
		return applyDT;
	}

	public void setApplyDT(Date applyDT) {
		this.applyDT = applyDT;
	}

	public Double getActualFee() {
		return actualFee;
	}

	public void setActualFee(Double actualFee) {
		this.actualFee = actualFee;
	}

	public Double getActualPayFee() {
		return actualPayFee;
	}

	public void setActualPayFee(Double actualPayFee) {
		this.actualPayFee = actualPayFee;
	}

	public Date getActualDT() {
		return actualDT;
	}

	public void setActualDT(Date actualDT) {
		this.actualDT = actualDT;
	}

	public String getPayee() {
		return payee;
	}

	public void setPayee(String payee) {
		this.payee = payee;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccountNum() {
		return accountNum;
	}

	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}

	public String getRemark1() {
		return remark1;
	}

	public void setRemark1(String remark1) {
		this.remark1 = remark1;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getRemark3() {
		return remark3;
	}

	public void setRemark3(String remark3) {
		this.remark3 = remark3;
	}

	public Long getHandlerId1() {
		return handlerId1;
	}

	public void setHandlerId1(Long handlerId1) {
		this.handlerId1 = handlerId1;
	}

	public String getHandlerIdName1() {
		return handlerIdName1;
	}

	public void setHandlerIdName1(String handlerIdName1) {
		this.handlerIdName1 = handlerIdName1;
	}

	public Long getHandlerId2() {
		return handlerId2;
	}

	public void setHandlerId2(Long handlerId2) {
		this.handlerId2 = handlerId2;
	}

	public String getHandlerIdName2() {
		return handlerIdName2;
	}

	public void setHandlerIdName2(String handlerIdName2) {
		this.handlerIdName2 = handlerIdName2;
	}

	public Long getApplierId() {
		return applierId;
	}

	public void setApplierId(Long applierId) {
		this.applierId = applierId;
	}

	public String getApplierName() {
		return applierName;
	}

	public void setApplierName(String applierName) {
		this.applierName = applierName;
	}

}
