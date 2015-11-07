package com.wtkj.rms.pmcc.soft.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 工程巡查登记
 */
@Entity
@Table(name = "project_patrol_register", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectPatrolRegister extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String company; // 公司名称
	// 省市县区划
	private String provice;
	private String city;
	private String county;
	
	private String companyName; // 公司名称
	private String projectName; // 项目名称
	private String section; // 标段
	private String projectAddress; // 工程所在地
	private Double price; // 中标价（元）
	private Date bidTime; // 中标时间
	private Double timeLimit; // 工期（天）
	private String chargePerson; // 施工负责人
	private String buildPhone; // 施工联系电话
	private String buildUnit; // 建设单位
	private String buildUnitPerson; // 建设单位联系人
	private String buildUnitPhone; // 建设单位联系电话
	private String supervisorUnit; // 监理单位
	private String supervisorUnitPerson; // 监理单位联系人
	private String supervisorUnitPhone; // 监理单位联系电话
	private String designUnit; // 设计单位
	private String designUnitPerson; // 设计单位联系人
	private String designUnitPhone; // 设计单位联系电话
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; //删除标记
	
	private String[] section_show; // 标段加载用
	
	@Transient
	public String[] getSection_show() {
		return section_show;
	}
	public void setSection_show(String[] section_show) {
		this.section_show = section_show;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getProvice() {
		return provice;
	}
	public void setProvice(String provice) {
		this.provice = provice;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getProjectAddress() {
		return projectAddress;
	}
	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Date getBidTime() {
		return bidTime;
	}
	public void setBidTime(Date bidTime) {
		this.bidTime = bidTime;
	}
	public Double getTimeLimit() {
		return timeLimit;
	}
	public void setTimeLimit(Double timeLimit) {
		this.timeLimit = timeLimit;
	}
	public String getChargePerson() {
		return chargePerson;
	}
	public void setChargePerson(String chargePerson) {
		this.chargePerson = chargePerson;
	}
	public String getBuildPhone() {
		return buildPhone;
	}
	public void setBuildPhone(String buildPhone) {
		this.buildPhone = buildPhone;
	}
	public String getBuildUnit() {
		return buildUnit;
	}
	public void setBuildUnit(String buildUnit) {
		this.buildUnit = buildUnit;
	}
	public String getBuildUnitPerson() {
		return buildUnitPerson;
	}
	public void setBuildUnitPerson(String buildUnitPerson) {
		this.buildUnitPerson = buildUnitPerson;
	}
	public String getBuildUnitPhone() {
		return buildUnitPhone;
	}
	public void setBuildUnitPhone(String buildUnitPhone) {
		this.buildUnitPhone = buildUnitPhone;
	}
	public String getSupervisorUnit() {
		return supervisorUnit;
	}
	public void setSupervisorUnit(String supervisorUnit) {
		this.supervisorUnit = supervisorUnit;
	}
	public String getSupervisorUnitPerson() {
		return supervisorUnitPerson;
	}
	public void setSupervisorUnitPerson(String supervisorUnitPerson) {
		this.supervisorUnitPerson = supervisorUnitPerson;
	}
	public String getSupervisorUnitPhone() {
		return supervisorUnitPhone;
	}
	public void setSupervisorUnitPhone(String supervisorUnitPhone) {
		this.supervisorUnitPhone = supervisorUnitPhone;
	}
	public String getDesignUnit() {
		return designUnit;
	}
	public void setDesignUnit(String designUnit) {
		this.designUnit = designUnit;
	}
	public String getDesignUnitPerson() {
		return designUnitPerson;
	}
	public void setDesignUnitPerson(String designUnitPerson) {
		this.designUnitPerson = designUnitPerson;
	}
	public String getDesignUnitPhone() {
		return designUnitPhone;
	}
	public void setDesignUnitPhone(String designUnitPhone) {
		this.designUnitPhone = designUnitPhone;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
}
