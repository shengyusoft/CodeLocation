package com.wtkj.rms.project.service.impl;

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
import com.wtkj.rms.project.model.ProjectBookRegist;
import com.wtkj.rms.project.service.ProjectBookRegistServiceI;

@Service
public class ProjectBookRegistServiceImpl implements ProjectBookRegistServiceI {

	@Autowired
	private BaseDaoI<ProjectBookRegist> projectBookRegistDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void add(ProjectBookRegist vo, HttpServletRequest request) {
		projectBookRegistDao.save(vo);
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
	public void edit(ProjectBookRegist vo, HttpServletRequest request) {
		projectBookRegistDao.update(vo);
	}

	@Override
	public ProjectBookRegist get(Long id) {
		ProjectBookRegist po = projectBookRegistDao.get(
				ProjectBookRegist.class, id);
		return po;
	}

	@Override
	public List<ProjectBookRegist> dataGrid(ProjectBookRegist ps, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBookRegist t ";
		List<ProjectBookRegist> l = projectBookRegistDao.find(
				hql + whereHql(ps, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<ProjectBookRegist> findAll() {
		String hql = " from ProjectBookRegist t ";
		List<ProjectBookRegist> l = projectBookRegistDao.find(hql);
		return l;
	}

	@Override
	public Long count(ProjectBookRegist vo) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBookRegist t ";
		return projectBookRegistDao.count(
				"select count(*) " + hql + whereHql(vo, params), params);
	}

	@Override
	public Long count(ProjectBookRegist p, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBookRegist t ";
		return projectBookRegistDao.count(
				"select count(*) " + hql + whereHql(p, params), params);
	}

	private String whereHql(ProjectBookRegist vo, Map<String, Object> params) {
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

}
