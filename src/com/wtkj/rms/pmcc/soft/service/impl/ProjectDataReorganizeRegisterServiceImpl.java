package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.pmcc.soft.model.ProjectDataReorganizeRegister;
import com.wtkj.rms.pmcc.soft.service.ProjectDataReorganizeRegisterServiceI;

@Service
public class ProjectDataReorganizeRegisterServiceImpl implements ProjectDataReorganizeRegisterServiceI {

	@Autowired
	private BaseDaoI<ProjectDataReorganizeRegister> projectDataReorganizeRegisterDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<ProjectDataReorganizeRegister> dataGrid(
			ProjectDataReorganizeRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectDataReorganizeRegister t ";
		List<ProjectDataReorganizeRegister> l = 
				projectDataReorganizeRegisterDao.find(hql + whereHql(obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(ProjectDataReorganizeRegister vo, Map<String, Object> params) {
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
	public Long count(ProjectDataReorganizeRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectDataReorganizeRegister t ";
		return projectDataReorganizeRegisterDao.count("select count(*) " + hql + whereHql(obj, params), params);
	}
	/**
	 * 新增保存
	 */
	@Override
	public Long save(ProjectDataReorganizeRegister pdrr, HttpServletRequest request) {
		return (Long) projectDataReorganizeRegisterDao.save(pdrr);
	}
	/**
	 * 通过id查询
	 */
	@Override
	public ProjectDataReorganizeRegister find(Long id) {
		return projectDataReorganizeRegisterDao.get(ProjectDataReorganizeRegister.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(ProjectDataReorganizeRegister pdrr,
			HttpServletRequest request) {
		projectDataReorganizeRegisterDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		ProjectDataReorganizeRegister p = projectDataReorganizeRegisterDao.get(ProjectDataReorganizeRegister.class, id);
		projectDataReorganizeRegisterDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from project_data_reorganize_register where id in (" + ids + ")";
		try {
			projectDataReorganizeRegisterDao.executeSql(sql);
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

}
