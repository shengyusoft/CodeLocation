package com.wtkj.rms.msgcenter.model.po;

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
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;

/**
 * 文章信息vo
 * 
 * @author sunsi
 * 
 */

@Entity
@Table(name = "KC_Article", schema = "")
@DynamicInsert(true)
@DynamicUpdate(true)
public class Article extends IdEntity implements java.io.Serializable {
	private static final long serialVersionUID = 6150060150547511831L;
	private String title;// 标题
	private int level;// 重要程度 0不重要 1一般 2很重要
	private String html;// Html文本
	private Date createDT;// 创建时间
	private Date updateDT;// 更新时间,置顶的时候用
	private Date publishDT;// 发布时间,发表时间
	private Tuser user;
	private Boolean publish;// 是否发表  0 不发表 1 发表
	private boolean zd;// 是否置顶 0不置顶  1置顶  默认不置顶
	private int numberOfScan;// 浏览次数
	private Tdictionary articleType;// 文章类型,关联字典表
	private String attachmentIds;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dictionary_id")
	public Tdictionary getArticleType() {
		return articleType;
	}

	public void setArticleType(Tdictionary articleType) {
		this.articleType = articleType;
	}

	@NotNull
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "createUserID")
	public Tuser getUser() {
		return user;
	}

	public void setUser(Tuser user) {
		this.user = user;
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

	public Date getPublishDT() {
		return publishDT;
	}

	public void setPublishDT(Date publishDT) {
		this.publishDT = publishDT;
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

	public int getNumberOfScan() {
		return numberOfScan;
	}

	public void setNumberOfScan(int numberOfScan) {
		this.numberOfScan = numberOfScan;
	}

	public String getAttachmentIds() {
		return attachmentIds;
	}

	public void setAttachmentIds(String attachmentIds) {
		this.attachmentIds = attachmentIds;
	}

}
