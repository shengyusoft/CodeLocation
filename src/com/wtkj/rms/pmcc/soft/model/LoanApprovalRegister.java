package com.wtkj.rms.pmcc.soft.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.rms.process.model.Process;

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
	private String loanPhone; // 借款人电话
	private Date loanDate; // 借款日期
	private Double loanMoney; // 借款金额
	private String loanMoneyCap; // 借款金额大写
	private String loanReason; // 借款事由
	private String userName; // 户名
	private String bank; // 开户行
	private String account; // 账号
	private String loanRemark; // 借款人备注

	// 总经理最后审批历史记录
	private Long zjl_id;
	// 会计最后审批
	private Long kj_id;
	// 出纳最后审批
	private Long cn_id;

	// 关联流程
	private Process process;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "process_id")
	public Process getProcess() {
		return process;
	}

	public void setProcess(Process process) {
		this.process = process;
	}

	public String getLoan() {
		return loan;
	}

	public void setLoan(String loan) {
		this.loan = loan;
	}

	public String getLoanPhone() {
		return loanPhone;
	}

	public void setLoanPhone(String loanPhone) {
		this.loanPhone = loanPhone;
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

	public String getLoanMoneyCap() {
		return loanMoneyCap;
	}

	public void setLoanMoneyCap(String loanMoneyCap) {
		this.loanMoneyCap = loanMoneyCap;
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

	public Long getZjl_id() {
		return zjl_id;
	}

	public void setZjl_id(Long zjl_id) {
		this.zjl_id = zjl_id;
	}

	public Long getKj_id() {
		return kj_id;
	}

	public void setKj_id(Long kj_id) {
		this.kj_id = kj_id;
	}

	public Long getCn_id() {
		return cn_id;
	}

	public void setCn_id(Long cn_id) {
		this.cn_id = cn_id;
	}

}
