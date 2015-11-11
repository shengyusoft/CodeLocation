package com.wtkj.rms.process.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tuser;

/**
 * 流程历史操作记录
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "process_history", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ProcessHistory extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Tuser operator;// 当前操作人
	// private Tuser nextOperator;// 下一步操作人
	private Date operateDT;// 操作时间
	private String operateDetail;// 操作详情
	private Process process;// 关联流程
	private String remark;// 审批意见,一般不通过时说明原因
	private String remark2;// 备注

	// @NotNull
	// @ManyToOne(fetch = FetchType.LAZY)
	// @JoinColumn(name = "next_user_id")
	// public Tuser getNextOperator() {
	// return nextOperator;
	// }
	//
	// public void setNextOperator(Tuser nextOperator) {
	// this.nextOperator = nextOperator;
	// }

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "process_id")
	public Process getProcess() {
		return process;
	}

	public void setProcess(Process process) {
		this.process = process;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	public Tuser getOperator() {
		return operator;
	}

	public void setOperator(Tuser operator) {
		this.operator = operator;
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

	public String getRemark2() {
		return remark2;
	}

	public void setRemark2(String remark2) {
		this.remark2 = remark2;
	}

}
