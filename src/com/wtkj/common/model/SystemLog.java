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
 * 系统日志
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "sys_log")
@DynamicInsert(true)
@DynamicUpdate(true)
public class SystemLog extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Tuser loginUser; // 登录用户
	private Date loginDT; // 登录时间
	private String clientIP; // ip 地址

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "loginUserId")
	public Tuser getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(Tuser loginUser) {
		this.loginUser = loginUser;
	}

	public Date getLoginDT() {
		return loginDT;
	}

	public void setLoginDT(Date loginDT) {
		this.loginDT = loginDT;
	}

	public String getClientIP() {
		return clientIP;
	}

	public void setClientIP(String clientIP) {
		this.clientIP = clientIP;
	}

}