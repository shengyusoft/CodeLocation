package com.wtkj.rms.code.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.attachment.model.Attachment;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.code.model.po.Software;
import com.wtkj.rms.code.model.vo.SoftwareVo;
import com.wtkj.rms.code.service.SoftwareServiceI;

@Service
public class SoftwareServiceImpl implements SoftwareServiceI {

	@Autowired
	private BaseDaoI<Software> softwareDao;

	@Autowired
	private BaseDaoI<Project> projectDao;

	@Autowired
	private BaseDaoI<Merchant> merchantDao;

	@Autowired
	private BaseDaoI<Attachment> attachmentDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void add(SoftwareVo vo, HttpServletRequest request) {
		Software po = vo.toPo(attachmentDao, merchantDao, projectDao, userDao);
		softwareDao.save(po);
	}

	@Override
	public void delete(Long id) {
		Software p = softwareDao.get(Software.class, id);
		softwareDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from CM_Software where id in (" + ids + ")";
		try {
			softwareDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(SoftwareVo vo, HttpServletRequest request) {
		Software po = vo.toPo(attachmentDao, merchantDao, projectDao, userDao);
		softwareDao.update(po);
	}

	@Override
	public SoftwareVo get(Long id) {
		SoftwareVo vo = new SoftwareVo();
		Software po = softwareDao.get(Software.class, id);
		vo = po.toVo();
		return vo;

	}

	@Override
	public List<SoftwareVo> dataGrid(SoftwareVo vo, PageFilter ph) {
		List<SoftwareVo> pl = new ArrayList<SoftwareVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Software t ";
		List<Software> l = softwareDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (Software t : l) {
			SoftwareVo p = t.toVo();
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(SoftwareVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Software t ";
		return softwareDao.count("select count(*) " + hql
				+ whereHql(vo, params), params);
	}

	private String whereHql(SoftwareVo vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + vo.getName() + "%%");
			}

			if (vo.getState() > 0) {
				hql += " and t.state = :state";
				params.put("state", vo.getState());
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

}
