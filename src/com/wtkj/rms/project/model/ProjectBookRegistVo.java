package com.wtkj.rms.project.model;

import java.util.Date;

/**
 * 投标项目预定登记表（登陆员工填写该表）
 * 
 * @author sunsi
 * 
 */

public class ProjectBookRegistVo implements java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;
	private Long id;
	private String projectName;// 项目名称
	private String companyName;// 公司名称
	private long companyId;// 公司ID
	private String qualifyRequirement;// 资质要求
	private String qualifyRequirementNames;// 资质要求显示
	private String bidder;// 投标人姓名
	private String contract;// 联系方式

	private Double bookFee;// 预定费用

	private Date registDT;// 登记时间
	private String remark;// 备注

	private Long registerId;

	private String registerName;

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getQualifyRequirement() {
		return qualifyRequirement;
	}

	public void setQualifyRequirement(String qualifyRequirement) {
		this.qualifyRequirement = qualifyRequirement;
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

	public Double getBookFee() {
		return bookFee;
	}

	public void setBookFee(Double bookFee) {
		this.bookFee = bookFee;
	}

	public Date getRegistDT() {
		return registDT;
	}

	public void setRegistDT(Date registDT) {
		this.registDT = registDT;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Long getRegisterId() {
		return registerId;
	}

	public void setRegisterId(Long registerId) {
		this.registerId = registerId;
	}

	public String getRegisterName() {
		return registerName;
	}

	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}

	public String getQualifyRequirementNames() {
		return qualifyRequirementNames;
	}

	public void setQualifyRequirementNames(String qualifyRequirementNames) {
		this.qualifyRequirementNames = qualifyRequirementNames;
	}

}
