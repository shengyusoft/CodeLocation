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
 * 报价单明细
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "quotation_detail", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class QuotationDetail extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Quotation quotation;// 报价单

	private Goods goods;// 商品信息

	private String goodsTypeText;// 分组用

	private double salePrice;// 销售价

	@NotNull
	@ManyToOne
	@JoinColumn(name = "quotationId")
	public Quotation getQuotation() {
		return quotation;
	}

	public void setQuotation(Quotation quotation) {
		this.quotation = quotation;
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

	public double getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(double salePrice) {
		this.salePrice = salePrice;
	}

	@Transient
	public String getGoodsTypeText() {
		return goodsTypeText;
	}

	public void setGoodsTypeText(String goodsTypeText) {
		this.goodsTypeText = goodsTypeText;
	}

}
