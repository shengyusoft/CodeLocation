package com.wtkj.rms.attachment.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wtkj.common.PageFilter;
import com.wtkj.rms.attachment.model.AttachmentVo;

public interface AttachmentServiceI {

	public List<AttachmentVo> dataGrid(AttachmentVo attachmentVo, PageFilter ph);

	public Long count(AttachmentVo attachmentVo, PageFilter ph);

	public AttachmentVo get(String id);

	public void add(AttachmentVo attachmentVo, HttpServletRequest request);

	public void edit(AttachmentVo attachmentVo, HttpServletRequest request);

	public void delete(String ids);

	public List<AttachmentVo> findByArticleId(Long id);

	public List<AttachmentVo> findByIds(String ids);
}
