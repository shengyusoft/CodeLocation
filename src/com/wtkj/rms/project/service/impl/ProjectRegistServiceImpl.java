package com.wtkj.rms.project.service.impl;

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
import com.wtkj.common.model.Tdictionarytype;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.project.model.Certificate;
import com.wtkj.rms.project.model.ProjectRegist;
import com.wtkj.rms.project.model.ProjectRegistVo;
import com.wtkj.rms.project.service.ProjectRegistServiceI;

@Service
public class ProjectRegistServiceImpl implements ProjectRegistServiceI {

	@Autowired
	private BaseDaoI<ProjectRegist> projectRegistDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionarytype> dictionarytypeDao;

	@Autowired
	private BaseDaoI<Certificate> certificateDao;

	@Override
	public void add(ProjectRegist p, HttpServletRequest request) {
		p.setProjectMgr(dictionaryDao.get(Tdictionary.class, p.getProjectMgr()
				.getId()));
		p.setTechniqueMgr(dictionaryDao.get(Tdictionary.class, p
				.getTechniqueMgr().getId()));
		p.setDelegator(userDao.get(Tuser.class, p.getDelegatorId()));

		p.setProvice(dictionaryDao.get(Tdictionary.class, p.getProvice()
				.getId()));
		p.setCity(dictionaryDao.get(Tdictionary.class, p.getCity().getId()));
		p.setCounty(dictionaryDao.get(Tdictionary.class, p.getCounty().getId()));

		p.setCompany(dictionaryDao.get(Tdictionary.class, p.getCompany()
				.getId()));

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

		p.setDelegator(userDao.get(Tuser.class, p.getDelegator().getId()));

		p.setProvice(dictionaryDao.get(Tdictionary.class, p.getProvice()
				.getId()));
		p.setCity(dictionaryDao.get(Tdictionary.class, p.getCity().getId()));
		p.setCounty(dictionaryDao.get(Tdictionary.class, p.getCounty().getId()));

		p.setCompany(dictionaryDao.get(Tdictionary.class, p.getCompany()
				.getId()));

		p.setCertificateA(certificateDao.get(Certificate.class, p
				.getCertificateA().getId()));
		p.setCertificateB(certificateDao.get(Certificate.class, p
				.getCertificateB().getId()));
		p.setCertificateC(certificateDao.get(Certificate.class, p
				.getCertificateC().getId()));
		projectRegistDao.update(p);
	}

	@Override
	public ProjectRegistVo get(Long id) {
		ProjectRegist p = null;
		ProjectRegistVo vo = new ProjectRegistVo();
		if (!StringUtils.isEmpty(id)) {
			p = projectRegistDao.get(ProjectRegist.class, Long.valueOf(id));
			BeanUtils.copyProperties(p, vo);
			if (p.getDelegator() != null) {
				Tuser user = userDao.get(Tuser.class, p.getDelegator().getId());
				vo.setDelegatorId(user.getId());
				vo.setDelegatorName(user.getName());
			}
		}
		return vo;

	}

	@Override
	public List<ProjectRegistVo> dataGrid(ProjectRegist p, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectRegist t ";
		List<ProjectRegist> l = projectRegistDao.find(hql + whereHql(p, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());
		List<ProjectRegistVo> vos = new ArrayList<ProjectRegistVo>();

		for (ProjectRegist prst : l) {
			ProjectRegistVo vo = new ProjectRegistVo();
			BeanUtils.copyProperties(prst, vo);

			if (!StringUtils.isEmpty(prst.getBds())) {
				vo.setBdNames(getDicTexts(prst.getBds()));
			}
			if (!StringUtils.isEmpty(prst.getMember5Cards())) {
				vo.setMember5CardNames(getDicTexts(prst.getMember5Cards()));
			}
			if (!StringUtils.isEmpty(prst.getQualifyRequirement())) {
				vo.setQualifyRequirementNames(getDicTexts(prst
						.getQualifyRequirement()));
			}
			if (p.getDelegator() != null) {
				Tuser user = userDao.get(Tuser.class, p.getDelegator().getId());
				vo.setDelegatorId(user.getId());
				vo.setDelegatorName(user.getName());
			}
			vos.add(vo);
		}

		return vos;
	}

	private String getDicTexts(String dicIds) {
		StringBuilder texts = new StringBuilder();
		List<Tdictionary> ds = dictionaryDao.findBySql(
				"select * from sys_dictionary where id in(" + dicIds + ")",
				Tdictionary.class);
		for (Tdictionary t : ds) {
			texts.append(t.getText() + ",");
		}
		if (texts.length() == 0) {
			return "";
		}
		return texts.substring(0, texts.length() - 1);
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

			if (p.getType() >= 0) {
				hql += " and t.type = :type";
				params.put("type", p.getType());
			}

			if (p.getCompany() != null) {
				hql += " and t.company.name like :name and t.company.dictionarytype.code=:type";
				params.put("name", "%%" + p.getCompany().getText() + "%%");
				params.put("name", "company");
			}
			if (!StringUtils.isEmpty(p.getProjectName())) {
				hql += " and t.projectName like :projectName";
				params.put("projectName", "%%" + p.getProjectName() + "%%");
			}

			if (p.getSt() != null) {
				hql += " and t.registDT >= :registDT1";
				params.put("registDT1", p.getSt());
			}

			if (p.getEt() != null) {
				hql += " and t.registDT <= :registDT2";
				params.put("registDT2", p.getEt());
			}

			if (p.getDelegator() != null) {
				hql += " and t.delegator.id <= :delegatorId";
				params.put("delegatorId", p.getDelegator().getId());
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
