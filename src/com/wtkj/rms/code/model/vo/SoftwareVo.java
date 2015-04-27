package com.wtkj.rms.code.model.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.BeanUtils;

import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.attachment.model.Attachment;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.code.model.po.Software;

/**
 * 合同管理VO
 * 
 * @author sunsi
 * 
 */
public class SoftwareVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;// 软件名称
	private Long softwareVendorId;// 软件厂商
	private String softwareVendorName;// 软件厂商
	private Long maintenanceServiceId;// 运维服务商
	private String maintenanceServiceName;// 运维服务商
	private Long contactDeveloperId;// 开发联系人
	private String contactDeveloperName;// 开发联系人
	private Long maintenancePMId;// 运维项目经理
	private String maintenancePMName;// 运维项目经理
	private Long projectId;// 项目类别
	private String projectName;// 项目name
	private Date enableTime;// 启用时间
	private int state;// 状态
	private String attachmentIds;// 主动关联附件,用户手册
	private String maintenancePeriod;// 维护期限
	private String summary;// 合同内容简介

	public Software toPo(BaseDaoI<Attachment> attachmentDao,
			BaseDaoI<Merchant> merchantDao, BaseDaoI<Project> projectDao,
			BaseDaoI<Tuser> userDao) {
		Software po = new Software();
		BeanUtils.copyProperties(this, po);

		if (this.getMaintenanceServiceId() != null) {
			po.setMaintenanceService(merchantDao.get(Merchant.class,
					this.getMaintenanceServiceId()));
		}

		if (this.getSoftwareVendorId() != null) {
			po.setSoftwareVendor(merchantDao.get(Merchant.class,
					this.getSoftwareVendorId()));
		}

		if (this.getProjectId() != null) {
			po.setProject(projectDao.get(Project.class, this.getProjectId()));
		}

		if (this.getContactDeveloperId() != null) {
			po.setContactDeveloper(userDao.get(Tuser.class,
					this.getContactDeveloperId()));
		}

		if (this.getMaintenancePMId() != null) {
			po.setMaintenancePM(userDao.get(Tuser.class,
					this.getMaintenancePMId()));
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

	public Long getMaintenancePMId() {
		return maintenancePMId;
	}

	public void setMaintenancePMId(Long maintenancePMId) {
		this.maintenancePMId = maintenancePMId;
	}

	public String getMaintenancePMName() {
		return maintenancePMName;
	}

	public void setMaintenancePMName(String maintenancePMName) {
		this.maintenancePMName = maintenancePMName;
	}

	public String getSoftwareVendorName() {
		return softwareVendorName;
	}

	public void setSoftwareVendorName(String softwareVendorName) {
		this.softwareVendorName = softwareVendorName;
	}

	public String getMaintenanceServiceName() {
		return maintenanceServiceName;
	}

	public void setMaintenanceServiceName(String maintenanceServiceName) {
		this.maintenanceServiceName = maintenanceServiceName;
	}

	public String getContactDeveloperName() {
		return contactDeveloperName;
	}

	public void setContactDeveloperName(String contactDeveloperName) {
		this.contactDeveloperName = contactDeveloperName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Long getSoftwareVendorId() {
		return softwareVendorId;
	}

	public void setSoftwareVendorId(Long softwareVendorId) {
		this.softwareVendorId = softwareVendorId;
	}

	public Long getMaintenanceServiceId() {
		return maintenanceServiceId;
	}

	public void setMaintenanceServiceId(Long maintenanceServiceId) {
		this.maintenanceServiceId = maintenanceServiceId;
	}

	public Long getContactDeveloperId() {
		return contactDeveloperId;
	}

	public void setContactDeveloperId(Long contactDeveloperId) {
		this.contactDeveloperId = contactDeveloperId;
	}

	public Long getProjectId() {
		return projectId;
	}

	public void setProjectId(Long projectId) {
		this.projectId = projectId;
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

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
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
