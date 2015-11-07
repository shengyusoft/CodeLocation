package com.wtkj.rms.carRental.model;

import java.io.Serializable;
import java.util.Date;

import com.wtkj.rms.process.model.ProcessVo;

public class CarRentalRegVo implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long id;
	private String usedName;// 用车人
	private Date usedTime;// 用车时间
	private String usedReason;// 用车事由
	private String driver;// 车主
	private String license;// 车号
	private Double startingMileage;// 起点里程
	private Double endMileage;// 终点里程
	private Double drivingMileage;// 行驶里程
	private Double unitPrice;// 单价（元/公里）
	private Double carCost;// 合价（元）
	private Double tolls;// 过路费（元）
	private Double totalCost;// 总计（元）

	private String applicant;
	private Date rentalTimeST;
	private Date rentalTimeET;
	// 处理类型
	private String actionType;

	// 关联流程
	private ProcessVo process_vo;

	// 查询参数
	private Date applyStartDt;
	private Date applyEndDt;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsedName() {
		return usedName;
	}

	public void setUsedName(String usedName) {
		this.usedName = usedName;
	}

	public Date getUsedTime() {
		return usedTime;
	}

	public void setUsedTime(Date usedTime) {
		this.usedTime = usedTime;
	}

	public String getUsedReason() {
		return usedReason;
	}

	public void setUsedReason(String usedReason) {
		this.usedReason = usedReason;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getLicense() {
		return license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	public Double getStartingMileage() {
		return startingMileage;
	}

	public void setStartingMileage(Double startingMileage) {
		this.startingMileage = startingMileage;
	}

	public Double getEndMileage() {
		return endMileage;
	}

	public void setEndMileage(Double endMileage) {
		this.endMileage = endMileage;
	}

	public Double getDrivingMileage() {
		return drivingMileage;
	}

	public void setDrivingMileage(Double drivingMileage) {
		this.drivingMileage = drivingMileage;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Double getCarCost() {
		return carCost;
	}

	public void setCarCost(Double carCost) {
		this.carCost = carCost;
	}

	public Double getTolls() {
		return tolls;
	}

	public void setTolls(Double tolls) {
		this.tolls = tolls;
	}

	public Double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(Double totalCost) {
		this.totalCost = totalCost;
	}

	public ProcessVo getProcess_vo() {
		return process_vo;
	}

	public void setProcess_vo(ProcessVo process_vo) {
		this.process_vo = process_vo;
	}

	public String getApplicant() {
		return applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	public Date getRentalTimeST() {
		return rentalTimeST;
	}

	public void setRentalTimeST(Date rentalTimeST) {
		this.rentalTimeST = rentalTimeST;
	}

	public Date getRentalTimeET() {
		return rentalTimeET;
	}

	public void setRentalTimeET(Date rentalTimeET) {
		this.rentalTimeET = rentalTimeET;
	}

	public String getActionType() {
		return actionType;
	}

	public void setActionType(String actionType) {
		this.actionType = actionType;
	}

	public Date getApplyStartDt() {
		return applyStartDt;
	}

	public void setApplyStartDt(Date applyStartDt) {
		this.applyStartDt = applyStartDt;
	}

	public Date getApplyEndDt() {
		return applyEndDt;
	}

	public void setApplyEndDt(Date applyEndDt) {
		this.applyEndDt = applyEndDt;
	}
}
