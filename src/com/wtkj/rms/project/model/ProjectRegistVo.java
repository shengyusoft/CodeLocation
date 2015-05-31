package com.wtkj.rms.project.model;

import java.util.Date;

import com.wtkj.common.model.Tdictionary;

/**
 * 项目报名登记管理(项目开标登记)
 * 
 * @author sunsi
 * 
 */

public class ProjectRegistVo implements java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;
	private Long id;
	private Tdictionary company;// 公司名称
	private String projectName;// 项目名称

	// 省市县区划
	private Tdictionary provice;
	private Tdictionary city;
	private Tdictionary county;

	private String bds;// 标段多选(ids)
	private String bdNames;// 标段多选显示用(ids)

	private String qualifyRequirement;// 资质要求多选(ids)
	private String qualifyRequirementNames;// 资质要求多选显示(ids)

	private Tdictionary projectMgr;// 项目经理
	private Tdictionary techniqueMgr;// 技术负责人

	// A证,B证,C证
	private Certificate certificateA;// 技术负责人
	private Certificate certificateB;// 技术负责人
	private Certificate certificateC;// 技术负责人

	private String member5Cards; // 五大员证多选(ids)
	private String member5CardNames; // 五大员证多选显示用(ids)

	private Long delegatorId;

	private String delegatorName;

	private Date registDT;// 报名时间
	private String bidder;// 投标人姓名
	private String contract;// 联系方式
	/**
	 * 费用明细
	 */
	// 路费（报名，开标,两个自定义）
	private Double bmFee;
	private Double kbFee;
	private String head1;
	private String head2;
	private Double head1Fee;
	private Double head2Fee;

	// 资质费,标书费,预算费
	private Double zzFee;
	private Double bsFee;
	private Double ysFee;

	// 人员出场费（项目经理，法人,两个自定义）
	private Double xmjlFee;
	private Double frFee;
	private String head3;
	private String head4;
	private Double head3Fee;
	private Double head4Fee;
	private Double otherFee;

	private Double totalFee;

	private String remark;

	// 0项目登记 1项目开标登记
	private int type;

	private Date st;
	private Date et;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Tdictionary getCompany() {
		return company;
	}

	public void setCompany(Tdictionary company) {
		this.company = company;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Tdictionary getProvice() {
		return provice;
	}

	public void setProvice(Tdictionary provice) {
		this.provice = provice;
	}

	public Tdictionary getCity() {
		return city;
	}

	public void setCity(Tdictionary city) {
		this.city = city;
	}

	public Tdictionary getCounty() {
		return county;
	}

	public void setCounty(Tdictionary county) {
		this.county = county;
	}

	public String getQualifyRequirement() {
		return qualifyRequirement;
	}

	public void setQualifyRequirement(String qualifyRequirement) {
		this.qualifyRequirement = qualifyRequirement;
	}

	public Tdictionary getProjectMgr() {
		return projectMgr;
	}

	public void setProjectMgr(Tdictionary projectMgr) {
		this.projectMgr = projectMgr;
	}

	public Tdictionary getTechniqueMgr() {
		return techniqueMgr;
	}

	public void setTechniqueMgr(Tdictionary techniqueMgr) {
		this.techniqueMgr = techniqueMgr;
	}

	public Certificate getCertificateA() {
		return certificateA;
	}

	public void setCertificateA(Certificate certificateA) {
		this.certificateA = certificateA;
	}

	public Certificate getCertificateB() {
		return certificateB;
	}

	public void setCertificateB(Certificate certificateB) {
		this.certificateB = certificateB;
	}

	public Certificate getCertificateC() {
		return certificateC;
	}

	public void setCertificateC(Certificate certificateC) {
		this.certificateC = certificateC;
	}

	public String getMember5Cards() {
		return member5Cards;
	}

	public void setMember5Cards(String member5Cards) {
		this.member5Cards = member5Cards;
	}

	public Long getDelegatorId() {
		return delegatorId;
	}

	public void setDelegatorId(Long delegatorId) {
		this.delegatorId = delegatorId;
	}

	public String getDelegatorName() {
		return delegatorName;
	}

	public void setDelegatorName(String delegatorName) {
		this.delegatorName = delegatorName;
	}

	public Date getRegistDT() {
		return registDT;
	}

	public void setRegistDT(Date registDT) {
		this.registDT = registDT;
	}

	public String getBidder() {
		return bidder;
	}

	public void setBidder(String bidder) {
		this.bidder = bidder;
	}

	public String getContract() {
		return contract;
	}

	public void setContract(String contract) {
		this.contract = contract;
	}

	public Double getBmFee() {
		return bmFee;
	}

	public void setBmFee(Double bmFee) {
		this.bmFee = bmFee;
	}

	public Double getKbFee() {
		return kbFee;
	}

	public void setKbFee(Double kbFee) {
		this.kbFee = kbFee;
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

	public Double getXmjlFee() {
		return xmjlFee;
	}

	public void setXmjlFee(Double xmjlFee) {
		this.xmjlFee = xmjlFee;
	}

	public Double getFrFee() {
		return frFee;
	}

	public void setFrFee(Double frFee) {
		this.frFee = frFee;
	}

	public String getHead3() {
		return head3;
	}

	public void setHead3(String head3) {
		this.head3 = head3;
	}

	public String getHead4() {
		return head4;
	}

	public void setHead4(String head4) {
		this.head4 = head4;
	}

	public Double getHead3Fee() {
		return head3Fee;
	}

	public void setHead3Fee(Double head3Fee) {
		this.head3Fee = head3Fee;
	}

	public Double getHead4Fee() {
		return head4Fee;
	}

	public void setHead4Fee(Double head4Fee) {
		this.head4Fee = head4Fee;
	}

	public Double getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getSt() {
		return st;
	}

	public void setSt(Date st) {
		this.st = st;
	}

	public Date getEt() {
		return et;
	}

	public void setEt(Date et) {
		this.et = et;
	}

	public String getBds() {
		return bds;
	}

	public void setBds(String bds) {
		this.bds = bds;
	}

	public String getBdNames() {
		return bdNames;
	}

	public void setBdNames(String bdNames) {
		this.bdNames = bdNames;
	}

	public String getQualifyRequirementNames() {
		return qualifyRequirementNames;
	}

	public void setQualifyRequirementNames(String qualifyRequirementNames) {
		this.qualifyRequirementNames = qualifyRequirementNames;
	}

	public String getMember5CardNames() {
		return member5CardNames;
	}

	public void setMember5CardNames(String member5CardNames) {
		this.member5CardNames = member5CardNames;
	}

	public Double getOtherFee() {
		return otherFee;
	}

	public void setOtherFee(Double otherFee) {
		this.otherFee = otherFee;
	}

}
