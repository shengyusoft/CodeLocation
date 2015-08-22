package com.wtkj.rms.project.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 证书信息
 * 
 * @author
 * 
 */
@Entity
@Table(name = "tb_certificate", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Certificate extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private String card_code;
	private String card_name;
	private String card_getdate;
	private String card_enddate;
	private String card_issuer;
	private String card_owner;
	private String card_owner_id;
	private String card_type;
	private String card_level;
	private String card_status;
	private String remark;

	private String attachmentIds;// 主动关联附件

	public String getCard_code() {
		return card_code;
	}

	public void setCard_code(String card_code) {
		this.card_code = card_code;
	}

	public String getCard_name() {
		return card_name;
	}

	public void setCard_name(String card_name) {
		this.card_name = card_name;
	}

	public String getCard_getdate() {
		return card_getdate;
	}

	public void setCard_getdate(String card_getdate) {
		this.card_getdate = card_getdate;
	}

	public String getCard_enddate() {
		return card_enddate;
	}

	public void setCard_enddate(String card_enddate) {
		this.card_enddate = card_enddate;
	}

	public String getCard_issuer() {
		return card_issuer;
	}

	public void setCard_issuer(String card_issuer) {
		this.card_issuer = card_issuer;
	}

	public String getCard_owner() {
		return card_owner;
	}

	public void setCard_owner(String card_owner) {
		this.card_owner = card_owner;
	}

	public String getCard_owner_id() {
		return card_owner_id;
	}

	public void setCard_owner_id(String card_owner_id) {
		this.card_owner_id = card_owner_id;
	}

	public String getCard_type() {
		return card_type;
	}

	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public String getCard_level() {
		return card_level;
	}

	public void setCard_level(String card_level) {
		this.card_level = card_level;
	}

	public String getCard_status() {
		return card_status;
	}

	public void setCard_status(String card_status) {
		this.card_status = card_status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

}
