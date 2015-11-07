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
 * 工程资料整编登记
 */
@Entity
@Table(name = "project_data_reorganize_register", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectDataReorganizeRegister extends IdEntity implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String company; // 公司名称
	// 省市县区划
	private String provice;
	private String city;
	private String county;
		
	private String projectAddress; // 工程所在地
	private String projectName; // 项目名称
	private String section; // 标段
	private String chargePerson; // 业务负责人
	private String contactPhone; // 联系电话
	private Double reorganizeCost; // 整编费用（元）
	private Double prepayCost; // 预付费用（元）
	private String payWay; // 付款方式
	private String dataChargePerson; // 资料编制负责人
	private String reorganizeContent; // 整编内容
	private String reorganizeProgress; // 整编进度
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; // 删除标记0:未删除；1：已删除
	
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
	public Double getReorganizeCost() {
		return reorganizeCost;
	}
	public void setReorganizeCost(Double reorganizeCost) {
		this.reorganizeCost = reorganizeCost;
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
	public String getDataChargePerson() {
		return dataChargePerson;
	}
	public void setDataChargePerson(String dataChargePerson) {
		this.dataChargePerson = dataChargePerson;
	}
	public String getReorganizeContent() {
		return reorganizeContent;
	}
	public void setReorganizeContent(String reorganizeContent) {
		this.reorganizeContent = reorganizeContent;
	}
	public String getReorganizeProgress() {
		return reorganizeProgress;
	}
	public void setReorganizeProgress(String reorganizeProgress) {
		this.reorganizeProgress = reorganizeProgress;
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
