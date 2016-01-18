package com.wtkj.rms.pmcc.soft.model;

import java.io.Serializable;
import java.util.Date;

import com.wtkj.rms.process.model.ProcessVo;

/**
 * 员工借款审批登记
 */
public class LoanApprovalRegisterVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
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

	// 处理类型
	private String actionType;

	// 总经理最后审批历史记录
	private Long zjl_id;
	// 会计最后审批
	private Long kj_id;
	// 出纳最后审批
	private Long cn_id;

	// 各个步骤最后一步审批意见
	private String zjl_remark;
	private String kj_remark;
	private String cn_remark;

	// 关联流程
	private ProcessVo process_vo;

	// 查询参数
	private Date applyStartDt;
	private Date applyEndDt;

	private Date loanDateSt; // 借款日期开始
	private Date loanDateEt; // 借款日期结束

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public ProcessVo getProcess_vo() {
		return process_vo;
	}

	public void setProcess_vo(ProcessVo process_vo) {
		this.process_vo = process_vo;
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

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public Date getApplyStartDt() {
		return applyStartDt;
	}

	public void setApplyStartDt(Date applyStartDt) {
		this.applyStartDt = applyStartDt;
	}

	public Date getApplyEndDt() {
		return applyEndDt;
	}

	public void setApplyEndDt(Date applyEndDt) {
		this.applyEndDt = applyEndDt;
	}

	public Date getLoanDateSt() {
		return loanDateSt;
	}

	public void setLoanDateSt(Date loanDateSt) {
		this.loanDateSt = loanDateSt;
	}

	public Date getLoanDateEt() {
		return loanDateEt;
	}

	public void setLoanDateEt(Date loanDateEt) {
		this.loanDateEt = loanDateEt;
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

	public String getZjl_remark() {
		return zjl_remark;
	}

	public void setZjl_remark(String zjl_remark) {
		this.zjl_remark = zjl_remark;
	}

	public String getKj_remark() {
		return kj_remark;
	}

	public void setKj_remark(String kj_remark) {
		this.kj_remark = kj_remark;
	}

	public String getCn_remark() {
		return cn_remark;
	}

	public void setCn_remark(String cn_remark) {
		this.cn_remark = cn_remark;
	}

}
