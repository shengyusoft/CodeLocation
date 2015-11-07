package com.wtkj.rms.pmcc.soft.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 工程测量登记
 */
@Entity
@Table(name = "project_measure_register", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectMeasureRegister extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	// 省市县区划
	private String provice;
	private String city;
	private String county;
		
	private String projectName; // 项目名称
	private String projectAddress; // 项目所在地
	private String chargePerson; // 业务负责人
	private String contactPhone; // 联系电话
	private Double measureCost; // 测量费用
	private Double prepayCost; // 预付费用
	private String payWay; // 付款方式
	private String measurePerson; // 测量负责人
	private String measureContent; // 测量内容
	private String measureProgress; // 测量进度
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; // 删除标记0:未删除；1：已删除
	
	
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
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectAddress() {
		return projectAddress;
	}
	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress;
	}
	public String getChargePerson() {
		return chargePerson;
	}
	public void setChargePerson(String chargePerson) {
		this.chargePerson = chargePerson;
	}
	public String getContactPhone() {
		return contactPhone;
	}
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
	public Double getMeasureCost() {
		return measureCost;
	}
	public void setMeasureCost(Double measureCost) {
		this.measureCost = measureCost;
	}
	public Double getPrepayCost() {
		return prepayCost;
	}
	public void setPrepayCost(Double prepayCost) {
		this.prepayCost = prepayCost;
	}
	public String getPayWay() {
		return payWay;
	}
	public void setPayWay(String payWay) {
		this.payWay = payWay;
	}
	public String getMeasurePerson() {
		return measurePerson;
	}
	public void setMeasurePerson(String measurePerson) {
		this.measurePerson = measurePerson;
	}
	public String getMeasureContent() {
		return measureContent;
	}
	public void setMeasureContent(String measureContent) {
		this.measureContent = measureContent;
	}
	public String getMeasureProgress() {
		return measureProgress;
	}
	public void setMeasureProgress(String measureProgress) {
		this.measureProgress = measureProgress;
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
