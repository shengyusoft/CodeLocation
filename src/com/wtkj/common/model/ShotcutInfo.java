package com.wtkj.common.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

/**
 * 快键管理
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "sys_shotcut")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ShotcutInfo extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Tuser user; // 登录用户
	private Date updateDT; // 登录时间
	private Tresource resource;// 快键资源
	private String iconUrl;// 快键图标

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public Tuser getUser() {
		return user;
	}

	public void setUser(Tuser user) {
		this.user = user;
	}

	public Date getUpdateDT() {
		return updateDT;
	}

	public void setUpdateDT(Date updateDT) {
		this.updateDT = updateDT;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "resourceId")
	public Tresource getResource() {
		return resource;
	}

	public void setResource(Tresource resource) {
		this.resource = resource;
	}

	public String getIconUrl() {
		return iconUrl;
	}

	public void setIconUrl(String iconUrl) {
		this.iconUrl = iconUrl;
	}

}