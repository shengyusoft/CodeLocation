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
 * 员工借款审批登记
 */
@Entity
@Table(name = "loan_approval_register", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class LoanApprovalRegister extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String loan; // 借款人
	private Date loanDate; // 借款日期
	private Double loanMoney; // 借款金额
	private String loanMoneyCap; // 借款金额大写
	private String loanReason; // 借款事由
	private String userName; // 户名
	private String bank; // 开户行
	private String account; // 账号
	private String loanRemark; // 借款人备注
	private String managerOpinion; // 总经理审批意见
	private Date approveDate; // 批准时间
	private String managerRemark; // 总经理填写备注
	private String handle; // 办理人
	private Long handleId; // 办理人主键
	private Date handleDate; // 办理时间
	private String handleRemark; // 办理人填写备注
	private Long processId; // 审批流程主键
	private Integer processFlag; // 审批流程标记
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; // 删除标记
	
	private String loanDate_show; // 借款日期，编辑页面显示用
	private String yesOrNo; // 审批是否通过标记, -1 ： 不通过；1 ： 通过
	
	private int option;
	@Transient
	public int getOption() {
		return option;
	}
	public void setOption(int option) {
		this.option = option;
	}
	public Long getProcessId() {
		return processId;
	}
	public void setProcessId(Long processId) {
		this.processId = processId;
	}
	@Transient
	public String getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(String yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	public Long getHandleId() {
		return handleId;
	}
	public void setHandleId(Long handleId) {
		this.handleId = handleId;
	}
	@Transient
	public String getLoanDate_show() {
		return loanDate_show;
	}
	public void setLoanDate_show(String loanDate_show) {
		this.loanDate_show = loanDate_show;
	}
	public String getLoanMoneyCap() {
		return loanMoneyCap;
	}
	public void setLoanMoneyCap(String loanMoneyCap) {
		this.loanMoneyCap = loanMoneyCap;
	}
	public String getLoan() {
		return loan;
	}
	public void setLoan(String loan) {
		this.loan = loan;
	}
	public Date getLoanDate() {
		return loanDate;
	}
	public void setLoanDate(Date loanDate) {
		this.loanDate = loanDate;
	}
	public Double getLoanMoney() {
		return loanMoney;
	}
	public void setLoanMoney(Double loanMoney) {
		this.loanMoney = loanMoney;
	}
	public String getLoanReason() {
		return loanReason;
	}
	public void setLoanReason(String loanReason) {
		this.loanReason = loanReason;
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
	public String getLoanRemark() {
		return loanRemark;
	}
	public void setLoanRemark(String loanRemark) {
		this.loanRemark = loanRemark;
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
