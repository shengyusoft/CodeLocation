package com.wtkj.rms.attachment.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 项目管理vo
 * 
 * @author sunsi
 * 
 */
public class AttachmentVo implements Serializable {

	private static final long serialVersionUID = -579653067352978950L;
	private String id;
	private String uiName;// 附件名称
	private Long attachmentTypeId;// 附件类别
	private String attachmentTypeText;// 附件类别名称
	private Long createUserID;// 创建人id
	private String createUserText;
	private Date createDT;// 建设时间
	private Long fileSize;// 文件大小
	private String fileType;// 文件类型
	private String path;// 文件路径,项目中的存储路径
	private String attachmentTypeCode;
	private String fileName;

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

	public Long getAttachmentTypeId() {
		return attachmentTypeId;
	}

	public void setAttachmentTypeId(Long attachmentTypeId) {
		this.attachmentTypeId = attachmentTypeId;
	}

	public String getAttachmentTypeText() {
		return attachmentTypeText;
	}

	public void setAttachmentTypeText(String attachmentTypeText) {
		this.attachmentTypeText = attachmentTypeText;
	}

	public Long getCreateUserID() {
		return createUserID;
	}

	public void setCreateUserID(Long createUserID) {
		this.createUserID = createUserID;
	}

	public String getCreateUserText() {
		return createUserText;
	}

	public void setCreateUserText(String createUserText) {
		this.createUserText = createUserText;
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

	public String getAttachmentTypeCode() {
		return attachmentTypeCode;
	}

	public void setAttachmentTypeCode(String attachmentTypeCode) {
		this.attachmentTypeCode = attachmentTypeCode;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
