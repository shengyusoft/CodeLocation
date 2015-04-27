package com.wtkj.common.model;

import java.util.Date;

/**
 * 系统日志
 * 
 * @author sunsi
 * 
 */
public class SystemLogVo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Long id;// 主键
	private Long loginUserId;
	private String loginUserName;// 登录用户真实姓名
	private String loginUserAccount;// l登录用户账号
	private Date loginDT; // 登录时间
	private String clientIP; // ip 地址

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getLoginUserId() {
		return loginUserId;
	}

	public void setLoginUserId(Long loginUserId) {
		this.loginUserId = loginUserId;
	}

	public String getLoginUserName() {
		return loginUserName;
	}

	public void setLoginUserName(String loginUserName) {
		this.loginUserName = loginUserName;
	}

	public String getLoginUserAccount() {
		return loginUserAccount;
	}

	public void setLoginUserAccount(String loginUserAccount) {
		this.loginUserAccount = loginUserAccount;
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