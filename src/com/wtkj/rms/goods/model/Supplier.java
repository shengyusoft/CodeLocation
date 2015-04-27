package com.wtkj.rms.goods.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 供应商信息
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "supplier", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Supplier extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;// 供应商名称
	private String place;// 地址
	private String code;// 编码
	private String phone;// 公司电话
	private String contactPerson;// 联络人
	private String fax;// 传真
	private String zip;// 邮政编码
	private String email;// 邮件地址
	private String remark;// 简介

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
