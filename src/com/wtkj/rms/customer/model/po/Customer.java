package com.wtkj.rms.customer.model.po;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 客户管理
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "customer", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Customer extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String companyName;// 单位名称，公司名称
	private String servicePhone;// 客户电话
	private String fax;// 传真号码
	private String contactPerson;// 联系人
	private String contactPhone;// 联系电话
	private String remark;// 备注

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getServicePhone() {
		return servicePhone;
	}

	public void setServicePhone(String servicePhone) {
		this.servicePhone = servicePhone;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getContactPhone() {
		return contactPhone;
	}

	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
