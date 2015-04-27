package com.wtkj.rms.customer.model.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 报价单
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "quotation", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Quotation extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Customer customer;// 客户信息

	private Date startDt;// 有效日期起日

	private Date endDt;// 有效日期止日

	private Date updateDt;// 更新时间

	private Date addDt;// 添加时间

	private long userId;// 添加人

	private String userName;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "customerId")
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Transient
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public Date getStartDt() {
		return startDt;
	}

	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}

	public Date getEndDt() {
		return endDt;
	}

	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}

	public Date getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
	}

	public Date getAddDt() {
		return addDt;
	}

	public void setAddDt(Date addDt) {
		this.addDt = addDt;
	}
	
	

}
