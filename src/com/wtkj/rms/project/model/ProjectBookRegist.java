package com.wtkj.rms.project.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;

/**
 * 投标项目预定登记表（登陆员工填写该表）
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "ProjectBookRegist", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectBookRegist extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 6625249529038114020L;
	private String projectName;// 项目名称
	private Tdictionary company;// 公司名称
	private String qualifyRequirement;// 资质要求
	private String bidder;// 投标人姓名
	private String contract;// 联系方式

	private Double bookFee;// 预定费用
	private Tuser register;// 登记人
	private Date registDT;// 登记时间
	private String remark;// 备注

	private Long registerId;

	private String registerName;

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "companyId")
	public Tdictionary getCompany() {
		return company;
	}

	public void setCompany(Tdictionary company) {
		this.company = company;
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

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "registerId")
	public Tuser getRegister() {
		return register;
	}

	public void setRegister(Tuser register) {
		this.register = register;
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

	@Transient
	public Long getRegisterId() {
		return registerId;
	}

	public void setRegisterId(Long registerId) {
		this.registerId = registerId;
	}

	@Transient
	public String getRegisterName() {
		return registerName;
	}

	public void setRegisterName(String registerName) {
		this.registerName = registerName;
	}

}
