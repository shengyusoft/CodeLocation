package com.wtkj.rms.reimbursement.model.vo;

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

import com.wtkj.common.model.Dictionarytype;
import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tdictionarytype;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessVo;

/**
 * 报销管理
 * 
 * @author sunsi
 * 
 */
public class ReimbursementVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Date startDT;// 开始时间
	private Date endDT;// 结束时间

	private Long placeId;// 何地
	private String placeName;
	private String workDetail;// 办何事
	private String costDetail;// 费用明细

	// 费用小计
	private Double trafficFee;// 交通费
	private Double mealFee;// 就餐费
	private Double officeFee;// 办公费
	private Double receiveFee;// 招待费
	private Double badgeFee;// 证章费
	private Double communicationFee;// 通讯费
	private Double trainFee;// 培训费
	private Double otherFee;// 其他费
	private ProcessVo process_vo;

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

	public Long getPlaceId() {
		return placeId;
	}

	public void setPlaceId(Long placeId) {
		this.placeId = placeId;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public ProcessVo getProcess_vo() {
		return process_vo;
	}

	public void setProcess_vo(ProcessVo process_vo) {
		this.process_vo = process_vo;
	}

	public String getWorkDetail() {
		return workDetail;
	}

	public void setWorkDetail(String workDetail) {
		this.workDetail = workDetail;
	}

	public String getCostDetail() {
		return costDetail;
	}

	public void setCostDetail(String costDetail) {
		this.costDetail = costDetail;
	}

	public Double getTrafficFee() {
		return trafficFee;
	}

	public void setTrafficFee(Double trafficFee) {
		this.trafficFee = trafficFee;
	}

	public Double getMealFee() {
		return mealFee;
	}

	public void setMealFee(Double mealFee) {
		this.mealFee = mealFee;
	}

	public Double getOfficeFee() {
		return officeFee;
	}

	public void setOfficeFee(Double officeFee) {
		this.officeFee = officeFee;
	}

	public Double getReceiveFee() {
		return receiveFee;
	}

	public void setReceiveFee(Double receiveFee) {
		this.receiveFee = receiveFee;
	}

	public Double getBadgeFee() {
		return badgeFee;
	}

	public void setBadgeFee(Double badgeFee) {
		this.badgeFee = badgeFee;
	}

	public Double getCommunicationFee() {
		return communicationFee;
	}

	public void setCommunicationFee(Double communicationFee) {
		this.communicationFee = communicationFee;
	}

	public Double getTrainFee() {
		return trainFee;
	}

	public void setTrainFee(Double trainFee) {
		this.trainFee = trainFee;
	}

	public Double getOtherFee() {
		return otherFee;
	}

	public void setOtherFee(Double otherFee) {
		this.otherFee = otherFee;
	}

}
