package com.wtkj.common.model;

import org.springframework.beans.BeanUtils;

/**
 * 数据字典-字典类别model
 * @author Sunhb
 *
 */
public class Dictionarytype  implements java.io.Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String code;
	private String name;
	private Integer seq;
	private String description;
	private String pid;
	
	public Dictionarytype(){
		
	}
	
	public Dictionarytype(String code, String name, Integer seq,
			String description) {
		super();
		this.code = code;
		this.name = name;
		this.seq = seq;
		this.description = description;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getDescription() {
		return description;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
