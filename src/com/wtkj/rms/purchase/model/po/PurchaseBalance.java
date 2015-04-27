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
 * 采购结算单
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "purchase_balance", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class PurchaseBalance extends IdEntity implements Serializable {

	private static final long serialVersionUID = 2071669456093805959L;

	// 1 现金结算单 2转账结算单
	private int type;

	private Customer customer;// 客户信息

	private Date balanceDt;// 结算日期

	private long userId;// 结算人

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

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getBalanceDt() {
		return balanceDt;
	}

	public void setBalanceDt(Date balanceDt) {
		this.balanceDt = balanceDt;
	}

}
