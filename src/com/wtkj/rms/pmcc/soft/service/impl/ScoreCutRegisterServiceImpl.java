package com.wtkj.rms.pmcc.soft.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.User;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.pmcc.soft.model.ScoreCutRegister;
import com.wtkj.rms.pmcc.soft.service.ScoreCutRegisterServiceI;

/**
 * 绩效提成登记
 */
@Service
public class ScoreCutRegisterServiceImpl implements ScoreCutRegisterServiceI {

	@Autowired
	private BaseDaoI<ScoreCutRegister> scoreCutRegisterDao;


	/**
	 * 列表查询
	 */
	@Override
	public List<ScoreCutRegister> dataGrid(User user, 
			ScoreCutRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ScoreCutRegister t ";
		List<ScoreCutRegister> l = 
				scoreCutRegisterDao.find(hql + whereHql(user, obj, params) + orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}
	/**
	 * 添加条件
	 * @param vo
	 * @param params
	 * @return
	 */
	private String whereHql(User user, ScoreCutRegister vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			// 流程标记
			if (user != null) {
				// 申请人查看自己申请的
				if (user.getRoleNames().indexOf("会计") >= 0) {
					// 如果申请人是别人则审批人查看已到到达自己的任务,如果是自己则显示申请人是自己的
					hql += " and (t.processFlag >= :state or (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId)";
					params.put("state", 1);
					params.put("userId", user.getId());
				} else if (user.getRoleNames().indexOf("总经理") >= 0) {
					hql += " and (t.processFlag >= :state or (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId)";
					params.put("userId", user.getId());
					params.put("state", 2);
				} else if (user.getRoleNames().indexOf("出纳") >= 0) {
					hql += " and (t.processFlag >= :state or (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId)";
					params.put("userId", user.getId());
					params.put("state", 3);
				} else if(!"admin".equals(user.getName())) {
					//其他类型都视为普通员工
					hql += " and (SELECT p.applyUser.id FROM Process p WHERE p.id = t.processId) = :userId";
					params.put("userId", user.getId());
				}
			}
			// 
			Date st = DateUtil.getSdate(vo.getSt());
			Date et = DateUtil.getEdate(vo.getEt());
			if(st != null && et != null){
				hql += " and handleDate BETWEEN '" + DateUtil.getDate(st) + "' and '" + DateUtil.getDate(et) + "' ";
			}
		}

		return hql;
	}
	/**
	 * 查询总数
	 */
	@Override
	public Long count(User user, ScoreCutRegister obj, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ScoreCutRegister t ";
		return scoreCutRegisterDao.count("select count(*) " + hql + whereHql(user, obj, params), params);
	}
	/**
	 * 新增保存
	 */
	@Override
	public Long add(ScoreCutRegister pdrr, HttpServletRequest request) {
		return (Long) scoreCutRegisterDao.save(pdrr);
	}
	/**
	 * 通过id查询
	 */
	@Override
	public ScoreCutRegister find(Long id) {
		return scoreCutRegisterDao.get(ScoreCutRegister.class, id);
	}
	/**
	 * 修改保存
	 */
	@Override
	public void update(ScoreCutRegister pdrr,
			HttpServletRequest request) {
		scoreCutRegisterDao.update(pdrr);
	}
	/**
	 * 单个删除
	 */
	@Override
	public void delete(Long id) {
		ScoreCutRegister p = scoreCutRegisterDao.get(ScoreCutRegister.class, id);
		scoreCutRegisterDao.delete(p);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delete(String ids) {

		String sql = "delete from score_cut_register where id in (" + ids + ")";
		try {
			scoreCutRegisterDao.executeSql(sql);
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
