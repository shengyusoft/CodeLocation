package com.wtkj.rms.bidbond.model;

import java.io.Serializable;
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
 * 招投标公司投标保证金缴纳申请表
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "BidBond", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class BidBond extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	// 退 号（自动生成，编号规则为年份+月份+编号）
	// 缴 号（自动生成，编号规则为年份+月份+编号）
	// type=0 就是缴 号，type=1就是退 号
	private String idNumber;

	private String projectName;// 项目名称
	private String bidSection;// 标段(ids)
	private Double bondFee;// 保证金数额
	private String bondFeeCH;// 保证金数额(中文大写)

	// 收 款 人信息
	private String payeeName;// 收 款 人姓名
	private String payeeAccountName;
	private String payeeBank;// 开户行
	private String payeeAccountNum;// 帐 号
	private String payeeComments;// 附 言
	private Date payeeHandleDT;// 办理时间(截止时间)

	// payer付款人信息
	private String customerName;// 客服姓名
	private String payerPhone;// 客服电话
	private String payer;// 转款人姓名

	// 申请人信息
	private Tuser applier;// 申请人
	private String applierPhone;// 申请人电话

	private Date applyDT;// 申请时间

	// 财务出纳录入
	private Double toAccountFee;// 到帐金额
	private String toAccountFeeCH;// 到帐金额大写
	private Date toAccountDT;// 到帐时间

	private Double outAccountFee;// 转出金额
	private String outAccountFeeCH;// 转出金额大写
	private Date outAccountDT;// 转出时间

	// 办理人办理时间(财务出纳)
	private Tuser handler;
	private Date handlerDT;

	// 办理人办理时间(财务会计)
	private Tuser handler2;
	private Date handlerDT2;

	// 类型0保证金申请 1保证金退回
	private int type;

	// 0申请人保存,-1普通提交 1出纳提交 2会计提交,>1不能修改
	private int state;

	private String remark;// 备注

	/**
	 * 应扣保证金费用明细
	 */
	private Double luFee;// 路费
	private Double zsFee;// 住宿费
	private Double zzFee;// 资质费
	private Double bsFee;// 标书费
	private Double ysFee;// 预算费

	// 自定义表头
	private String head1;
	private String head2;
	private String head3;
	private Double head1Fee;
	private Double head2Fee;
	private Double head3Fee;

	// 验证不能超过保证金
	private Double totalFee;// 应扣保证金合计

	private String remark2;// 保证金备注(财务出纳备注)

	private String remark3;// 保证金备注(财务会计备注)

	private String projectType;// 项目类型
	
	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	
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

	public String getPayeeName() {
		return payeeName;
	}

	public void setPayeeName(String payeeName) {
		this.payeeName = payeeName;
	}

	public String getPayeeAccountName() {
		return payeeAccountName;
	}

	public void setPayeeAccountName(String payeeAccountName) {
		this.payeeAccountName = payeeAccountName;
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

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "applierId")
	public Tuser getApplier() {
		return applier;
	}

	public void setApplier(Tuser applier) {
		this.applier = applier;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "handlerId")
	public Tuser getHandler() {
		return handler;
	}

	public void setHandler(Tuser handler) {
		this.handler = handler;
	}

	public Date getHandlerDT() {
		return handlerDT;
	}

	public void setHandlerDT(Date handlerDT) {
		this.handlerDT = handlerDT;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Double getLuFee() {
		return luFee;
	}

	public void setLuFee(Double luFee) {
		this.luFee = luFee;
	}

	public Double getZsFee() {
		return zsFee;
	}

	public void setZsFee(Double zsFee) {
		this.zsFee = zsFee;
	}

	public Double getZzFee() {
		return zzFee;
	}

	public void setZzFee(Double zzFee) {
		this.zzFee = zzFee;
	}

	public Double getBsFee() {
		return bsFee;
	}

	public void setBsFee(Double bsFee) {
		this.bsFee = bsFee;
	}

	public Double getYsFee() {
		return ysFee;
	}

	public void setYsFee(Double ysFee) {
		this.ysFee = ysFee;
	}

	public String getHead1() {
		return head1;
	}

	public void setHead1(String head1) {
		this.head1 = head1;
	}

	public String getHead2() {
		return head2;
	}

	public void setHead2(String head2) {
		this.head2 = head2;
	}

	public String getHead3() {
		return head3;
	}

	public void setHead3(String head3) {
		this.head3 = head3;
	}

	public Double getHead1Fee() {
		return head1Fee;
	}

	public void setHead1Fee(Double head1Fee) {
		this.head1Fee = head1Fee;
	}

	public Double getHead2Fee() {
		return head2Fee;
	}

	public void setHead2Fee(Double head2Fee) {
		this.head2Fee = head2Fee;
	}

	public Double getHead3Fee() {
		return head3Fee;
	}

	public void setHead3Fee(Double head3Fee) {
		this.head3Fee = head3Fee;
	}

	public Double getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "handlerId2")
	public Tuser getHandler2() {
		return handler2;
	}

	public void setHandler2(Tuser handler) {
		this.handler2 = handler;
	}

	public Date getHandlerDT2() {
		return handlerDT2;
	}

	public void setHandlerDT2(Date handlerDT2) {
		this.handlerDT2 = handlerDT2;
	}

	public String getRemark3() {
		return remark3;
	}

	public void setRemark3(String remark3) {
		this.remark3 = remark3;
	}

}
