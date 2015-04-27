package com.wtkj.rms.purchase.model.po;

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
import com.wtkj.rms.customer.model.po.Customer;

/**
 * 采购计划单，由客户订单自动生成
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "purchase_plan", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class PurchasePlan extends IdEntity implements Serializable {

	private static final long serialVersionUID = 2071669456093805959L;

	private Customer customer;// 客户信息

	private Date addDt;// 添加采购单日期

	private Date updateDt;// 采购单更新时间

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

	public Date getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	@Transient
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getAddDt() {
		return addDt;
	}

	public void setAddDt(Date addDt) {
		this.addDt = addDt;
	}

}
