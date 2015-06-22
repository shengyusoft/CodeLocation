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
public class ReimbursementVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Date startDT;// 开始时间
	private Date endDT;// 结束时间

	// 省市县区划
	private Long proviceId;
	private String proviceName;

	private Long cityId;
	private String cityName;

	private Long countyId;
	private String countyName;

	private String workDetail;// 办何事
	private String costDetail;// 费用明细

	private String place;

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
	private Double total;

	private int option;

	/**
	 * 0单独报销1批量报销
	 */
	private int type = 0;

	/**
	 * 关联批量报销
	 */
	private Long batchId;

	public int getOption() {
		return option;
	}

	public void setOption(int option) {
		this.option = option;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Long getBatchId() {
		return batchId;
	}

	public void setBatchId(Long batchId) {
		this.batchId = batchId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Long getProviceId() {
		return proviceId;
	}

	public void setProviceId(Long proviceId) {
		this.proviceId = proviceId;
	}

	public String getProviceName() {
		return proviceName;
	}

	public void setProviceName(String proviceName) {
		this.proviceName = proviceName;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Long getCountyId() {
		return countyId;
	}

	public void setCountyId(Long countyId) {
		this.countyId = countyId;
	}

	public String getCountyName() {
		return countyName;
	}

	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
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

	public Double getTotal() {
		return parseValue(this.trafficFee) + parseValue(this.mealFee)
				+ parseValue(this.officeFee) + parseValue(this.receiveFee)
				+ parseValue(this.badgeFee) + parseValue(this.communicationFee)
				+ parseValue(this.trafficFee) + parseValue(this.otherFee);
	}

	private Double parseValue(Double fee) {
		return fee == null ? 0 : fee;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

}
