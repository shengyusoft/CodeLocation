package com.wtkj.rms.dailymaintain.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;
import com.wtkj.common.model.Tuser;

/**
 * 巡点服务记录
 * 
 * @author sunsi
 * 
 */
@Entity
@Table(name = "DM_PointInspect", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class PointInspect extends IdEntity implements Serializable {
	private static final long serialVersionUID = -293655645522171826L;
	private String name;// 巡点名称

	private Tuser user;// 巡检人

	private Date createDT;// 创建时间

	private String attachmentIds;// 主动关联附件

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId")
	public Tuser getUser() {
		return user;
	}

	public void setUser(Tuser user) {
		this.user = user;
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
