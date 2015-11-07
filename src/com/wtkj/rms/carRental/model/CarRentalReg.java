package com.wtkj.rms.carRental.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
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

@Entity
@Table(name = "car_rental_reg", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class CarRentalReg extends IdEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	private String usedName;//
	private Date usedTime;
	private String usedReason;
	private String driver;
	private String license;
	private Double startingMileage;
	private Double endMileage;
	private Double drivingMileage;
	private Double unitPrice;
	private Double carCost;
	private Double tolls;
	private Double totalCost;
	private String applicant;
	private Date rentalTimeST;
	private Date rentalTimeET;

	// 关联流程
	private Process process;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "process_id")
	public Process getProcess() {
		return process;
	}

	public void setProcess(Process process) {
		this.process = process;
	}

	@Transient
	public String getApplicant() {
		return this.applicant;
	}

	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	@Transient
	public Date getRentalTimeST() {
		return this.rentalTimeST;
	}

	public void setRentalTimeST(Date rentalTimeST) {
		this.rentalTimeST = rentalTimeST;
	}

	@Transient
	public Date getRentalTimeET() {
		return this.rentalTimeET;
	}

	public void setRentalTimeET(Date rentalTimeET) {
		this.rentalTimeET = rentalTimeET;
	}

	@Column(name = "used_name")
	public String getUsedName() {
		return this.usedName;
	}

	public void setUsedName(String usedName) {
		this.usedName = usedName;
	}

	@Column(name = "used_time")
	public Date getUsedTime() {
		return this.usedTime;
	}

	public void setUsedTime(Date usedTime) {
		this.usedTime = usedTime;
	}

	@Column(name = "used_reason")
	public String getUsedReason() {
		return this.usedReason;
	}

	public void setUsedReason(String usedReason) {
		this.usedReason = usedReason;
	}

	@Column(name = "driver")
	public String getDriver() {
		return this.driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	@Column(name = "license")
	public String getLicense() {
		return this.license;
	}

	public void setLicense(String license) {
		this.license = license;
	}

	@Column(name = "starting_mileage")
	public Double getStartingMileage() {
		return this.startingMileage;
	}

	public void setStartingMileage(Double startingMileage) {
		this.startingMileage = startingMileage;
	}

	@Column(name = "end_mileage")
	public Double getEndMileage() {
		return this.endMileage;
	}

	public void setEndMileage(Double endMileage) {
		this.endMileage = endMileage;
	}

	@Column(name = "driving_mileage")
	public Double getDrivingMileage() {
		return this.drivingMileage;
	}

	public void setDrivingMileage(Double drivingMileage) {
		this.drivingMileage = drivingMileage;
	}

	@Column(name = "unit_price")
	public Double getUnitPrice() {
		return this.unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	@Column(name = "car_cost")
	public Double getCarCost() {
		return this.carCost;
	}

	public void setCarCost(Double carCost) {
		this.carCost = carCost;
	}

	@Column(name = "tolls")
	public Double getTolls() {
		return this.tolls;
	}

	public void setTolls(Double tolls) {
		this.tolls = tolls;
	}

	@Column(name = "total_cost")
	public Double getTotalCost() {
		return this.totalCost;
	}

	public void setTotalCost(Double totalCost) {
		this.totalCost = totalCost;
	}
}
