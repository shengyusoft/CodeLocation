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
import com.wtkj.common.model.Tdictionarytype;
import com.wtkj.rms.project.model.Certificate;
import com.wtkj.rms.project.model.ProjectRegist;
import com.wtkj.rms.project.service.ProjectRegistServiceI;

@Service
public class ProjectRegistServiceImpl implements ProjectRegistServiceI {

	@Autowired
	private BaseDaoI<ProjectRegist> projectRegistDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;
	
	
	@Autowired
	private BaseDaoI<Tdictionarytype> dictionarytypeDao;
	
	@Autowired
	private BaseDaoI<Certificate> certificateDao;

	@Override
	public void add(ProjectRegist p, HttpServletRequest request) {
		//p.setRegistDT(new Date());
		System.out.println("=================="+p.getCertificateA());
		p.setProjectMgr(dictionaryDao.get(Tdictionary.class, p.getProjectMgr()
				.getId()));
		p.setTechniqueMgr(dictionaryDao.get(Tdictionary.class, p
				.getTechniqueMgr().getId()));
		p.setDelegator(dictionaryDao.get(Tdictionary.class, p.getDelegator()
				.getId()));

		p.setProvice(dictionarytypeDao.get(Tdictionarytype.class, p.getProvice()
				.getId()));
		p.setCity(dictionarytypeDao.get(Tdictionarytype.class, p.getCity().getId()));
		p.setCounty(dictionarytypeDao.get(Tdictionarytype.class, p.getCounty().getId()));

		p.setCompany(dictionaryDao.get(Tdictionary.class, p.getCompany()
				.getId()));
		p.setMember5Card(certificateDao.get(Certificate.class, p
				.getMember5Card().getId()));

		p.setCertificateA(certificateDao.get(Certificate.class, p
				.getCertificateA().getId()));
		p.setCertificateB(certificateDao.get(Certificate.class, p
				.getCertificateB().getId()));
		p.setCertificateC(certificateDao.get(Certificate.class, p
				.getCertificateC().getId()));
		
//
		projectRegistDao.save(p);
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
		String sql = "delete from ProjectRegist where id in (" + sqlids + ")";
		projectRegistDao.executeSql(sql);
	}

	@Override
	public void edit(ProjectRegist p, HttpServletRequest request) {
		p.setRegistDT(new Date());
		p.setProjectMgr(dictionaryDao.get(Tdictionary.class, p.getProjectMgr()
				.getId()));
		p.setTechniqueMgr(dictionaryDao.get(Tdictionary.class, p
				.getTechniqueMgr().getId()));
		p.setDelegator(dictionaryDao.get(Tdictionary.class, p.getDelegator()
				.getId()));

		p.setProvice(dictionarytypeDao.get(Tdictionarytype.class, p.getProvice()
				.getId()));
		p.setCity(dictionarytypeDao.get(Tdictionarytype.class, p.getCity().getId()));
		p.setCounty(dictionarytypeDao.get(Tdictionarytype.class, p.getCounty().getId()));

		p.setCompany(dictionaryDao.get(Tdictionary.class, p.getCompany()
				.getId()));
		p.setMember5Card(certificateDao.get(Certificate.class, p
				.getMember5Card().getId()));

		p.setCertificateA(certificateDao.get(Certificate.class, p
				.getCertificateA().getId()));
		p.setCertificateB(certificateDao.get(Certificate.class, p
				.getCertificateB().getId()));
		p.setCertificateC(certificateDao.get(Certificate.class, p
				.getCertificateC().getId()));
		projectRegistDao.update(p);
	}

	@Override
	public ProjectRegist get(String id) {
		ProjectRegist p = null;
		if (!StringUtils.isEmpty(id)) {
			p = projectRegistDao.get(ProjectRegist.class, id);
		}
		return p;

	}

	@Override
	public List<ProjectRegist> dataGrid(ProjectRegist p, PageFilter ph) {
		// List<ProjectRegist> pl = new ArrayList<ProjectRegist>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectRegist t ";
		List<ProjectRegist> l = projectRegistDao.find(hql + whereHql(p, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public Long count(ProjectRegist p, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectRegist t ";
		return projectRegistDao.count(
				"select count(*) " + hql + whereHql(p, params), params);
	}

	private String whereHql(ProjectRegist p, Map<String, Object> params) {
		String hql = "";
		if (p != null) {
			hql += " where 1=1 ";
			if (p.getCompany() != null) {
				hql += " and t.company.name like :name and t.company.dictionarytype.code=:type";
				params.put("name", "%%" + p.getCompany().getText() + "%%");
				params.put("name", "company");
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
