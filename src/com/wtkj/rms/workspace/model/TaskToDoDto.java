package com.wtkj.rms.workspace.model;

import java.io.Serializable;

/**
 * 待办事宜 ,完全在后台包装,对不同类型的待办提取公共部分
 * 
 * @author sunsi
 * 
 */

public class TaskToDoDto implements Serializable {

	private static final long serialVersionUID = 6625249529038114020L;
	private Long id;// 和关联的待办任务主键相同
	private String tag;
	private String type;// 待办类型
	private String name;// 待办名称
	private Integer level;// 待办事宜重要程度
	private String levelText;// 待办事宜重要程度
	private String handlerUrl;// 待办处理url,例如任务:/task/acceptPage
	private Integer state;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getLevelText() {
		return levelText;
	}

	public void setLevelText(String levelText) {
		this.levelText = levelText;
	}

	public String getHandlerUrl() {
		return handlerUrl;
	}

	public void setHandlerUrl(String handlerUrl) {
		this.handlerUrl = handlerUrl;
	}

}
