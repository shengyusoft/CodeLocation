package com.wtkj.rms.process.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tuser;

/**
 * 流程
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "process", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Process extends IdEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	private String processName;// 格式：申请人-类型-时间(类型)
	private Tuser applyUser;// 申请人
	private Integer state;// 流程状态

	private Date startDT;// 开始时间
	private Date endDT;// 结束时间
	private Long docId;// 启动流程的具体资源，比如报销，这里存的就是报销的ID
	private Date arriveDT;// 任务每一步到达时间
	private String remark;
	private int option;// 审批是否统一，仅仅用于前台传值

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Date getStartDT() {
		return startDT;
	}

	public void setStartDT(Date startDT) {
		this.startDT = startDT;
	}

	public Date getEndDT() {
		return endDT;
	}

	public void setEndDT(Date endDT) {
		this.endDT = endDT;
	}

	public Long getDocId() {
		return docId;
	}

	public void setDocId(Long docId) {
		this.docId = docId;
	}

	public Date getArriveDT() {
		return arriveDT;
	}

	public void setArriveDT(Date arriveDT) {
		this.arriveDT = arriveDT;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "applyUserId")
	public Tuser getApplyUser() {
		return applyUser;
	}

	public void setApplyUser(Tuser applyUser) {
		this.applyUser = applyUser;
	}

	@Transient
	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Transient
	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}
	
}
