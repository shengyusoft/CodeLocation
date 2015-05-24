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
import com.wtkj.common.model.Tdictionarytype;

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

	// 省市县区划
	private Tdictionarytype provice;
	private Tdictionarytype city;
	private Tdictionarytype county;

	private Tdictionary bd;// 标段

	private Float bid_cost;
	private Float manage_cost;
	private Date duration;

	private Tdictionary projectMgr;// 项目经理
	private Tdictionary techniqueMgr;// 技术负责人
	private Tdictionary aqy;// 委托人

	private String headman;
	private String headmanIdCard;
	private String tel;
	private String recordman;
	private String remark;

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
	public Tdictionary getAqy() {
		return aqy;
	}

	public void setAqy(Tdictionary aqy) {
		this.aqy = aqy;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Float getBid_cost() {
		return bid_cost;
	}

	public void setBid_cost(Float bid_cost) {
		this.bid_cost = bid_cost;
	}

	public Float getManage_cost() {
		return manage_cost;
	}

	public void setManage_cost(Float manage_cost) {
		this.manage_cost = manage_cost;
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

	public String getHeadmanIdCard() {
		return headmanIdCard;
	}

	public void setHeadmanIdCard(String headmanIdCard) {
		this.headmanIdCard = headmanIdCard;
	}

}
