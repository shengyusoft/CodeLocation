package com.wtkj.rms.process.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 流程历史操作记录
 * 
 * @author sunsi
 * 
 */
public class ProcessHistoryVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Long operatorId;// 当前操作人
	private String operatorName;
	private Date operateDT;// 操作时间
	private String operateDetail;// 操作详情
	private ProcessVo processvo;// 关联流程
	private String remark;// 审批意见,一般不通过时说明原因

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}


	public Long getOperatorId() {
		return operatorId;
	}

	public void setOperatorId(Long operatorId) {
		this.operatorId = operatorId;
	}

	public String getOperatorName() {
		return operatorName;
	}

	public void setOperatorName(String operatorName) {
		this.operatorName = operatorName;
	}

	public ProcessVo getProcessvo() {
		return processvo;
	}

	public void setProcessvo(ProcessVo processvo) {
		this.processvo = processvo;
	}

	public Date getOperateDT() {
		return operateDT;
	}

	public void setOperateDT(Date operateDT) {
		this.operateDT = operateDT;
	}

	public String getOperateDetail() {
		return operateDetail;
	}

	public void setOperateDetail(String operateDetail) {
		this.operateDetail = operateDetail;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
