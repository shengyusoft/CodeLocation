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
import com.wtkj.common.model.Tdictionarytype;

/**
 * 项目登记管理
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
	private Tdictionarytype provice;
	private Tdictionarytype city;
	private Tdictionarytype county;

	private Tdictionary bd;// 标段
	private String qualifyRequirement;// 资质要求
	private Tdictionary projectMgr;// 项目经理
	private Tdictionary techniqueMgr;// 技术负责人

	// A证,B证,C证
	private Certificate certificateA;// 技术负责人
	private Certificate certificateB;// 技术负责人
	private Certificate certificateC;// 技术负责人

	private Certificate member5Card;// 五大员证
	private Tdictionary delegator;// 委托人

	private Date registDT;// 报名时间
	private String bidder;// 投标人姓名
	private String contract;// 联系方式
	private String bidCost;// 投标费用
	private String remark;

	// 0项目登记 1项目开标登记
	private int type;

	private Date st;
	private Date et;

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
	public Tdictionarytype getProvice() {
		return provice;
	}

	public void setProvice(Tdictionarytype provice) {
		this.provice = provice;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "city_id")
	public Tdictionarytype getCity() {
		return city;
	}

	public void setCity(Tdictionarytype city) {
		this.city = city;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "county_id")
	public Tdictionarytype getCounty() {
		return county;
	}

	public void setCounty(Tdictionarytype county) {
		this.county = county;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bd_id")
	public Tdictionary getBd() {
		return bd;
	}

	public void setBd(Tdictionary bd) {
		this.bd = bd;
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

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "m5_id")
	public Certificate getMember5Card() {
		return member5Card;
	}

	public void setMember5Card(Certificate member5Card) {
		this.member5Card = member5Card;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "delegate_id")
	public Tdictionary getDelegator() {
		return delegator;
	}

	public void setDelegator(Tdictionary delegator) {
		this.delegator = delegator;
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

	public String getBidCost() {
		return bidCost;
	}

	public void setBidCost(String bidCost) {
		this.bidCost = bidCost;
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

}
