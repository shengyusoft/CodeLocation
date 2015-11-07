package com.wtkj.rms.bidbondgzzf.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 招投标公司投标保证金缴纳（退还）申请表
 * 
 * @author sunsi
 * 
 */
public class BidBondGzzfVo implements Serializable {

	private static final long serialVersionUID = 1L;

	// type=0 就是缴 号，type=1就是退 号
	private Long id;
	private String idNumber;
	private String projectName;// 项目名称
	private String bidSection;// 标段
	private String bdNames;
	private Double bondFee;// 保证金数额
	private String bondFeeCH;// 保证金数额(中文大写)

	// 收 款 人信息
	private String payeeName;// 收 款 人姓名
	private String payeeAccountName;
	private String payeeBank;// 开户行
	private String payeeAccountNum;// 帐 号
	private String payeeComments;// 附 言
	private Date payeeHandleDT;// 办理时间

	// payer付款人信息
	private String customerName;// 客服姓名
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

	// 出纳办理信息
	private Long handlerId;

	private String handlerName;

	private Date handlerDT;

	// 会计办理信息
	private Long handlerId2;

	private String handlerName2;

	private Date handlerDT2;

	private String remark;

	// 查询使用
	private Date startDT;// 申请时间

	private Date endDT;// 申请时间

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

	// 应退保证金合计=保证金-应扣保证金合计
	private Double backFee;

	private String remark2;// 保证金备注

	private String remark3;// 会计备注

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public String getBdNames() {
		return bdNames;
	}

	public void setBdNames(String bdNames) {
		this.bdNames = bdNames;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
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

	public Double getBackFee() {
		backFee = bondFee == null ? 0 : bondFee;
		if (totalFee != null) {
			backFee = backFee - totalFee;
		}
		return backFee;
	}

	public void setBackFee(Double backFee) {
		this.backFee = backFee;
	}

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

	public Date getStartDT() {
		return startDT;
	}

	public void setStartDT(Date startDT) {
		this.startDT = startDT;
	}

	public Date getEndDT() {
		return endDT;
	}

	public void setEndDT(Date endDT) {
		this.endDT = endDT;
	}

	public Long getHandlerId2() {
		return handlerId2;
	}

	public void setHandlerId2(Long handlerId2) {
		this.handlerId2 = handlerId2;
	}

	public String getHandlerName2() {
		return handlerName2;
	}

	public void setHandlerName2(String handlerName2) {
		this.handlerName2 = handlerName2;
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
	
	private int option = 0;//保存或者提交

	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}
}
