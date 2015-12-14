package com.wtkj.rms.reimbursement.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.wtkj.rms.process.model.ProcessVo;

/**
 * 报销管理
 * 
 * @author sunsi
 * 
 */
public class ReimbursementBatchVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;

	private Date month;

	private ProcessVo process_vo;

	private Date createDT;

	private Double totalFee;

	private int option;

	private int locked = 0;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getMonth() {
		return month;
	}

	public void setMonth(Date month) {
		this.month = month;
	}

	public ProcessVo getProcess_vo() {
		return process_vo;
	}

	public void setProcess_vo(ProcessVo process_vo) {
		this.process_vo = process_vo;
	}

	public Date getCreateDT() {
		return createDT;
	}

	public void setCreateDT(Date createDT) {
		this.createDT = createDT;
	}

	public Double getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(Double totalFee) {
		this.totalFee = totalFee;
	}

	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

	public int getLocked() {
		return locked;
	}

	public void setLocked(int locked) {
		this.locked = locked;
	}

}
