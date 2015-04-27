package com.wtkj.rms.code.model.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目管理vo
 * 
 * @author sunsi
 * 
 */
public class ProjectVo implements Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;
	private String code;// 项目编码
	private String name;// 项目名称
	private Long dictionaryId;// 项目类别id
	private String dictionaryText;// 项目类别名称
	private Long projectMangerId;// 项目经理id
	private String projectMangerName;// 项目经理名称
	private String projectAmount;// 项目金额
	private Date startDT;// 建设时间
	private Date endDT;// 结束时间
	private Date checkDT;// 验收时间

	private Long merchantId;
	private String merchantText;
	private String contactPerson;// 联系人
	private String contactPhone;// 联系电话

	private String summry;
	private String remark;
	private String attachmentIds;// 文档上传

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getDictionaryId() {
		return dictionaryId;
	}

	public void setDictionaryId(Long dictionaryId) {
		this.dictionaryId = dictionaryId;
	}

	public String getDictionaryText() {
		return dictionaryText;
	}

	public void setDictionaryText(String dictionaryText) {
		this.dictionaryText = dictionaryText;
	}

	public Long getMerchantId() {
		return merchantId;
	}

	public void setMerchantId(Long merchantId) {
		this.merchantId = merchantId;
	}

	public Long getProjectMangerId() {
		return projectMangerId;
	}

	public void setProjectMangerId(Long projectMangerId) {
		this.projectMangerId = projectMangerId;
	}

	public String getProjectMangerName() {
		return projectMangerName;
	}

	public void setProjectMangerName(String projectMangerName) {
		this.projectMangerName = projectMangerName;
	}

	public String getProjectAmount() {
		return projectAmount;
	}

	public void setProjectAmount(String projectAmount) {
		this.projectAmount = projectAmount;
	}

	public Date getCheckDT() {
		return checkDT;
	}

	public void setCheckDT(Date checkDT) {
		this.checkDT = checkDT;
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

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	public String getMerchantText() {
		return merchantText;
	}

	public void setMerchantText(String merchantText) {
		this.merchantText = merchantText;
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

}
