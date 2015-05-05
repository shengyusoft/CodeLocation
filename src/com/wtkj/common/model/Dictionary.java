package com.wtkj.common.model;

/**
 * 数据字典model
 * 
 * @author Sunhb
 * 
 */
public class Dictionary implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String code;
	private String text;
	private Long dictionarytypeId;
	private String dictionarytypeName;
	private Integer seq;
	private Integer state; // 状态 0启用 1停用
	private Integer isdefault; // 是否默认
	private Integer lvs;// 等级
	private String description;//说明

	public Dictionary() {

	}

	public Dictionary(String code, String text, Integer seq, Integer state,
			Integer isdefault) {
		super();
		this.code = code;
		this.text = text;
		this.seq = seq;
		this.state = state;
		this.isdefault = isdefault;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
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

	public Long getDictionarytypeId() {
		return dictionarytypeId;
	}

	public void setDictionarytypeId(Long dictionarytypeId) {
		this.dictionarytypeId = dictionarytypeId;
	}

	public String getDictionarytypeName() {
		return dictionarytypeName;
	}

	public void setDictionarytypeName(String dictionarytypeName) {
		this.dictionarytypeName = dictionarytypeName;
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
