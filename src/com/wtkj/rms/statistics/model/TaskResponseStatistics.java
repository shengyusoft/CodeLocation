package com.wtkj.rms.statistics.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 附件管理
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "statistics_task_response", schema = "")
public class TaskResponseStatistics implements Serializable {

	private static final long serialVersionUID = 6625249529038114020L;
	private String id;
	private String userId;
	private String userName;// 附件名称
	private Double responseDT;// 单位 小时
	
	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Double getResponseDT() {
		return responseDT;
	}

	public void setResponseDT(Double responseDT) {
		this.responseDT = responseDT;
	}

}
