package com.wtkj.rms.goods.model;

import java.io.Serializable;

/**
 * 商品信息
 * 
 * @author sunsi
 * 
 */
public class GoodsVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private Long typeId;// 商品分类id
	private String typeText;// 商品分类名称
	private String name;// 商品名称
	private String unit;// 单位
	private String standard;// 规格
	private double price;// 采购价
	private String orderPrice1;// 定价1
	private String orderPrice2;// 定价2
	private String orderPrice3;// 定价3
	private String remark;// 商品说明，备注

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getTypeText() {
		return typeText;
	}

	public void setTypeText(String typeText) {
		this.typeText = typeText;
	}

}
