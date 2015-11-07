package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.pmcc.soft.model.ProjectMeasureRegister;
import com.wtkj.rms.pmcc.soft.service.ProjectMeasureRegisterServiceI;

/**
 * 工程测量登记
 */
@Service
public class ProjectMeasureRegisterServiceImpl implements ProjectMeasureRegisterServiceI {

	@Autowired
	private BaseDaoI<ProjectMeasureRegister> ProjectMeasureRegisterDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<ProjectMeasureRegister> dataGrid(
			ProjectMeasureRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectMeasureRegister t ";
		List<ProjectMeasureRegister> l = 
				ProjectMeasureRegisterDao.find(hql + whereHql(obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(ProjectMeasureRegister vo, Map<String, Object> params) {
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
	public Long count(ProjectMeasureRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectMeasureRegister t ";
		return ProjectMeasureRegisterDao.count("select count(*) " + hql + whereHql(obj, params), params);
	}
	/**
	 * 新增保存
	 */
	@Override
	public Long save(ProjectMeasureRegister pdrr, HttpServletRequest request) {
		return (Long) ProjectMeasureRegisterDao.save(pdrr);
	}
	/**
	 * 通过id查询
	 */
	@Override
	public ProjectMeasureRegister find(Long id) {
		return ProjectMeasureRegisterDao.get(ProjectMeasureRegister.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(ProjectMeasureRegister pdrr,
			HttpServletRequest request) {
		ProjectMeasureRegisterDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		ProjectMeasureRegister p = ProjectMeasureRegisterDao.get(ProjectMeasureRegister.class, id);
		ProjectMeasureRegisterDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from project_measure_register where id in (" + ids + ")";
		try {
			ProjectMeasureRegisterDao.executeSql(sql);
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
