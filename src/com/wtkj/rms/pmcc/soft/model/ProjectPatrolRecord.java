package com.wtkj.rms.pmcc.soft.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 工程巡查记录
 */
@Entity
@Table(name = "project_patrol_record", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProjectPatrolRecord extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String registerId; // 巡查登记表主键
	private String projectName; // 项目名称
	private String patrolPerson; // 巡查人
	private Date patrolTime; // 巡查时间
	private Integer patrolNo; // 巡查次数
	private String patrolResult; // 巡查结果
	private String handleMethod; // 处理措施
	private String remark; // 备注
	private Date creatTime; // 创建时间
	private String creater; // 创建人
	private String createrName; // 创建人中文名
	private String delFlag; // 删除标记0:未删除；1：已删除
	
	
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getCreaterName() {
		return createrName;
	}
	public void setCreaterName(String createrName) {
		this.createrName = createrName;
	}
	public String getRegisterId() {
		return registerId;
	}
	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}
	public String getPatrolPerson() {
		return patrolPerson;
	}
	public void setPatrolPerson(String patrolPerson) {
		this.patrolPerson = patrolPerson;
	}
	public Date getPatrolTime() {
		return patrolTime;
	}
	public void setPatrolTime(Date patrolTime) {
		this.patrolTime = patrolTime;
	}
	public Integer getPatrolNo() {
		return patrolNo;
	}
	public void setPatrolNo(Integer patrolNo) {
		this.patrolNo = patrolNo;
	}
	public String getPatrolResult() {
		return patrolResult;
	}
	public void setPatrolResult(String patrolResult) {
		this.patrolResult = patrolResult;
	}
	public String getHandleMethod() {
		return handleMethod;
	}
	public void setHandleMethod(String handleMethod) {
		this.handleMethod = handleMethod;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}
	public String getCreater() {
		return creater;
	}
	public void setCreater(String creater) {
		this.creater = creater;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

}
