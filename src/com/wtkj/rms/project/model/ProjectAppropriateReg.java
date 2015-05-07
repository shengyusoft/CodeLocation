package com.wtkj.rms.project.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 工程款拨付登记
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "ProjectAppropriateReg", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectAppropriateReg extends IdEntity implements
		java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;
	private String projectName;// 项目名称

	// 联系人信息，姓名,电话,身份证
	private String contactName;
	private String contactTel;
	private String contactIdCard;

	// 收款人信息
	private String payee;// 收款人
	private String bank;// 开户行
	private String accountNum;// 帐号

	private Double managerFeeRate;// 管理费比例（%）
	private Double managerFee;// 管理费数额（元）

	private Double bidPrice;// 中标价
	private Date bidDT;// 中标日期

	private Double contractDuration;// 合同工期(年)

	// 0初始化(待提交) 1工程部提交(待确认) 2综合部确认(已确认)
	private int state;

	private String remark;

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

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getContactName() {
		return contactName;
	}

	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	public String getContactTel() {
		return contactTel;
	}

	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}

	public String getContactIdCard() {
		return contactIdCard;
	}

	public void setContactIdCard(String contactIdCard) {
		this.contactIdCard = contactIdCard;
	}

	public Double getManagerFeeRate() {
		return managerFeeRate;
	}

	public void setManagerFeeRate(Double managerFeeRate) {
		this.managerFeeRate = managerFeeRate;
	}

	public Double getManagerFee() {
		return managerFee;
	}

	public void setManagerFee(Double managerFee) {
		this.managerFee = managerFee;
	}

	public Double getBidPrice() {
		return bidPrice;
	}

	public void setBidPrice(Double bidPrice) {
		this.bidPrice = bidPrice;
	}

	public Date getBidDT() {
		return bidDT;
	}

	public void setBidDT(Date bidDT) {
		this.bidDT = bidDT;
	}

	public Double getContractDuration() {
		return contractDuration;
	}

	public void setContractDuration(Double contractDuration) {
		this.contractDuration = contractDuration;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
