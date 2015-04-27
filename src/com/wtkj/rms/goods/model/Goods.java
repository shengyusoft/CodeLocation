package com.wtkj.rms.goods.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tdictionary;

/**
 * 商品信息
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "goods", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Goods extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Tdictionary type;// 商品分类
	private String name;// 商品名称
	private String unit;// 单位
	private String standard;// 规格
	private double price;// 采购价
	private String orderPrice1;// 定价1
	private String orderPrice2;// 定价2
	private String orderPrice3;// 定价3
	private String remark;// 商品说明，备注

	
	@NotNull
	@ManyToOne
	@JoinColumn(name = "dictionary_id")
	public Tdictionary getType() {
		return type;
	}

	public void setType(Tdictionary type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getOrderPrice1() {
		return orderPrice1;
	}

	public void setOrderPrice1(String orderPrice1) {
		this.orderPrice1 = orderPrice1;
	}

	public String getOrderPrice2() {
		return orderPrice2;
	}

	public void setOrderPrice2(String orderPrice2) {
		this.orderPrice2 = orderPrice2;
	}

	public String getOrderPrice3() {
		return orderPrice3;
	}

	public void setOrderPrice3(String orderPrice3) {
		this.orderPrice3 = orderPrice3;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
