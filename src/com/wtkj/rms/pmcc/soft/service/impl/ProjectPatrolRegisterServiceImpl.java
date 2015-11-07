package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.pmcc.soft.model.ProjectPatrolRegister;
import com.wtkj.rms.pmcc.soft.service.ProjectPatrolRegisterServiceI;

/**
 * 工程巡查登记
 */
@Service
public class ProjectPatrolRegisterServiceImpl implements ProjectPatrolRegisterServiceI {

	@Autowired
	private BaseDaoI<ProjectPatrolRegister> ProjectPatrolRegisterDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<ProjectPatrolRegister> dataGrid(
			ProjectPatrolRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectPatrolRegister t ";
		List<ProjectPatrolRegister> l = 
				ProjectPatrolRegisterDao.find(hql + whereHql(obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(ProjectPatrolRegister vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			// 添加其他条件
		}

		return hql;
	}
	/**
	 * 查询总数
	 */
	@Override
	public Long count(ProjectPatrolRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectPatrolRegister t ";
		return ProjectPatrolRegisterDao.count("select count(*) " + hql + whereHql(obj, params), params);
	}
	/**
	 * 新增保存
	 */
	@Override
	public Long save(ProjectPatrolRegister pdrr, HttpServletRequest request) {
		return (Long) ProjectPatrolRegisterDao.save(pdrr);
	}
	/**
	 * 通过id查询
	 */
	@Override
	public ProjectPatrolRegister find(Long id) {
		return ProjectPatrolRegisterDao.get(ProjectPatrolRegister.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(ProjectPatrolRegister pdrr,
			HttpServletRequest request) {
		ProjectPatrolRegisterDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		ProjectPatrolRegister p = ProjectPatrolRegisterDao.get(ProjectPatrolRegister.class, id);
		ProjectPatrolRegisterDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from project_patrol_register where id in (" + ids + ")";
		try {
			ProjectPatrolRegisterDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 分页
	 * @param ph
	 * @return
	 */
	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}
	
	/**
	 * 查询所有
	 */
	@Override
	public List<ProjectPatrolRegister> queryToCombox() {
		
		List<ProjectPatrolRegister> list = new ArrayList<ProjectPatrolRegister>();
		String hql = " from ProjectPatrolRegister t where delFlag = '0' ";
		list = ProjectPatrolRegisterDao.find(hql);
		return list;
	}

}
