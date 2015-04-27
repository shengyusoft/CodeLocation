package com.wtkj.rms.attachment.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.msgcenter.model.po.Article;

/**
 * 附件管理
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "KC_Attachment", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Attachment implements Serializable {

	private String id;
	private static final long serialVersionUID = 6625249529038114020L;
	private String uiName;// 附件名称
	private Tdictionary attachType;
	private Tuser user;
	private Date createDT;// 建设时间
	private Long fileSize;// 文件大小
	private String fileType;// 文件类型
	private String path;// 文件路径,项目中的存储路径
	private String fileName;

	@Id
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUiName() {
		return uiName;
	}

	public void setUiName(String uiName) {
		this.uiName = uiName;
	}
	
	
	@NotNull
	@ManyToOne(targetEntity=Tdictionary.class,fetch = FetchType.LAZY)
	@JoinColumn(name = "attachmentTypeId")
	public Tdictionary getAttachType() {
		return attachType;
	}

	public void setAttachType(Tdictionary attachType) {
		this.attachType = attachType;
	}

	@NotNull
	@ManyToOne(targetEntity=Tuser.class,fetch = FetchType.LAZY)
	@JoinColumn(name = "createUserID")
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

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
