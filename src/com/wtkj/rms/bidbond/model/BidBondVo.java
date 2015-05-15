package com.wtkj.rms.bidbond.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 招投标公司投标保证金缴纳（退还）申请表
 * 
 * @author sunsi
 * 
 */
public class BidBondVo implements Serializable {

	private static final long serialVersionUID = 1L;

	// type=0 就是缴 号，type=1就是退 号
	private String idNumber;
	private String projectName;// 项目名称
	private String bidSection;// 标段
	private Double bondFee;// 保证金数额
	private String bondFeeCH;// 保证金数额(中文大写)

	// 收 款 人信息
	private String payeeAccountName;
	private String payeeBank;// 开户行
	private String payeeAccountNum;// 帐 号
	private String payeeComments;// 附 言
	private Date payeeHandleDT;// 办理时间

	// payer付款人信息
	private String payer;
	private String payerPhone;

	// 申请人信息
	private Long applierId;

	private String applierName;

	private String applierPhone;// 申请人电话

	private Date applyDT;// 申请时间

	// 财务出纳录入
	private Double toAccountFee;// 到帐金额
	private String toAccountFeeCH;// 到帐金额大写
	private Date toAccountDT;// 到帐时间

	private Double outAccountFee;// 转出金额
	private String outAccountFeeCH;// 转出金额大写
	private Date outAccountDT;// 转出时间

	// 办理人办理时间
	private Long handlerId;

	private String handlerName;

	private Date handlerDT;

	// 类型0申请 1退回
	private int type;

	// 0普通人员提交 1财务提交，财务提交后不可更改
	private int state;

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getState() {
		return state;
	}

	public String getPayeeAccountName() {
		return payeeAccountName;
	}

	public void setPayeeAccountName(String payeeAccountName) {
		this.payeeAccountName = payeeAccountName;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getBidSection() {
		return bidSection;
	}

	public void setBidSection(String bidSection) {
		this.bidSection = bidSection;
	}

	public Double getBondFee() {
		return bondFee;
	}

	public void setBondFee(Double bondFee) {
		this.bondFee = bondFee;
	}

	public String getBondFeeCH() {
		return bondFeeCH;
	}

	public void setBondFeeCH(String bondFeeCH) {
		this.bondFeeCH = bondFeeCH;
	}

	public String getPayeeBank() {
		return payeeBank;
	}

	public void setPayeeBank(String payeeBank) {
		this.payeeBank = payeeBank;
	}

	public String getPayeeAccountNum() {
		return payeeAccountNum;
	}

	public void setPayeeAccountNum(String payeeAccountNum) {
		this.payeeAccountNum = payeeAccountNum;
	}

	public String getPayeeComments() {
		return payeeComments;
	}

	public void setPayeeComments(String payeeComments) {
		this.payeeComments = payeeComments;
	}

	public Date getPayeeHandleDT() {
		return payeeHandleDT;
	}

	public void setPayeeHandleDT(Date payeeHandleDT) {
		this.payeeHandleDT = payeeHandleDT;
	}

	public String getPayer() {
		return payer;
	}

	public void setPayer(String payer) {
		this.payer = payer;
	}

	public String getPayerPhone() {
		return payerPhone;
	}

	public void setPayerPhone(String payerPhone) {
		this.payerPhone = payerPhone;
	}

	public String getApplierPhone() {
		return applierPhone;
	}

	public void setApplierPhone(String applierPhone) {
		this.applierPhone = applierPhone;
	}

	public Date getApplyDT() {
		return applyDT;
	}

	public void setApplyDT(Date applyDT) {
		this.applyDT = applyDT;
	}

	public Double getToAccountFee() {
		return toAccountFee;
	}

	public void setToAccountFee(Double toAccountFee) {
		this.toAccountFee = toAccountFee;
	}

	public String getToAccountFeeCH() {
		return toAccountFeeCH;
	}

	public void setToAccountFeeCH(String toAccountFeeCH) {
		this.toAccountFeeCH = toAccountFeeCH;
	}

	public Date getToAccountDT() {
		return toAccountDT;
	}

	public void setToAccountDT(Date toAccountDT) {
		this.toAccountDT = toAccountDT;
	}

	public Double getOutAccountFee() {
		return outAccountFee;
	}

	public void setOutAccountFee(Double outAccountFee) {
		this.outAccountFee = outAccountFee;
	}

	public String getOutAccountFeeCH() {
		return outAccountFeeCH;
	}

	public void setOutAccountFeeCH(String outAccountFeeCH) {
		this.outAccountFeeCH = outAccountFeeCH;
	}

	public Date getOutAccountDT() {
		return outAccountDT;
	}

	public void setOutAccountDT(Date outAccountDT) {
		this.outAccountDT = outAccountDT;
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

	public Long getHandlerId() {
		return handlerId;
	}

	public void setHandlerId(Long handlerId) {
		this.handlerId = handlerId;
	}

	public String getHandlerName() {
		return handlerName;
	}

	public void setHandlerName(String handlerName) {
		this.handlerName = handlerName;
	}

	public Date getHandlerDT() {
		return handlerDT;
	}

	public void setHandlerDT(Date handlerDT) {
		this.handlerDT = handlerDT;
	}

}
