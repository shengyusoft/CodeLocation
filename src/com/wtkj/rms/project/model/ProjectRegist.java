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
import com.wtkj.common.model.Tdictionary;

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
	private Tdictionary provice;
	private Tdictionary city;
	private Tdictionary county;

	private Tdictionary bd;// 标段
	private String qualifyRequirement;// 资质要求
	private Tdictionary projectMgr;// 项目经理
	private Tdictionary techniqueMgr;// 技术负责人

	// A证,B证,C证
	private Tdictionary certificateA;// 技术负责人
	private Tdictionary certificateB;// 技术负责人
	private Tdictionary certificateC;// 技术负责人

	private Tdictionary member5Card;// 五大员证
	private Tdictionary delegator;// 委托人

	private Date registDT;// 报名时间
	private String bidder;// 投标人姓名
	private String contract;// 联系方式
	private String bidCost;// 投标费用
	private String remark;

	
	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "company_id")
	public Tdictionary getCompany() {
		return company;
	}

	public void setCompany(Tdictionary company) {
		this.company = company;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "province_id")
	public Tdictionary getProvice() {
		return provice;
	}

	public void setProvice(Tdictionary provice) {
		this.provice = provice;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "city_id")
	public Tdictionary getCity() {
		return city;
	}

	public void setCity(Tdictionary city) {
		this.city = city;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "county_id")
	public Tdictionary getCounty() {
		return county;
	}

	public void setCounty(Tdictionary county) {
		this.county = county;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "pmgr_id")
	public Tdictionary getProjectMgr() {
		return projectMgr;
	}

	public void setProjectMgr(Tdictionary projectMgr) {
		this.projectMgr = projectMgr;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "tec_id")
	public Tdictionary getTechniqueMgr() {
		return techniqueMgr;
	}

	public void setTechniqueMgr(Tdictionary techniqueMgr) {
		this.techniqueMgr = techniqueMgr;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "A_id")
	public Tdictionary getCertificateA() {
		return certificateA;
	}

	public void setCertificateA(Tdictionary certificateA) {
		this.certificateA = certificateA;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "B_id")
	public Tdictionary getCertificateB() {
		return certificateB;
	}

	public void setCertificateB(Tdictionary certificateB) {
		this.certificateB = certificateB;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "C_id")
	public Tdictionary getCertificateC() {
		return certificateC;
	}

	public void setCertificateC(Tdictionary certificateC) {
		this.certificateC = certificateC;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "m5_id")
	public Tdictionary getMember5Card() {
		return member5Card;
	}

	public void setMember5Card(Tdictionary member5Card) {
		this.member5Card = member5Card;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
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

}
