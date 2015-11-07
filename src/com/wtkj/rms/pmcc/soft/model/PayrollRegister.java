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
 * 工资发放登记
 */
@Entity
@Table(name = "payroll_register", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class PayrollRegister extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String name; // 姓名
	private Double basePay; // 基本工资
	private Double agePay; // 工龄工资
	private Double royalty; // 绩效提成
	private Double pensionInsurance; // 养老保险
	private Double injuryInsurance; // 工伤保险
	private Double medicalInsurance; // 医疗保险
	private Double joblessInsurance; // 失业保险
	private Double homeFund; // 住房公积金
	private Double other; // 其它
	private Double shouldPay; // 应发工资
	private Double withhold; // 代扣代缴
	private Double fine; // 罚款
	private Double realPay; // 实发工资
	private Long processId; // 审批流程主键
	private Integer processFlag; // 审批流程标记  
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; // 删除标记
	
	private Long managerId; // 总经理主键
	private String managerOpinion; // 总经理审批意见
	private Date approveDate; // 批准时间
	private String managerRemark; // 总经理填写备注
	private String teller; // 出纳
	private Long tellerId; // 出纳主键
	private Date tellerDate; // 出纳时间
	private String tellerRemark; // 出纳填写备注
	
	private String yesOrNo; // 审批是否通过标记, -1 ： 不通过；1 ： 通过
	
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
	public Long getManagerId() {
		return managerId;
	}
	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}
	public String getManagerOpinion() {
		return managerOpinion;
	}
	public void setManagerOpinion(String managerOpinion) {
		this.managerOpinion = managerOpinion;
	}
	public Date getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}
	public String getManagerRemark() {
		return managerRemark;
	}
	public void setManagerRemark(String managerRemark) {
		this.managerRemark = managerRemark;
	}
	public String getTeller() {
		return teller;
	}
	public void setTeller(String teller) {
		this.teller = teller;
	}
	public Long getTellerId() {
		return tellerId;
	}
	public void setTellerId(Long tellerId) {
		this.tellerId = tellerId;
	}
	public Date getTellerDate() {
		return tellerDate;
	}
	public void setTellerDate(Date tellerDate) {
		this.tellerDate = tellerDate;
	}
	public String getTellerRemark() {
		return tellerRemark;
	}
	public void setTellerRemark(String tellerRemark) {
		this.tellerRemark = tellerRemark;
	}
	@Transient
	public String getYesOrNo() {
		return yesOrNo;
	}
	public void setYesOrNo(String yesOrNo) {
		this.yesOrNo = yesOrNo;
	}
	
	public Integer getProcessFlag() {
		return processFlag;
	}
	public void setProcessFlag(Integer processFlag) {
		this.processFlag = processFlag;
	}
	public Double getJoblessInsurance() {
		return joblessInsurance;
	}
	public void setJoblessInsurance(Double joblessInsurance) {
		this.joblessInsurance = joblessInsurance;
	}
	public Double getHomeFund() {
		return homeFund;
	}
	public void setHomeFund(Double homeFund) {
		this.homeFund = homeFund;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Double getBasePay() {
		return basePay;
	}
	public void setBasePay(Double basePay) {
		this.basePay = basePay;
	}
	public Double getAgePay() {
		return agePay;
	}
	public void setAgePay(Double agePay) {
		this.agePay = agePay;
	}
	public Double getRoyalty() {
		return royalty;
	}
	public void setRoyalty(Double royalty) {
		this.royalty = royalty;
	}
	public Double getPensionInsurance() {
		return pensionInsurance;
	}
	public void setPensionInsurance(Double pensionInsurance) {
		this.pensionInsurance = pensionInsurance;
	}
	public Double getInjuryInsurance() {
		return injuryInsurance;
	}
	public void setInjuryInsurance(Double injuryInsurance) {
		this.injuryInsurance = injuryInsurance;
	}
	public Double getMedicalInsurance() {
		return medicalInsurance;
	}
	public void setMedicalInsurance(Double medicalInsurance) {
		this.medicalInsurance = medicalInsurance;
	}
	public Double getOther() {
		return other;
	}
	public void setOther(Double other) {
		this.other = other;
	}
	public Double getShouldPay() {
		return shouldPay;
	}
	public void setShouldPay(Double shouldPay) {
		this.shouldPay = shouldPay;
	}
	public Double getWithhold() {
		return withhold;
	}
	public void setWithhold(Double withhold) {
		this.withhold = withhold;
	}
	public Double getFine() {
		return fine;
	}
	public void setFine(Double fine) {
		this.fine = fine;
	}
	public Double getRealPay() {
		return realPay;
	}
	public void setRealPay(Double realPay) {
		this.realPay = realPay;
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
