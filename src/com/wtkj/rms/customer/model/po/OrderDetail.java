package com.wtkj.rms.customer.model.po;

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
 * 客户订单明细
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "order_detail", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class OrderDetail extends IdEntity implements Serializable {

	private static final long serialVersionUID = 2071669456093805959L;

	private Order torder;// 关联订单

	// 这些信息应该和报价单一样
	private Goods goods;// 商品信息

	private String goodsTypeText;// 分组用

	private double salePrice;// 报价，来至于报价单

	private int scheduleNum;// 预定数量

	private int acceptNum;// 实收数量

	private double total;// 合计

	private String remark;// 备注

	@NotNull
	@ManyToOne
	@JoinColumn(name = "orderId")
	public Order getTorder() {
		return torder;
	}

	public void setTorder(Order torder) {
		this.torder = torder;
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

	public double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

	public int getScheduleNum() {
		return scheduleNum;
	}

	public void setScheduleNum(int scheduleNum) {
		this.scheduleNum = scheduleNum;
	}

	public int getAcceptNum() {
		return acceptNum;
	}

	public void setAcceptNum(int acceptNum) {
		this.acceptNum = acceptNum;
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
