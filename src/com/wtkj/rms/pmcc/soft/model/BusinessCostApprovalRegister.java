package com.wtkj.rms.pmcc.soft.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 业务费用支付审批登记
 */
@Entity
@Table(name = "business_cost_approval_register", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class BusinessCostApprovalRegister extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String costName; // 费用名称
	private Date applypayDate; // 申请支付时间
	private String reason; // 事由
	private Double applyCost; // 申请支付金额(元)
	private String applyCostCap; // 申请支付金额(元)大写
	private String userName; // 户名
	private String bank; // 开户行
	private String account; // 账号
	private String contactPerson; // 联系人
	private String contactWay; // 联系方式
	private String applicant; // 申请人
	private Date applicantDate; // 申请时间
	private String paymentRemark; // 收款人信息备注
	private String managerOpinion; // 总经理审批意见
	private Long managerId; // 总经理主键
	private Date approveDate; // 批准时间
	private String managerRemark; // 总经理填写备注
	private String handle; // 办理人
	private Long handleId; // 办理人主键
	private Date handleDate; // 办理时间
	private String handleRemark; // 办理人填写备注
	private Long processId; // 审批流程主键
	private Integer processFlag; // 审批流程标记 0：申请人申请完成；1：总经理审批通过；-1：总经理审批不通过；2：出纳审批通过；-2：出纳审批不通过
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; // 删除标记
	
	private String yesOrNo; // 审批是否通过标记, -1 ： 不通过；1 ： 通过
	/*前台显示用*/
	private String name; // 申请人
	private Date show_date; // 申请日期显示
	private int option;
	@Transient
	public int getOption() {
		return option;
	}
	public void setOption(int option) {
		this.option = option;
	}
	@Transient
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Transient
	public Date getShow_date() {
		return show_date;
	}
	public void setShow_date(Date show_date) {
		this.show_date = show_date;
	}
	@Transient
	public String getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(String yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	public Long getProcessId() {
		return processId;
	}
	public void setProcessId(Long processId) {
		this.processId = processId;
	}
	public String getApplyCostCap() {
		return applyCostCap;
	}
	public void setApplyCostCap(String applyCostCap) {
		this.applyCostCap = applyCostCap;
	}
	public Long getManagerId() {
		return managerId;
	}
	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}
	public Long getHandleId() {
		return handleId;
	}
	public void setHandleId(Long handleId) {
		this.handleId = handleId;
	}
	public String getCostName() {
		return costName;
	}
	public void setCostName(String costName) {
		this.costName = costName;
	}
	public Date getApplypayDate() {
		return applypayDate;
	}
	public void setApplypayDate(Date applypayDate) {
		this.applypayDate = applypayDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Double getApplyCost() {
		return applyCost;
	}
	public void setApplyCost(Double applyCost) {
		this.applyCost = applyCost;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBank() {
		return bank;
	}
	public void setBank(String bank) {
		this.bank = bank;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getContactWay() {
		return contactWay;
	}
	public void setContactWay(String contactWay) {
		this.contactWay = contactWay;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public Date getApplicantDate() {
		return applicantDate;
	}
	public void setApplicantDate(Date applicantDate) {
		this.applicantDate = applicantDate;
	}
	public String getPaymentRemark() {
		return paymentRemark;
	}
	public void setPaymentRemark(String paymentRemark) {
		this.paymentRemark = paymentRemark;
	}
	public String getManagerOpinion() {
		return managerOpinion;
	}
	public void setManagerOpinion(String managerOpinion) {
		this.managerOpinion = managerOpinion;
	}
	public Date getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}
	public String getManagerRemark() {
		return managerRemark;
	}
	public void setManagerRemark(String managerRemark) {
		this.managerRemark = managerRemark;
	}
	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	public Date getHandleDate() {
		return handleDate;
	}
	public void setHandleDate(Date handleDate) {
		this.handleDate = handleDate;
	}
	public String getHandleRemark() {
		return handleRemark;
	}
	public void setHandleRemark(String handleRemark) {
		this.handleRemark = handleRemark;
	}
	public Integer getProcessFlag() {
		return processFlag;
	}
	public void setProcessFlag(Integer processFlag) {
		this.processFlag = processFlag;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
}
