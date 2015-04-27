package com.wtkj.rms.msgcenter.service.impl;

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
import com.wtkj.common.model.Torganization;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.attachment.model.Attachment;
import com.wtkj.rms.msgcenter.model.po.Article;
import com.wtkj.rms.msgcenter.model.vo.ArticleVo;
import com.wtkj.rms.msgcenter.service.ArticleServiceI;

@Service
public class ArticleServiceImpl implements ArticleServiceI {

	@Autowired
	private BaseDaoI<Article> articleDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Attachment> attachmentDao;

	@Autowired
	private BaseDaoI<Torganization> organizationDao;

	@Override
	public void add(ArticleVo articleVo, HttpServletRequest request) {
		Article article = new Article();

		if (articleVo.isZd()) {
			// 置顶,更新时间
			articleVo.setUpdateDT(new Date());
		}

		if (articleVo.getPublish()) {
			// 发布,更新发布时间
			articleVo.setPublishDT(new Date());
		}

		BeanUtils.copyProperties(articleVo, article);

		if (articleVo.getDictionaryId() > 0) {
			article.setArticleType(dictionaryDao.get(Tdictionary.class,
					articleVo.getDictionaryId()));
		}

		if (articleVo.getCreateUserID() > 0) {
			article.setUser(userDao.get(Tuser.class,
					articleVo.getCreateUserID()));
		}

		articleDao.save(article);

	}

	@Override
	public void delete(Long id) {
		Article article = articleDao.get(Article.class, id);
		// TODO 附件需要删除吗?
		articleDao.delete(article);
	}

	@Override
	public void delete(String ids) {
		if (StringUtils.isEmpty(ids)) {
			return;
		}

		String sql = "delete from KC_Article where id in (" + ids + ")";
		try {
			articleDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(ArticleVo articleVo, HttpServletRequest request) {
		Article article = new Article();
		if (articleVo.isZd()) {
			// 置顶,更新时间
			articleVo.setUpdateDT(new Date());
		}

		if (articleVo.getPublish() == null) {
			articleVo.setPublish(false);

		} else if (articleVo.getPublish()) {
			// 发布,更新发布时间
			articleVo.setPublishDT(new Date());
		}

		BeanUtils.copyProperties(articleVo, article);
		if (articleVo.getDictionaryId() > 0) {
			article.setArticleType(dictionaryDao.get(Tdictionary.class,
					articleVo.getDictionaryId()));
		}

		if (articleVo.getCreateUserID() > 0) {
			article.setUser(userDao.get(Tuser.class,
					articleVo.getCreateUserID()));
		}
		articleDao.update(article);
	}

	@Override
	public ArticleVo get(Long id) {
		ArticleVo avo = new ArticleVo();
		Article apo = articleDao.get(Article.class, id);
		BeanUtils.copyProperties(apo, avo);

		if (apo.getArticleType() != null) {
			avo.setDictionaryId(apo.getArticleType().getId());
			avo.setDictionaryText(apo.getArticleType().getText());
		}
		if (apo.getUser() != null) {
			avo.setCreateUserID(apo.getUser().getId());
			avo.setCreateUserName(apo.getUser().getName());

			Torganization o = organizationDao.get(Torganization.class, apo
					.getUser().getOrganization().getId());

			avo.setOrganizationName(o.getName());
		}

		return avo;

	}

	@Override
	public List<ArticleVo> dataGrid(ArticleVo articleVo, PageFilter ph) {
		List<ArticleVo> pl = new ArrayList<ArticleVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Article t ";
		List<Article> l = articleDao.find(hql + whereHql(articleVo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (Article t : l) {
			ArticleVo p = new ArticleVo();
			BeanUtils.copyProperties(t, p);
			if (t.getArticleType() != null) {
				p.setDictionaryId(t.getArticleType().getId());
				p.setDictionaryText(t.getArticleType().getText());
			}
			if (t.getUser() != null) {
				p.setCreateUserID(t.getUser().getId());
				p.setCreateUserName(t.getUser().getName());
			}

			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(ArticleVo articleVo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Article t ";
		return articleDao.count(
				"select count(*) " + hql + whereHql(articleVo, params), params);
	}

	private String whereHql(ArticleVo articleVo, Map<String, Object> params) {
		String hql = "";
		if (articleVo != null) {
			hql += " where 1=1 ";

			if (articleVo.getDictionaryId() != null) {
				hql += " and t.articleType.id = :type";
				params.put("type", articleVo.getDictionaryId());
			}

			if (articleVo.getLevel() > 0) {
				hql += " and t.level = :level";
				params.put("level", articleVo.getLevel());
			}

			if (!StringUtils.isEmpty(articleVo.getTitle())) {
				hql += " and t.title like :title";
				params.put("title", "%%" + articleVo.getTitle() + "%%");
			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = " order by t.updateDT desc";

		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString += ",t." + ph.getSort() + " " + ph.getOrder();
		}

		if (StringUtils.isEmpty(orderString)) {
			orderString = "  order by t.createDT";
		}

		return orderString;
	}

	@Override
	public List<Article> findAll(String type) {
		List<Article> ats = null;
		String sql = "select * from KC_Article a "
				+ "left join sys_dictionary d on a.dictionary_id = d.id "
				+ "left join sys_dictionarytype dt on d.dictionarytype_id=dt.id "
				+ "where dt.code = 'wztype' and d.code = '" + type
				+ "' order by createDT desc";

		ats = articleDao.findBySql(sql, Article.class);
		return ats;
	}

	@Override
	public List<ArticleVo> findPublishs(String type, Long userId) {
		List<Article> as = null;
		List<ArticleVo> aos = new ArrayList<ArticleVo>();

		String base = "select * from KC_Article a "
				+ "left join sys_dictionary d on a.dictionary_id = d.id "
				+ "left join sys_dictionarytype dt on d.dictionarytype_id=dt.id ";

		StringBuilder sql = new StringBuilder(base);

		String where = "where dt.code = 'wztype' and d.code = '" + type + "'"
				+ "and a.publish = 1 ";// 已经发布的

		if (userId != null && userId > 0) {
			sql.append("left join sys_user u on a.createUserID = u.id ");
			where += "and u.id=" + userId;
		}

		sql.append(where);
		sql.append(" order by updateDT desc, createDT desc");

		as = articleDao.findBySql(sql.toString(), Article.class);
		for (Article article : as) {
			ArticleVo vo = new ArticleVo();
			BeanUtils.copyProperties(article, vo);

			if (article.getUser() != null) {
				Torganization o = organizationDao.get(Torganization.class,
						article.getUser().getOrganization().getId());
				vo.setOrganizationName(o.getName());
			}

			if (article.getPublishDT() != null) {
				Date d = article.getPublishDT();
				vo.setPublishDTText(d.getMonth() + "月" + d.getDate() + "日");
			}

			if (article.getCreateDT() != null) {
				Date d = article.getCreateDT();
				vo.setCreateDTText(d.getMonth() + "月" + d.getDate() + "日");
			}

			// vo.set
			aos.add(vo);

		}

		return aos;
	}

	@Override
	public void publish(HttpServletRequest request, String ids) {
		String publishDT = DateUtil.getDate(new Date(), "yyyy-MM-dd HH:mm:ss");
		String hql = "update Article set publish = 1, publishDT='" + publishDT
				+ "' where id in(" + ids + ")";
		articleDao.executeHql(hql);
	}
}
