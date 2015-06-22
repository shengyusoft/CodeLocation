package com.wtkj.rms.reimbursement.model.po;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.rms.process.model.Process;

/**
 * 报销管理,批量报销
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "reimbursementBatch", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class ReimbursementBatch extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Date month;

	private Date createDT;

	private Process process;

	private Double totalFee;

	private int option;

	// @NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "process_id")
	public Process getProcess() {
		return process;
	}

	public void setProcess(Process process) {
		this.process = process;
	}

	public Double getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	public Date getMonth() {
		return month;
	}

	public void setMonth(Date month) {
		this.month = month;
	}

	public Date getCreateDT() {
		return createDT;
	}

	public void setCreateDT(Date createDT) {
		this.createDT = createDT;
	}

	@Transient
	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

}
