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

/**
 * 项目登记管理
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "ProjectBid", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectBid extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;
	private Tdictionary company;// 公司名称
	private String projectName;// 项目名称
	private Date bidDt;// 中标时间
	private Date signDt;// 合同签订时间

	// 省市县区划
	private Tdictionary provice;
	private Tdictionary city;
	private Tdictionary county;

	private String bds;// 标段
	private String bdNames;// display
	private Double bid_cost;

	// 管理费比例（%）
	// private Float manage_cost;
	private Double manageFee;// 管理费=中标价×比例

	private Float manageFeeRate;// 管理费比例（%）

	private Date duration;// 工期

	private Tdictionary projectMgr;// 项目经理
	private Tdictionary techniqueMgr;// 技术负责人
	private Certificate aqy;// 专职安全员

	// 施工负责人信息
	private String headman;// 姓名
	private String headmanIdCard;// 身份证
	private String tel;// 联系方式

	private String recordman;// 登记人

	private String sender;// 发包人

	private String remark;

	// for search--改为申请时间
	private Date durationSt;// 工期开始

	private Date durationEt;// 工期结束

	// 0 正常情况 1 过期需要总经理审批
	private int state = 0;

	private int option;

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
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

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "mgr_id")
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
	@JoinColumn(name = "aqy_id")
	public Certificate getAqy() {
		return aqy;
	}

	public void setAqy(Certificate aqy) {
		this.aqy = aqy;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Double getBid_cost() {
		return bid_cost;
	}

	public void setBid_cost(Double bid_cost) {
		this.bid_cost = bid_cost;
	}

	public Double getManageFee() {
		return manageFee;
	}

	public void setManageFee(Double manageFee) {
		this.manageFee = manageFee;
	}

	public Float getManageFeeRate() {
		return manageFeeRate;
	}

	public void setManageFeeRate(Float manageFeeRate) {
		this.manageFeeRate = manageFeeRate;
	}

	public Date getDuration() {
		return duration;
	}

	public void setDuration(Date duration) {
		this.duration = duration;
	}

	public String getHeadman() {
		return headman;
	}

	public void setHeadman(String headman) {
		this.headman = headman;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getRecordman() {
		return recordman;
	}

	public void setRecordman(String recordman) {
		this.recordman = recordman;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getHeadmanIdCard() {
		return headmanIdCard;
	}

	public void setHeadmanIdCard(String headmanIdCard) {
		this.headmanIdCard = headmanIdCard;
	}

	@Transient
	public Date getDurationSt() {
		return durationSt;
	}

	public void setDurationSt(Date durationSt) {
		this.durationSt = durationSt;
	}

	@Transient
	public Date getDurationEt() {
		return durationEt;
	}

	public void setDurationEt(Date durationEt) {
		this.durationEt = durationEt;
	}

	public Date getBidDt() {
		return bidDt;
	}

	public void setBidDt(Date bidDt) {
		this.bidDt = bidDt;
	}

	public Date getSignDt() {
		return signDt;
	}

	public void setSignDt(Date signDt) {
		this.signDt = signDt;
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
