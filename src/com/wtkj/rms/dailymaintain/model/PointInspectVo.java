package com.wtkj.rms.dailymaintain.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 巡点服务记录
 * 
 * @author sunsi
 * 
 */
public class PointInspectVo implements Serializable {
	private static final long serialVersionUID = -293655645522171826L;

	private Long id;

	private String name;// 巡点名称

	private Long userId;// 巡检人

	private String userName;// 巡检人

	private Date createDT;// 创建时间

	private String attachmentIds;// 主动关联附件

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

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getCreateDT() {
		return createDT;
	}

	public void setCreateDT(Date createDT) {
		this.createDT = createDT;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

}
