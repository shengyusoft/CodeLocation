package com.wtkj.rms.process.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

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
	private String processName;// 格式：申请人-类型-时间
	private int state;// 流程状态

	private Date startDT;// 开始时间
	private Date endDT;// 结束时间
	private Long docId;// 启动流程的具体资源，比如报销，这里存的就是报销的ID

	public String getProcessName() {
		return processName;
	}

	public void setProcessName(String processName) {
		this.processName = processName;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
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

}
