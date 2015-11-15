package com.wtkj.rms.msgcenter.model.po;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.IdEntity;

/**
 * 系统的提醒
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "sys_remind", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Remind extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 6150060150547511831L;

	// 提醒类型：按照类型加上比如证书到期：certificate
	private String type;// 提醒类型
	private String content;// 提醒内容

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
