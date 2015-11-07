package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.rms.pmcc.soft.model.ProjectPatrolRecord;
import com.wtkj.rms.pmcc.soft.service.ProjectPatrolRecordServiceI;

/**
 * 工程巡查记录
 */
@Service
public class ProjectPatrolRecordServiceImpl implements ProjectPatrolRecordServiceI {

	@Autowired
	private BaseDaoI<ProjectPatrolRecord> ProjectPatrolRecordDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<ProjectPatrolRecord> dataGrid(
			ProjectPatrolRecord obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectPatrolRecord t ";
		List<ProjectPatrolRecord> l = 
				ProjectPatrolRecordDao.find(hql + whereHql(obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(ProjectPatrolRecord vo, Map<String, Object> params) {
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
	public Long count(ProjectPatrolRecord obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectPatrolRecord t ";
		return ProjectPatrolRecordDao.count("select count(*) " + hql + whereHql(obj, params), params);
	}
	/**
	 * 新增保存
	 */
	@Override
	public Long save(ProjectPatrolRecord pdrr, HttpServletRequest request) {
		return (Long) ProjectPatrolRecordDao.save(pdrr);
	}
	/**
	 * 通过id查询
	 */
	@Override
	public ProjectPatrolRecord find(Long id) {
		return ProjectPatrolRecordDao.get(ProjectPatrolRecord.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(ProjectPatrolRecord pdrr,
			HttpServletRequest request) {
		ProjectPatrolRecordDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		ProjectPatrolRecord p = ProjectPatrolRecordDao.get(ProjectPatrolRecord.class, id);
		ProjectPatrolRecordDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from project_patrol_record where id in (" + ids + ")";
		try {
			ProjectPatrolRecordDao.executeSql(sql);
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
	 * 查询巡查次数
	 * @param id
	 * @return
	 */
	@Override
	public ProjectPatrolRecord queryByFId(Long id) {
		
		ProjectPatrolRecord obj = new ProjectPatrolRecord();
		String hql = " from ProjectPatrolRecord t where registerId = " + id + " order by patrolNo DESC ";
		List<ProjectPatrolRecord> list = ProjectPatrolRecordDao.find(hql);
		if(list != null && list.size() > 0){
			obj = list.get(0);
		}
		return obj;
	}

}
