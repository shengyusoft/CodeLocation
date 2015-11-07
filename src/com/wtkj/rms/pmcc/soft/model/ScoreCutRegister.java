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
 * 绩效提成登记
 */
@Entity
@Table(name = "score_cut_register", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ScoreCutRegister extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String projectName; // 项目名称
	private String unit; // 单位
	private Double num; // 数量
	private Date finishDate; // 完成时间
	private Date confirmDateS; // 确认时间开始
	private Date confirmDateE; // 确认时间结束
	private String costName; // 费用名称
	private Double amount; // 绩效提成金额（元）
	private String applicant; // 申请人
	private Long applicantId; // 申请人Id
	private Date applicantDate; // 申请时间
	private String checkPerson; // 核对人
	private Long checkPersonId; // 核对人Id
	private Date checkDate; // 核对时间
	private String checkRemark; // 核对备注
	private String examine; // 审批人
	private Long examineId; // 审批人Id
	private Date examineDate; // 审批时间
	private String examineRemark; // 审批备注
	private String handle; // 办理人
	private Long handleId; // 办理人Id
	private Date handleDate; // 办理时间
	private String handleRemark; // 办理备注
	private Long processId; // 审批流程主键
	private Integer processFlag; // 
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; // 删除标记
	
	private String yesOrNo; 
	private Date st; 
	private Date et; 
	
	@Transient
	public Date getSt() {
		return st;
	}
	public void setSt(Date st) {
		this.st = st;
	}
	@Transient
	public Date getEt() {
		return et;
	}
	public void setEt(Date et) {
		this.et = et;
	}
	private int option;
	@Transient
	public int getOption() {
		return option;
	}
	public void setOption(int option) {
		this.option = option;
	}
	public Long getProcessId() {
		return processId;
	}
	public void setProcessId(Long processId) {
		this.processId = processId;
	}
	public String getCheckRemark() {
		return checkRemark;
	}
	public void setCheckRemark(String checkRemark) {
		this.checkRemark = checkRemark;
	}
	public String getExamineRemark() {
		return examineRemark;
	}
	public void setExamineRemark(String examineRemark) {
		this.examineRemark = examineRemark;
	}
	public String getHandleRemark() {
		return handleRemark;
	}
	public void setHandleRemark(String handleRemark) {
		this.handleRemark = handleRemark;
	}
	@Transient
	public String getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(String yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	public Date getConfirmDateS() {
		return confirmDateS;
	}
	public void setConfirmDateS(Date confirmDateS) {
		this.confirmDateS = confirmDateS;
	}
	public Date getConfirmDateE() {
		return confirmDateE;
	}
	public void setConfirmDateE(Date confirmDateE) {
		this.confirmDateE = confirmDateE;
	}
	public Long getApplicantId() {
		return applicantId;
	}
	public void setApplicantId(Long applicantId) {
		this.applicantId = applicantId;
	}
	public Long getCheckPersonId() {
		return checkPersonId;
	}
	public void setCheckPersonId(Long checkPersonId) {
		this.checkPersonId = checkPersonId;
	}
	public Long getExamineId() {
		return examineId;
	}
	public void setExamineId(Long examineId) {
		this.examineId = examineId;
	}
	public Long getHandleId() {
		return handleId;
	}
	public void setHandleId(Long handleId) {
		this.handleId = handleId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Double getNum() {
		return num;
	}
	public void setNum(Double num) {
		this.num = num;
	}
	public Date getFinishDate() {
		return finishDate;
	}
	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}
	public String getCostName() {
		return costName;
	}
	public void setCostName(String costName) {
		this.costName = costName;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getApplicant() {
		return applicant;
	}
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}
	public Date getApplicantDate() {
		return applicantDate;
	}
	public void setApplicantDate(Date applicantDate) {
		this.applicantDate = applicantDate;
	}
	public String getCheckPerson() {
		return checkPerson;
	}
	public void setCheckPerson(String checkPerson) {
		this.checkPerson = checkPerson;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public String getExamine() {
		return examine;
	}
	public void setExamine(String examine) {
		this.examine = examine;
	}
	public Date getExamineDate() {
		return examineDate;
	}
	public void setExamineDate(Date examineDate) {
		this.examineDate = examineDate;
	}
	public String getHandle() {
		return handle;
	}
	public void setHandle(String handle) {
		this.handle = handle;
	}
	public Date getHandleDate() {
		return handleDate;
	}
	public void setHandleDate(Date handleDate) {
		this.handleDate = handleDate;
	}
	public Integer getProcessFlag() {
		return processFlag;
	}
	public void setProcessFlag(Integer processFlag) {
		this.processFlag = processFlag;
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
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
}
