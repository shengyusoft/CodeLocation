package com.wtkj.rms.project.model;

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
 * 工程款到帐及拨付情况
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "ProjectAppropriateAccount", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectAppropriateAccount extends IdEntity implements
		java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;

	private ProjectAppropriateReg projectAppropriateReg;// 关联拨付款项

	private Tuser applier;// 申请人

	private int times;// 次数

	// 工程部填写
	private Double toAccountFee;// 到帐金额（元）业主本次拨付金额
	private Double applyFee;// 申请拨付金额（本次计划支付金额）
	private String payee;// 收款人
	private String bank;// 开户行
	private String accountNum;// 帐号
	private String remark1;// 备注1，工程部填写

	// 以下会计填写
	private Double actualFee;// 实际到帐金额（元）
	private Date actualDT;// 实际到帐时间
	private String remark2;// 会计备注
	private Tuser handler1;// 办理人

	// 以下出纳填写
	private Double actualPayFee;// 实际支付金额（元）(本次拨出金额)
	private Date toAccountDT;// 到帐时间（拨出时间）
	private String remark3;// 出纳备注
	private Tuser handler2;// 办理人

	// 保留字段
	private Date applyDT;// 申请拨付时间（业主本次拨付时间）

	// 0初始化;1工程部提交;2会计部确认;3出纳确认
	private int state;// 状态

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "projectAreg_id")
	public ProjectAppropriateReg getProjectAppropriateReg() {
		return projectAppropriateReg;
	}

	public void setProjectAppropriateReg(
			ProjectAppropriateReg projectAppropriateReg) {
		this.projectAppropriateReg = projectAppropriateReg;
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

	public String getRemark3() {
		return remark3;
	}

	public void setRemark3(String remark3) {
		this.remark3 = remark3;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "handlerId1")
	public Tuser getHandler1() {
		return handler1;
	}

	public void setHandler1(Tuser handler1) {
		this.handler1 = handler1;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "handlerId2")
	public Tuser getHandler2() {
		return handler2;
	}

	public void setHandler2(Tuser handler2) {
		this.handler2 = handler2;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "applierId")
	public Tuser getApplier() {
		return applier;
	}

	public void setApplier(Tuser applier) {
		this.applier = applier;
	}

}
