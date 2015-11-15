package com.wtkj.rms.msgcenter.model.vo;

import java.util.Date;

import com.wtkj.rms.attachment.model.AttachmentVo;

/**
 * 文章信息vo
 * 
 * @author sunsi
 * 
 */
public class ArticleVo implements java.io.Serializable {
	private static final long serialVersionUID = 4348107233617314745L;
	private Long id;
	private String title;// 标题
	private int level;// 重要程度 0不重要 1一般 2很重要
	private String html;// Html文本
	private Date createDT;
	private String createDTText;
	private Date updateDT;
	private Date publishDT;
	private String publishDTText;
	private Long createUserID;
	private String createUserName;
	private String organizationName;
	private String attachmentIds;// 附件,关联附件表
	private AttachmentVo avo;
	private Boolean publish = false;// 状态,0 未发表,1已发表,默认未发表
	private boolean zd;// 是否置顶
	private int numberOfScan;// 浏览次数
	private Long dictionaryId;// 文章类型,关联字典表
	private String dictionaryText;// 文章类型,关联字典表

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public Date getCreateDT() {
		return createDT;
	}

	public void setCreateDT(Date createDT) {
		this.createDT = createDT;
	}

	public Date getUpdateDT() {
		return updateDT;
	}

	public void setUpdateDT(Date updateDT) {
		this.updateDT = updateDT;
	}

	public Long getCreateUserID() {
		return createUserID;
	}

	public Date getPublishDT() {
		return publishDT;
	}

	public void setPublishDT(Date publishDT) {
		this.publishDT = publishDT;
	}

	public void setCreateUserID(Long createUserID) {
		this.createUserID = createUserID;
	}

	public String getCreateUserName() {
		return createUserName;
	}

	public void setCreateUserName(String createUserName) {
		this.createUserName = createUserName;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

	public int getNumberOfScan() {
		return numberOfScan;
	}

	public void setNumberOfScan(int numberOfScan) {
		this.numberOfScan = numberOfScan;
	}

	public Long getDictionaryId() {
		return dictionaryId;
	}

	public void setDictionaryId(Long dictionaryId) {
		this.dictionaryId = dictionaryId;
	}

	public String getDictionaryText() {
		return dictionaryText;
	}

	public void setDictionaryText(String dictionaryText) {
		this.dictionaryText = dictionaryText;
	}

	public AttachmentVo getAvo() {
		return avo;
	}

	public void setAvo(AttachmentVo avo) {
		this.avo = avo;
	}

	public Boolean getPublish() {
		return publish;
	}

	public void setPublish(Boolean publish) {
		this.publish = publish;
	}

	public boolean isZd() {
		return zd;
	}

	public void setZd(boolean zd) {
		this.zd = zd;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getPublishDTText() {
		return publishDTText;
	}

	public void setPublishDTText(String publishDTText) {
		this.publishDTText = publishDTText;
	}

	public String getCreateDTText() {
		return createDTText;
	}

	public void setCreateDTText(String createDTText) {
		this.createDTText = createDTText;
	}

}
