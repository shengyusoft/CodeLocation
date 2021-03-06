package com.wtkj.rms.project.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;

/**
 * 项目报名登记管理(项目开标登记)
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "ProjectRegist", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectRegist extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;
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

	private Tuser delegator;// 委托人

	private Long delegatorId;

	private String delegatorName;

	private Date registDT;// 开标时间
	private Date createDT;// 登记时间
	private String bidder;// 投标人姓名
	private String contract;// 联系方式
	// private String bidCost;// 投标费用

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

	// 客户需求，新添加
	private String bsbz;// 标书编制

	private String ysbz;// 预算编制

	private int option;

	// 超期状态
	private int state = 0;

	private String projectType;// 项目类型
	
	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}
	
	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "company_id")
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

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "province_id")
	public Tdictionary getProvice() {
		return provice;
	}

	public void setProvice(Tdictionary provice) {
		this.provice = provice;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "city_id")
	public Tdictionary getCity() {
		return city;
	}

	public void setCity(Tdictionary city) {
		this.city = city;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "county_id")
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

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "pmgr_id")
	public Tdictionary getProjectMgr() {
		return projectMgr;
	}

	public void setProjectMgr(Tdictionary projectMgr) {
		this.projectMgr = projectMgr;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "tec_id")
	public Tdictionary getTechniqueMgr() {
		return techniqueMgr;
	}

	public void setTechniqueMgr(Tdictionary techniqueMgr) {
		this.techniqueMgr = techniqueMgr;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "A_id")
	public Certificate getCertificateA() {
		return certificateA;
	}

	public void setCertificateA(Certificate certificateA) {
		this.certificateA = certificateA;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "B_id")
	public Certificate getCertificateB() {
		return certificateB;
	}

	public void setCertificateB(Certificate certificateB) {
		this.certificateB = certificateB;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "C_id")
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

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "delegate_id")
	public Tuser getDelegator() {
		return delegator;
	}

	public void setDelegator(Tuser delegator) {
		this.delegator = delegator;
	}

	@Transient
	public Long getDelegatorId() {
		return delegatorId;
	}

	public void setDelegatorId(Long delegatorId) {
		this.delegatorId = delegatorId;
	}

	@Transient
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

	public Date getCreateDT() {
		return createDT;
	}

	public void setCreateDT(Date createDT) {
		this.createDT = createDT;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Transient
	public Date getSt() {
		return st;
	}

	public void setSt(Date st) {
		this.st = st;
	}

	@Transient
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

	@Transient
	public String getBdNames() {
		return bdNames;
	}

	public void setBdNames(String bdNames) {
		this.bdNames = bdNames;
	}

	@Transient
	public String getQualifyRequirementNames() {
		return qualifyRequirementNames;
	}

	public void setQualifyRequirementNames(String qualifyRequirementNames) {
		this.qualifyRequirementNames = qualifyRequirementNames;
	}

	@Transient
	public String getMember5CardNames() {
		return member5CardNames;
	}

	public void setMember5CardNames(String member5CardNames) {
		this.member5CardNames = member5CardNames;
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

	public Double getOtherFee() {
		return otherFee;
	}

	public void setOtherFee(Double otherFee) {
		this.otherFee = otherFee;
	}

	public Double getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	public String getBsbz() {
		return bsbz;
	}

	public void setBsbz(String bsbz) {
		this.bsbz = bsbz;
	}

	public String getYsbz() {
		return ysbz;
	}

	public void setYsbz(String ysbz) {
		this.ysbz = ysbz;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Transient
	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

}
