package com.wtkj.rms.customer.model.vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 报价单
 * 
 * @author sunsi
 * 
 */
public class QuotationVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private long id;

	private long customerId;// 客户信息

	private String customerName;

	private Date startDt;// 有效日期起日

	private Date endDt;// 有效日期止日

	private Date updateDt;// 更新时间

	private Date addDt;// 添加时间

	private String addUserName;// 添加人

	private long addUserId;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(long customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getAddUserName() {
		return addUserName;
	}

	public void setAddUserName(String addUserName) {
		this.addUserName = addUserName;
	}

	public long getAddUserId() {
		return addUserId;
	}

	public void setAddUserId(long addUserId) {
		this.addUserId = addUserId;
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
