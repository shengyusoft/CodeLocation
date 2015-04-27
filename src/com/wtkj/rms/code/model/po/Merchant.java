package com.wtkj.rms.code.model.po;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tdictionary;

/**
 * 服务商管理表
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "CM_Merchant", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Merchant extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 4348107233617314745L;

	private Tdictionary merchantType;// 服务商类型,关联数据字典
	private String name;// 名称
	private String code;// 编码
	private String bank;
	private String account;
	private String tax;// 税号
	private String email;
	private String website;// 网址
	private String address;
	private String postCode;
	private String contact;
	private String officeNumber;
	private String faxNumber;
	private String mobilePhone;
	private String remark;
	private String extCol1;// 扩展字段1
	private String extCol2;// 扩展字段2

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dictionary_id")
	public Tdictionary getMerchantType() {
		return merchantType;
	}

	public void setMerchantType(Tdictionary merchantType) {
		this.merchantType = merchantType;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getTax() {
		return tax;
	}

	public void setTax(String tax) {
		this.tax = tax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getOfficeNumber() {
		return officeNumber;
	}

	public void setOfficeNumber(String officeNumber) {
		this.officeNumber = officeNumber;
	}

	public String getFaxNumber() {
		return faxNumber;
	}

	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getExtCol1() {
		return extCol1;
	}

	public void setExtCol1(String extCol1) {
		this.extCol1 = extCol1;
	}

	public String getExtCol2() {
		return extCol2;
	}

	public void setExtCol2(String extCol2) {
		this.extCol2 = extCol2;
	}

}
