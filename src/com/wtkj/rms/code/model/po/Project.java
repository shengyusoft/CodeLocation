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

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;

/**
 * 项目管理表
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "CM_Project", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Project extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String code;// 项目编码
	private String name;// 项目名称
	private Tdictionary projectType;// 项目类别
	private Tuser projectManger;// 项目经理
	private String projectAmount;// 项目金额
	private Merchant merchant;// 关联服务商(承包单位)
	private String contactPerson;// 联系人
	private String contactPhone;// 联系电话
	private Date startDT;// 项目开始时间
	private Date endDT;// 项目结束时间
	private Date checkDT;// 验收时间
	private String remark;// 备注
	private String summry;// 项目简介
	private String attachmentIds;// 文档上传

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dictionary_id")
	public Tdictionary getProjectType() {
		return projectType;
	}

	public void setProjectType(Tdictionary projectType) {
		this.projectType = projectType;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "merchantId")
	public Merchant getMerchant() {
		return merchant;
	}

	public void setMerchant(Merchant merchant) {
		this.merchant = merchant;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "projectMangerId")
	public Tuser getProjectManger() {
		return projectManger;
	}

	public void setProjectManger(Tuser projectManger) {
		this.projectManger = projectManger;
	}

	public String getProjectAmount() {
		return projectAmount;
	}

	public void setProjectAmount(String projectAmount) {
		this.projectAmount = projectAmount;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public Date getCheckDT() {
		return checkDT;
	}

	public void setCheckDT(Date checkDT) {
		this.checkDT = checkDT;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getStartDT() {
		return startDT;
	}

	public void setStartDT(Date startDT) {
		this.startDT = startDT;
	}

	public Date getEndDT() {
		return endDT;
	}

	public void setEndDT(Date endDT) {
		this.endDT = endDT;
	}

	public String getSummry() {
		return summry;
	}

	public void setSummry(String summry) {
		this.summry = summry;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

}
