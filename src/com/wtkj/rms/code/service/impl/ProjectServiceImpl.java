package com.wtkj.rms.code.service.impl;

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
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.code.model.vo.ProjectVo;
import com.wtkj.rms.code.service.ProjectServiceI;

@Service
public class ProjectServiceImpl implements ProjectServiceI {

	@Autowired
	private BaseDaoI<Project> projectDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Merchant> merchantDao;

	@Override
	public void add(ProjectVo projectVo, HttpServletRequest request) {
		Project project = toPo(projectVo);
		projectDao.save(project);
	}

	@Override
	public void delete(Long id) {
		Project p = projectDao.get(Project.class, id);
		projectDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from CM_Project where id in (" + ids + ")";
		try {
			projectDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(ProjectVo projectVo, HttpServletRequest request) {
		Project project = toPo(projectVo);
		projectDao.update(project);
	}

	@Override
	public ProjectVo get(Long id) {
		Project po = projectDao.get(Project.class, id);
		ProjectVo vo = toVo(po);
		return vo;
	}

	@Override
	public List<ProjectVo> dataGrid(ProjectVo projectVo, PageFilter ph) {
		List<ProjectVo> pl = new ArrayList<ProjectVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Project t ";
		List<Project> l = projectDao.find(hql + whereHql(projectVo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (Project t : l) {
			ProjectVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<ProjectVo> findAll() {
		List<ProjectVo> pl = new ArrayList<ProjectVo>();
		String hql = " from Project t ";
		List<Project> l = projectDao.find(hql);

		for (Project t : l) {
			ProjectVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(ProjectVo ProjectVo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Project t ";
		return projectDao.count(
				"select count(*) " + hql + whereHql(ProjectVo, params), params);
	}

	private String whereHql(ProjectVo projectVo, Map<String, Object> params) {
		String hql = "";
		if (projectVo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(projectVo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + projectVo.getName() + "%%");
			}
			if (projectVo.getDictionaryId() != null) {
				hql += " and t.projectType.id = :projectTypeId";
				params.put("projectTypeId", projectVo.getDictionaryId());
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

	// vo to po
	private Project toPo(ProjectVo projectVo) {
		Project project = new Project();
		BeanUtils.copyProperties(projectVo, project);

		if (projectVo.getDictionaryId() != null) {
			project.setProjectType(dictionaryDao.get(Tdictionary.class,
					projectVo.getDictionaryId()));
		}

		if (projectVo.getMerchantId() != null) {
			project.setMerchant(merchantDao.get(Merchant.class,
					projectVo.getMerchantId()));
		}

		if (projectVo.getProjectMangerId() != null) {
			project.setProjectManger(userDao.get(Tuser.class,
					projectVo.getProjectMangerId()));
		}

		return project;
	}

	// po to vo
	private ProjectVo toVo(Project po) {
		ProjectVo vo = new ProjectVo();
		BeanUtils.copyProperties(po, vo);

		if (po.getProjectType() != null) {
			vo.setDictionaryId(po.getProjectType().getId());
			vo.setDictionaryText(po.getProjectType().getText());
		}
		if (po.getMerchant() != null) {
			vo.setMerchantId(po.getMerchant().getId());
			vo.setMerchantText(po.getMerchant().getName());
		}
		if (po.getProjectManger() != null) {
			vo.setProjectMangerId(po.getProjectManger().getId());
			vo.setProjectMangerName(po.getProjectManger().getName());
		}

		return vo;
	}	

	@Override
	public List<Project> checkRelate(String ids) {
		// CM_Merchant,CM_Software
		String sql = "select distinct p.* from CM_Project p "
				+ "left join dbo.CM_Contract c on c.projectId = p.id "
				+ "left join dbo.CM_Software s on s.projectId = p.id "
				+ "where c.projectId is not null or s.projectId is not null "
				+ "and p.id in (" + ids + ")";

		List<Project> projects = null;
		try {
			projects = projectDao.findBySql(sql, Project.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return projects;
	}

}
