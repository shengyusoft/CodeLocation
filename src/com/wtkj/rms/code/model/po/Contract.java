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
import com.wtkj.rms.code.model.vo.ContractVo;

/**
 * 合同管理VO
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "CM_Contract", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Contract extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;// 合同名称
	private String code;// 合同编码
	private Merchant trustee;// 受托方
	private Merchant entruste;// 委托方
	private Project project;// 项目类别
	private Date signTime;// 签订合同时间
	private Date startTime;// 合同开始时间
	private Date endTime;// 合同结束时间
	private String money;// 合同金额
	private String attachmentIds;// 主动关联附件
	private String signPlace;// 签订合同地点
	private String summary;// 合同内容简介

	public ContractVo toVo() {
		ContractVo vo = new ContractVo();
		BeanUtils.copyProperties(this, vo);

		if (this.getEntruste() != null) {
			vo.setEntrusteId(this.getEntruste().getId());
			vo.setEntrusteName(this.getEntruste().getName());
		}

		if (this.getTrustee() != null) {
			vo.setTrusteeId(this.getTrustee().getId());
			vo.setTrusteeName(this.getTrustee().getName());
		}

		if (this.getProject() != null) {
			vo.setProjectId(this.getProject().getId());
			vo.setProjectName(this.getProject().getName());
		}

		return vo;
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

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "trusteeId")
	public Merchant getTrustee() {
		return trustee;
	}

	public void setTrustee(Merchant trustee) {
		this.trustee = trustee;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "entrusteId")
	public Merchant getEntruste() {
		return entruste;
	}

	public void setEntruste(Merchant entruste) {
		this.entruste = entruste;
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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

}
