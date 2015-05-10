package com.wtkj.rms.project.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.rms.project.model.ProjectAppropriateReg;
import com.wtkj.rms.project.service.ProjectAppropriateRegServiceI;

@Service
public class ProjectAppropriateRegServiceImpl implements
		ProjectAppropriateRegServiceI {

	@Autowired
	private BaseDaoI<ProjectAppropriateReg> projectAppropriateRegDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public void add(ProjectAppropriateReg p, HttpServletRequest request) {
		if (p == null) {
			return;
		}
		projectAppropriateRegDao.save(p);
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
		String sql = "delete from ProjectAppropriateReg where id in (" + sqlids
				+ ")";
		projectAppropriateRegDao.executeSql(sql);
	}

	@Override
	public void edit(ProjectAppropriateReg p, HttpServletRequest request) {
		if (p == null || p.getId() == null || p.getId() <= 0) {
			return;
		}
		projectAppropriateRegDao.update(p);
	}

	@Override
	public ProjectAppropriateReg get(Long id) {
		ProjectAppropriateReg p = null;
		if (id != null && id >= 0) {
			p = projectAppropriateRegDao.get(ProjectAppropriateReg.class, id);
		}
		return p;

	}

	@Override
	public List<ProjectAppropriateReg> dataGrid(ProjectAppropriateReg p,
			PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectAppropriateReg t ";
		List<ProjectAppropriateReg> l = projectAppropriateRegDao.find(hql
				+ whereHql(p, params) + orderHql(ph), params, ph.getPage(),
				ph.getRows());

		return l;
	}

	@Override
	public Long count(ProjectAppropriateReg p, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectAppropriateReg t ";
		return projectAppropriateRegDao.count("select count(*) " + hql
				+ whereHql(p, params), params);
	}

	private String whereHql(ProjectAppropriateReg p, Map<String, Object> params) {
		String hql = "";
		if (p != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(p.getProjectName())) {
				hql += " and t.projectName like :name ";
				params.put("name", "%%" + p.getProjectName() + "%%");
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