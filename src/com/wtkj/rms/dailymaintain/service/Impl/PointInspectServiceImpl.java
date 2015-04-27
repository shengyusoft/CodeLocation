package com.wtkj.rms.dailymaintain.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.PageFilter;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tuser;
import com.wtkj.rms.dailymaintain.model.PointInspect;
import com.wtkj.rms.dailymaintain.model.PointInspectVo;
import com.wtkj.rms.dailymaintain.service.PointInspectServiceI;

@Service
public class PointInspectServiceImpl implements PointInspectServiceI {

	@Autowired
	private BaseDaoI<PointInspect> pointInspectDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public void add(PointInspectVo vo, HttpServletRequest request) {
		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		if (sessionInfo.getId() > 0) {
			vo.setUserId(sessionInfo.getId());
		}
		vo.setCreateDT(new Date());

		PointInspect po = toPo(vo);
		pointInspectDao.save(po);
	}

	@Override
	public void delete(Long id) {
		PointInspect p = pointInspectDao.get(PointInspect.class, id);
		pointInspectDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		// 删除无关联的记录
		String sql = "delete from DM_PointInspect where id in (" + ids + ") ";

		try {
			pointInspectDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(PointInspectVo vo, HttpServletRequest request) {
		PointInspect po = toPo(vo);
		pointInspectDao.update(po);
	}

	@Override
	public PointInspectVo get(Long id) {
		PointInspectVo vo = new PointInspectVo();
		PointInspect po = pointInspectDao.get(PointInspect.class, id);
		vo = toVo(po);
		return vo;

	}

	@Override
	public List<PointInspectVo> dataGrid(Long userId, PointInspectVo vo,
			PageFilter ph) {
		List<PointInspectVo> pl = new ArrayList<PointInspectVo>();
		List<PointInspect> l = null;
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PointInspect t ";

		if (ph != null) {
			l = pointInspectDao.find(hql + whereHql(userId, vo, params)
					+ orderHql(ph), params, ph.getPage(), ph.getRows());

		} else {
			l = pointInspectDao
					.find(hql + whereHql(userId, vo, params), params);
		}

		for (PointInspect t : l) {
			PointInspectVo p = toVo(t);
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(Long userId, PointInspectVo vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from PointInspect t ";
		return pointInspectDao
				.count("select count(*) " + hql + whereHql(userId, vo, params),
						params);
	}

	private String whereHql(Long userId, PointInspectVo vo,
			Map<String, Object> params) {
		String hql = "";
		hql += " where 1=1 ";
		if (vo != null) {
			if (!StringUtils.isEmpty(vo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + vo.getName() + "%%");
			}

		}

		if (userId > 0) {
			Tuser user = userDao.get(Tuser.class, userId);
			Long id = user.getUsertype();
			if (id != null) {
				Tdictionary utype = dictionaryDao.get(Tdictionary.class, id);

				if ("zy".equals(utype.getCode())) {
					// 组员显示自己上传的巡点服务记录
					hql += " and t.user.id = :userId";
					params.put("userId", user.getId());
				}
			}
		}

		return hql;
	}

	private String orderHql(PageFilter ph) {
		String orderString = "";
		if ((ph != null) && (ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	public PointInspect toPo(PointInspectVo vo) {
		PointInspect po = new PointInspect();
		BeanUtils.copyProperties(vo, po);
		if (vo.getUserId() != null) {
			po.setUser(userDao.get(Tuser.class, vo.getUserId()));
		}

		return po;

	}

	public PointInspectVo toVo(PointInspect po) {
		PointInspectVo vo = new PointInspectVo();
		BeanUtils.copyProperties(po, vo);

		if (po.getUser() != null) {
			vo.setUserId(po.getUser().getId());
			vo.setUserName(po.getUser().getName());
		}

		return vo;

	}

}
