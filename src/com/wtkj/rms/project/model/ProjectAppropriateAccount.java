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

	private int times;// 次数

	private Double toAccountFee;// 到帐金额（元）

	private Date toAccountDT;// 到帐时间

	private Double applyFee;// 申请拨付金额

	private Date applyDT;// 申请拨付时间

	// 以下会计填写
	private Double actualFee;// 实际拨付金额（元）

	private Date actualDT;// 实际拨付时间

	private String payee;// 收款人

	private String bank;// 开户行

	private String accountNum;// 帐号

	private String remark1;// 备注1，工程部填写

	private String remark2;// 备注2，会计部填写

	// 0初始化综合部确认后状态;1工程部提交;会计部提价2
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

}
