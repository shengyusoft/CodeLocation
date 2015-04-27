package com.wtkj.rms.attachment.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.attachment.model.Attachment;
import com.wtkj.rms.attachment.model.AttachmentVo;
import com.wtkj.rms.attachment.service.AttachmentServiceI;
import com.wtkj.rms.msgcenter.model.po.Article;

@Service
public class AttachmentServiceImpl implements AttachmentServiceI {

	@Autowired
	private BaseDaoI<Attachment> attachmentDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Article> articleDao;

	@Override
	public void add(AttachmentVo attachmentVo, HttpServletRequest request) {
		Attachment attachment = new Attachment();
		BeanUtils.copyProperties(attachmentVo, attachment);

		attachment.setCreateDT(new Date());

		if (attachmentVo.getAttachmentTypeId() != null) {
			attachment.setAttachType(dictionaryDao.get(Tdictionary.class,
					attachmentVo.getAttachmentTypeId()));
		}

		if (attachmentVo.getCreateUserID() != null) {
			attachment.setUser(userDao.get(Tuser.class,
					attachmentVo.getCreateUserID()));
		}

		attachmentDao.save(attachment);
	}

	@Override
	public void delete(String ids) {
		String sqlids = "";
		if (!StringUtils.isEmpty(ids) && ids.length() > 0) {
			String[] idArray = ids.split(",");
			if (idArray.length == 1) {
				sqlids = "'" + idArray[0] + "'";
			} else {
				for (int i = 0; i < idArray.length; i++) {
					String id = idArray[i];
					sqlids += i == idArray.length ? ("'" + id + "'") : ("'"
							+ id + "',");
				}
			}
		}
		String sql = "delete from KC_Attachment where id in (" + sqlids + ")";

		try {
			// TODO 删除附件文件IO操作
			String[] idArray = ids.split(",");
			for (String id : idArray) {
				Attachment at = attachmentDao.get(Attachment.class, id);
				File file = new File(at.getPath());
				if (file.exists()) {
					file.delete();
				}
			}

			attachmentDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(AttachmentVo attachmentVo, HttpServletRequest request) {
		Attachment attachment = new Attachment();
		BeanUtils.copyProperties(attachmentVo, attachment);

		if (attachmentVo.getAttachmentTypeId() > 0) {
			attachment.setAttachType(dictionaryDao.get(Tdictionary.class,
					attachmentVo.getAttachmentTypeId()));
		}

		if (attachmentVo.getCreateUserID() > 0) {
			attachment.setUser(userDao.get(Tuser.class,
					attachmentVo.getCreateUserID()));
		}

		attachmentDao.update(attachment);
	}

	@Override
	public AttachmentVo get(String id) {
		AttachmentVo vo = new AttachmentVo();
		Attachment po = attachmentDao.get(Attachment.class, id);
		BeanUtils.copyProperties(po, vo);
		if (po.getAttachType() != null) {
			vo.setAttachmentTypeId(po.getAttachType().getId());
			vo.setAttachmentTypeText(po.getAttachType().getText());
		}

		if (po.getUser() != null) {
			vo.setCreateUserID(po.getUser().getId());
			vo.setCreateUserText(po.getUser().getName());
		}

		return vo;

	}

	@Override
	public List<AttachmentVo> dataGrid(AttachmentVo attachmentVo, PageFilter ph) {
		List<AttachmentVo> pl = new ArrayList<AttachmentVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Attachment t ";
		List<Attachment> l = attachmentDao.find(
				hql + whereHql(attachmentVo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		for (Attachment t : l) {
			AttachmentVo p = new AttachmentVo();
			BeanUtils.copyProperties(t, p);

			if (t.getAttachType() != null) {
				p.setAttachmentTypeId(t.getAttachType().getId());
				p.setAttachmentTypeText(t.getAttachType().getText());
			}

			if (t.getUser() != null) {
				p.setCreateUserID(t.getUser().getId());
				p.setCreateUserText(t.getUser().getName());
			}

			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(AttachmentVo AttachmentVo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Attachment t ";
		return attachmentDao.count(
				"select count(*) " + hql + whereHql(AttachmentVo, params),
				params);
	}

	private String whereHql(AttachmentVo attachmentVo,
			Map<String, Object> params) {
		String hql = "";
		if (attachmentVo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(attachmentVo.getUiName())) {
				hql += " and t.uiName like :name";
				params.put("name", "%%" + attachmentVo.getUiName() + "%%");
			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	@Override
	public List<AttachmentVo> findByArticleId(Long id) {
		List<AttachmentVo> ats = new ArrayList<AttachmentVo>();
		String hql = "from Attachment a where a.article.id =" + id;
		List<Attachment> attachments = attachmentDao.find(hql);
		for (Attachment attachment : attachments) {
			AttachmentVo vo = new AttachmentVo();
			BeanUtils.copyProperties(attachment, vo);
			ats.add(vo);
		}
		return ats;
	}

	@Override
	public List<AttachmentVo> findByIds(String ids) {
		List<AttachmentVo> ats = new ArrayList<AttachmentVo>();
		String hql = "from Attachment a where a.id in(" + ids + ")";
		List<Attachment> attachments = attachmentDao.find(hql);
		for (Attachment attachment : attachments) {
			AttachmentVo vo = new AttachmentVo();
			BeanUtils.copyProperties(attachment, vo);
			ats.add(vo);
		}
		return ats;
	}

}
