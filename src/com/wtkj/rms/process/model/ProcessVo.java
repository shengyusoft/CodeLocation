package com.wtkj.rms.process.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 流程
 * 
 * @author sunsi
 * 
 */
public class ProcessVo implements Serializable {
	private static final long serialVersionUID = 1L;
	private long id;
	private String processName;// 格式：申请人-类型-时间(类型)
	private Long applyUserId;// 申请人
	private String applyUserName;
	private Integer state;// 流程状态
	private Date startDT;// 开始时间
	private Date endDT;// 结束时间
	private Long docId;// 启动流程的具体资源，比如报销，这里存的就是报销的ID
	private Date arriveDT;// 任务每一步到达时间
	private String remark;
	private int option;// 审批是否统一，仅仅用于前台传值

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

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

	public long getApplyUserId() {
		return applyUserId;
	}

	public void setApplyUserId(long applyUserId) {
		this.applyUserId = applyUserId;
	}

	public String getApplyUserName() {
		return applyUserName;
	}

	public void setApplyUserName(String applyUserName) {
		this.applyUserName = applyUserName;
	}

	public void setArriveDT(Date arriveDT) {
		this.arriveDT = arriveDT;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

}
