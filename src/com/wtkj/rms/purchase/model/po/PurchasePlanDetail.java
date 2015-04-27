package com.wtkj.rms.purchase.model.po;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.rms.goods.model.Goods;

/**
 * 采购计划单单明细
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "purchase_plan_detail", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class PurchasePlanDetail extends IdEntity implements Serializable {

	private static final long serialVersionUID = 2071669456093805959L;

	private PurchasePlan purchasePlan;// 关联采购单

	private Goods goods;// 商品信息

	private String goodsTypeText;// 分组用

	private int scheduleNum;// 预定数量

	private double total;// 合计

	private String remark;// 备注

	@NotNull
	@ManyToOne
	@JoinColumn(name = "purchasePlanId")
	public PurchasePlan getPurchasePlan() {
		return purchasePlan;
	}

	public void setPurchasePlan(PurchasePlan purchasePlan) {
		this.purchasePlan = purchasePlan;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "goodsId")
	public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Transient
	public String getGoodsTypeText() {
		return goodsTypeText;
	}

	public void setGoodsTypeText(String goodsTypeText) {
		this.goodsTypeText = goodsTypeText;
	}

	public int getScheduleNum() {
		return scheduleNum;
	}

	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
