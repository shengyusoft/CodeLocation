package com.wtkj.rms.project.service.impl;

import java.util.ArrayList;
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
import com.wtkj.rms.project.model.ProjectBookRegist;
import com.wtkj.rms.project.model.ProjectBookRegistVo;
import com.wtkj.rms.project.service.ProjectBookRegistServiceI;

@Service
public class ProjectBookRegistServiceImpl implements ProjectBookRegistServiceI {

	@Autowired
	private BaseDaoI<ProjectBookRegist> projectBookRegistDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void add(ProjectBookRegistVo vo, HttpServletRequest request) {
		ProjectBookRegist p = toPo(vo);
		projectBookRegistDao.save(p);
	}

	@Override
	public void delete(Long id) {
		ProjectBookRegist p = projectBookRegistDao.get(ProjectBookRegist.class,
				id);
		projectBookRegistDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from ProjectBookRegist where id in (" + ids + ")";
		try {
			projectBookRegistDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(ProjectBookRegistVo vo, HttpServletRequest request) {
		projectBookRegistDao.update(toPo(vo));
	}

	@Override
	public ProjectBookRegistVo get(Long id) {
		ProjectBookRegist po = projectBookRegistDao.get(
				ProjectBookRegist.class, id);
		return toVo(po);
	}

	@Override
	public List<ProjectBookRegistVo> dataGrid(ProjectBookRegistVo ps,
			PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBookRegist t ";
		List<ProjectBookRegistVo> vos = new ArrayList<ProjectBookRegistVo>();
		List<ProjectBookRegist> l = projectBookRegistDao.find(
				hql + whereHql(ps, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());
		for (ProjectBookRegist p : l) {
			vos.add(toVo(p));
		}

		return vos;
	}

	@Override
	public List<ProjectBookRegistVo> findAll() {
		String hql = " from ProjectBookRegist t ";
		List<ProjectBookRegistVo> vos = new ArrayList<ProjectBookRegistVo>();
		List<ProjectBookRegist> l = projectBookRegistDao.find(hql);
		for (ProjectBookRegist p : l) {
			vos.add(toVo(p));
		}
		return vos;
	}

	@Override
	public Long count(ProjectBookRegistVo vo) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBookRegist t ";
		return projectBookRegistDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	@Override
	public Long count(ProjectBookRegistVo p, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBookRegist t ";
		return projectBookRegistDao.count(
				"select count(*) " + hql + whereHql(p, params), params);
	}

	private String whereHql(ProjectBookRegistVo vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getBidder())) {
				hql += " and t.bidder like :bidder";
				params.put("bidder", "%%" + vo.getBidder() + "%%");
			}
			if (!StringUtils.isEmpty(vo.getProjectName())) {
				hql += " and t.projectName like :pname";
				params.put("pname", "%%" + vo.getProjectName() + "%%");
			}
			
			//登记时间
			if (vo.getSt() != null) {
				hql += " and t.registDT >= :registDT1";
				params.put("registDT1", vo.getSt());
			}

			if (vo.getEt() != null) {
				hql += " and t.registDT <= :registDT2";
				params.put("registDT2", vo.getEt());
			}
			
			//登记人
			if (!StringUtils.isEmpty(vo.getRegisterName())) {
				hql += " and t.register.name like :rname";
				params.put("rname", "%%" + vo.getRegisterName() + "%%");
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
	public long countAll() {
		// 根据类型获取总数
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = "select count(*) from ProjectBookRegist t";
		return projectBookRegistDao.count(hql, params);
	}

	private ProjectBookRegist toPo(ProjectBookRegistVo vo) {
		ProjectBookRegist p = new ProjectBookRegist();
		BeanUtils.copyProperties(vo, p);
		if (vo.getRegisterId() != null && vo.getRegisterId() > 0) {
			Tuser user = userDao.get(Tuser.class, vo.getRegisterId());
			if (user != null) {
				p.setRegister(user);
			}
		}
		
		if (vo.getCompanyId() != null && vo.getCompanyId() > 0) {
			Tdictionary company = dictionaryDao.get(Tdictionary.class,
					vo.getCompanyId());
			if (company != null) {
				p.setCompany(company);
			}
		}

		return p;
	}

	private ProjectBookRegistVo toVo(ProjectBookRegist po) {
		ProjectBookRegistVo vo = new ProjectBookRegistVo();
		BeanUtils.copyProperties(po, vo);
		if (po.getRegister() != null) {
			Tuser user = userDao.get(Tuser.class, po.getRegister().getId());
			if (user != null) {
				vo.setRegisterId(user.getId());
				vo.setRegisterName(user.getName());
			}
		}
		
		if(po.getCompany() != null){
			Tdictionary company = dictionaryDao.get(Tdictionary.class,po.getCompany().getId());
			if(company != null){
				vo.setCompanyId(company.getId());
				vo.setCompanyName(company.getText());
			}
		}

		if (!StringUtils.isEmpty(po.getQualifyRequirement())) {
			vo.setQualifyRequirementNames(getDicTexts(po
					.getQualifyRequirement()));
		}

		return vo;
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

}
