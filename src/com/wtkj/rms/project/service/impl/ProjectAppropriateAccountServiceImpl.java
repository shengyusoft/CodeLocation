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
import com.wtkj.common.model.Torganization;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.project.model.ProjectAppropriateAccount;
import com.wtkj.rms.project.model.ProjectAppropriateAccountVo;
import com.wtkj.rms.project.model.ProjectAppropriateReg;
import com.wtkj.rms.project.service.ProjectAppropriateAccountServiceI;

@Service
public class ProjectAppropriateAccountServiceImpl implements
		ProjectAppropriateAccountServiceI {

	@Autowired
	private BaseDaoI<ProjectAppropriateAccount> projectAppropriateAccountDao;

	@Autowired
	private BaseDaoI<ProjectAppropriateReg> projectAppropriateRegDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Torganization> organizationDao;

	@Override
	public void add(ProjectAppropriateAccountVo vo, HttpServletRequest request) {
		projectAppropriateAccountDao.save(toPo(vo));

	}

	private ProjectAppropriateAccount toPo(ProjectAppropriateAccountVo vo) {
		if (vo == null) {
			return null;
		}
		ProjectAppropriateAccount po = new ProjectAppropriateAccount();
		BeanUtils.copyProperties(vo, po);

		if (vo.getProjectAppRegId() != null && vo.getProjectAppRegId() > 0) {
			ProjectAppropriateReg preg = projectAppropriateRegDao.get(
					ProjectAppropriateReg.class, vo.getProjectAppRegId());
			po.setProjectAppropriateReg(preg);
		}
		return po;
	}

	private ProjectAppropriateAccountVo toVo(ProjectAppropriateAccount po) {
		if (po == null) {
			return null;
		}
		ProjectAppropriateAccountVo vo = new ProjectAppropriateAccountVo();
		BeanUtils.copyProperties(po, vo);

		if (po.getProjectAppropriateReg() != null) {
			vo.setProjectAppRegId(po.getProjectAppropriateReg().getId());
			vo.setProjectAppRegName(po.getProjectAppropriateReg()
					.getProjectName());
		}
		return vo;
	}

	@Override
	public void delete(Long id) {
		ProjectAppropriateAccount p = projectAppropriateAccountDao.get(
				ProjectAppropriateAccount.class, id);
		projectAppropriateAccountDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		if (StringUtils.isEmpty(ids)) {
			return;
		}

		String sql = "delete from ProjectAppropriateAccount where id in ("
				+ ids + ")";
		try {
			projectAppropriateAccountDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(ProjectAppropriateAccountVo vo, HttpServletRequest request) {
		projectAppropriateAccountDao.update(toPo(vo));
	}

	@Override
	public ProjectAppropriateAccountVo get(Long id) {
		ProjectAppropriateAccount po = projectAppropriateAccountDao.get(
				ProjectAppropriateAccount.class, id);
		return toVo(po);

	}

	@Override
	public List<ProjectAppropriateAccountVo> dataGrid(
			ProjectAppropriateAccountVo vo, PageFilter ph) {
		List<ProjectAppropriateAccountVo> pl = new ArrayList<ProjectAppropriateAccountVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectAppropriateAccount t ";
		List<ProjectAppropriateAccount> l = projectAppropriateAccountDao.find(
				hql + whereHql(vo, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		for (ProjectAppropriateAccount t : l) {
			pl.add(toVo(t));
		}
		return pl;
	}

	@Override
	public Long count(ProjectAppropriateAccountVo ProjectAppropriateAccountVo,
			PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectAppropriateAccount t ";
		return projectAppropriateAccountDao.count("select count(*) " + hql
				+ whereHql(ProjectAppropriateAccountVo, params), params);
	}

	private String whereHql(ProjectAppropriateAccountVo vo,
			Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";

			if (vo.getToAccountDT() != null) {
				hql += " and t.toAccountDT = :toDT";
				params.put("toDT", vo.getToAccountDT());
			}

			if (vo.getProjectAppRegId() != null && vo.getProjectAppRegId() >= 0) {
				hql += " and t.projectAppropriateReg.id = :pregId";
				params.put("pregId", vo.getProjectAppRegId());
			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = " order by t.toAccountDT desc";

		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString += ",t." + ph.getSort() + " " + ph.getOrder();
		}

		if (StringUtils.isEmpty(orderString)) {
			orderString = "  order by t.toAccountDT";
		}

		return orderString;
	}

	@Override
	public List<ProjectAppropriateAccountVo> findAll(String type) {
		List<ProjectAppropriateAccountVo> vos = new ArrayList<ProjectAppropriateAccountVo>();
		String hql = " from ProjectAppropriateAccount t ";
		List<ProjectAppropriateAccount> l = projectAppropriateAccountDao
				.find(hql);
		for (ProjectAppropriateAccount po : l) {
			vos.add(toVo(po));
		}
		return vos;
	}

	@Override
	public int findMaxTimes() {
		// TODO Auto-generated method stub
		String hql = " select max(times) from ProjectAppropriateAccount t ";
		return 0;
	}

}
