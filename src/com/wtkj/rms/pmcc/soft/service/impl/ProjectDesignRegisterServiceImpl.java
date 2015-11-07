package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.pmcc.soft.model.ProjectDesignRegister;
import com.wtkj.rms.pmcc.soft.service.ProjectDesignRegisterServiceI;

/**
 * 工程设计登记
 */
@Service
public class ProjectDesignRegisterServiceImpl implements ProjectDesignRegisterServiceI {

	@Autowired
	private BaseDaoI<ProjectDesignRegister> ProjectDesignRegisterDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<ProjectDesignRegister> dataGrid(
			ProjectDesignRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectDesignRegister t ";
		List<ProjectDesignRegister> l = 
				ProjectDesignRegisterDao.find(hql + whereHql(obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(ProjectDesignRegister vo, Map<String, Object> params) {
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
	public Long count(ProjectDesignRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectDesignRegister t ";
		return ProjectDesignRegisterDao.count("select count(*) " + hql + whereHql(obj, params), params);
	}
	/**
	 * 新增保存
	 */
	@Override
	public Long save(ProjectDesignRegister pdrr, HttpServletRequest request) {
		return (Long) ProjectDesignRegisterDao.save(pdrr);
	}
	/**
	 * 通过id查询
	 */
	@Override
	public ProjectDesignRegister find(Long id) {
		return ProjectDesignRegisterDao.get(ProjectDesignRegister.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(ProjectDesignRegister pdrr,
			HttpServletRequest request) {
		ProjectDesignRegisterDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		ProjectDesignRegister p = ProjectDesignRegisterDao.get(ProjectDesignRegister.class, id);
		ProjectDesignRegisterDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from project_design_register where id in (" + ids + ")";
		try {
			ProjectDesignRegisterDao.executeSql(sql);
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
