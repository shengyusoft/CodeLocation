package com.wtkj.rms.code.model.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.beans.BeanUtils;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.code.model.vo.SoftwareVo;

/**
 * 合同管理VO
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "CM_Software", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Software extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;// 合同名称
	private Merchant softwareVendor;// 软件厂商
	private Merchant maintenanceService;// 运维服务商
	private Tuser contactDeveloper;// 开发联系人
	private Tuser maintenancePM;// 运维项目经理
	private Project project;// 项目
	private Date enableTime;// 启用时间
	private int state;// 状态
	private String attachmentIds;// 主动关联附件,用户手册
	private String maintenancePeriod;// 维护期限
	private String summary;// 合同内容简介

	public SoftwareVo toVo() {
		SoftwareVo vo = new SoftwareVo();
		BeanUtils.copyProperties(this, vo);

		if (this.getMaintenanceService() != null) {
			vo.setMaintenanceServiceId(this.getMaintenanceService().getId());
			vo.setMaintenanceServiceName(this.getMaintenanceService().getName());
		}

		if (this.getSoftwareVendor() != null) {
			vo.setSoftwareVendorId(this.getSoftwareVendor().getId());
			vo.setSoftwareVendorName(this.getSoftwareVendor().getName());
		}

		if (this.getProject() != null) {
			vo.setProjectId(this.getProject().getId());
			vo.setProjectName(this.getProject().getName());
		}

		if (this.getContactDeveloper() != null) {
			vo.setContactDeveloperId(this.getContactDeveloper().getId());
			vo.setContactDeveloperName(this.getContactDeveloper().getName());
		}

		if (this.getMaintenancePM() != null) {
			vo.setMaintenancePMId(this.getMaintenancePM().getId());
			vo.setMaintenancePMName(this.getMaintenancePM().getName());
		}

		return vo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "projectId")
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maintenancePMId")
	public Tuser getMaintenancePM() {
		return maintenancePM;
	}

	public void setMaintenancePM(Tuser maintenancePM) {
		this.maintenancePM = maintenancePM;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "softwareVendorId")
	public Merchant getSoftwareVendor() {
		return softwareVendor;
	}

	public void setSoftwareVendor(Merchant softwareVendor) {
		this.softwareVendor = softwareVendor;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "maintenanceServiceId")
	public Merchant getMaintenanceService() {
		return maintenanceService;
	}

	public void setMaintenanceService(Merchant maintenanceService) {
		this.maintenanceService = maintenanceService;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "contactDeveloperId")
	public Tuser getContactDeveloper() {
		return contactDeveloper;
	}

	public void setContactDeveloper(Tuser contactDeveloper) {
		this.contactDeveloper = contactDeveloper;
	}

	public Date getEnableTime() {
		return enableTime;
	}

	public void setEnableTime(Date enableTime) {
		this.enableTime = enableTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getMaintenancePeriod() {
		return maintenancePeriod;
	}

	public void setMaintenancePeriod(String maintenancePeriod) {
		this.maintenancePeriod = maintenancePeriod;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

}
