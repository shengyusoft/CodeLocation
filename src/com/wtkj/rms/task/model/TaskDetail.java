package com.wtkj.rms.task.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 接收者任务计划
 * 
 * @author
 * 
 */
@Entity
@Table(name = "task_detail", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class TaskDetail extends IdEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long taskId;// 关联任务
	private Date timeLine;// 时间节点
	private String finshContent;// 完成内容

	public Long getTaskId() {
		return taskId;
	}

	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}

	public Date getTimeLine() {
		return timeLine;
	}

	public void setTimeLine(Date timeLine) {
		this.timeLine = timeLine;
	}

	public String getFinshContent() {
		return finshContent;
	}

	public void setFinshContent(String finshContent) {
		this.finshContent = finshContent;
	}

}
