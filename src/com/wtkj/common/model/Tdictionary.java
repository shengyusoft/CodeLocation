package com.wtkj.common.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "sys_dictionary", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Tdictionary extends IdEntity implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String code;
	private String text;
	private Tdictionarytype dictionarytype;
	private Integer seq;
	private Integer state; // 状态 0启用 1停用
	private Integer isdefault; // 是否默认
	private Integer lvs;// 等级
	private String description;// 说明

	public Tdictionary() {

	}

	public Tdictionary(String code, String text,
			Tdictionarytype dictionarytype, Integer seq, Integer state,
			Integer isdefault) {
		super();
		this.code = code;
		this.text = text;
		this.dictionarytype = dictionarytype;
		this.seq = seq;
		this.state = state;
		this.isdefault = isdefault;
	}

	@NotBlank
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@NotBlank
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	@NotNull
	@ManyToOne
	/* (fetch = FetchType.LAZY) */
	@JoinColumn(name = "dictionarytype_id")
	public Tdictionarytype getDictionarytype() {
		return dictionarytype;
	}

	public void setDictionarytype(Tdictionarytype dictionarytype) {
		this.dictionarytype = dictionarytype;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getIsdefault() {
		return isdefault;
	}

	public void setIsdefault(Integer isdefault) {
		this.isdefault = isdefault;
	}

	public Integer getLvs() {
		return lvs;
	}

	public void setLvs(Integer lvs) {
		this.lvs = lvs;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
