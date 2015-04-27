package com.wtkj.rms.customer.model.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.BeanUtils;

import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.code.model.po.Contract;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.po.Project;

/**
 * 合同管理
 * 
 * @author sunsi
 * 
 */
public class CustomerVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;// 合同名称
	private String code;// 合同编码
	private Long trusteeId;// 受托方
	private String trusteeName;// 受托方名字
	private Long entrusteId;// 委托方
	private String entrusteName;// 委托方
	private Long projectId;// 项目id
	private String projectName; // 项目名称
	private Date signTime;// 签订合同时间
	private Date startTime;// 合同开始时间
	private Date endTime;// 合同结束时间
	private String money;// 合同金额
	private String signPlace;// 签订合同地点
	private String attachmentIds;// 附件,关联附件表
	private String summary;// 合同内容简介

	// for search
	private String signDT;

	public Contract toPo(BaseDaoI<Merchant> merchantDao,
			BaseDaoI<Project> projectDao) {
		Contract po = new Contract();
		BeanUtils.copyProperties(this, po);

		if (this.getEntrusteId() != null) {
			po.setEntruste(merchantDao.get(Merchant.class, this.getEntrusteId()));
		}

		if (this.getTrusteeId() != null) {
			po.setTrustee(merchantDao.get(Merchant.class, this.getTrusteeId()));
		}

		if (this.getProjectId() != null) {
			po.setProject(projectDao.get(Project.class, this.getProjectId()));
		}
		return po;

	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getTrusteeId() {
		return trusteeId;
	}

	public void setTrusteeId(Long trusteeId) {
		this.trusteeId = trusteeId;
	}

	public Long getEntrusteId() {
		return entrusteId;
	}

	public void setEntrusteId(Long entrusteId) {
		this.entrusteId = entrusteId;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	public Date getSignTime() {
		return signTime;
	}

	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getSignPlace() {
		return signPlace;
	}

	public void setSignPlace(String signPlace) {
		this.signPlace = signPlace;
	}

	public String getTrusteeName() {
		return trusteeName;
	}

	public void setTrusteeName(String trusteeName) {
		this.trusteeName = trusteeName;
	}

	public String getEntrusteName() {
		return entrusteName;
	}

	public void setEntrusteName(String entrusteName) {
		this.entrusteName = entrusteName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getSignDT() {
		return signDT;
	}

	public void setSignDT(String signDT) {
		this.signDT = signDT;
	}

}
