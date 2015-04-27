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
 * 客户订单
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "t_order", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Order extends IdEntity implements Serializable {

	private static final long serialVersionUID = 2071669456093805959L;
	
	private Customer customer;// 客户信息

	private String complaintTel;// 投诉电话

	private Date orderDt;// 订单时间

	private Date arrivedDt;// 订单送达时间

	private Date updateDt;// 订单更新时间

	private long userId;// 添加人

	private String userName;

	/**
	 * 客户是否签收
	 */
	private boolean sign;// 订单状态
	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "customerId")
	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getComplaintTel() {
		return complaintTel;
	}

	public void setComplaintTel(String complaintTel) {
		this.complaintTel = complaintTel;
	}

	public Date getOrderDt() {
		return orderDt;
	}

	public void setOrderDt(Date orderDt) {
		this.orderDt = orderDt;
	}

	public Date getArrivedDt() {
		return arrivedDt;
	}

	public void setArrivedDt(Date arrivedDt) {
		this.arrivedDt = arrivedDt;
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

	public boolean isSign() {
		return sign;
	}

	public void setSign(boolean sign) {
		this.sign = sign;
	}

}
