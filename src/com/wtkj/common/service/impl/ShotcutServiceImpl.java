package com.wtkj.common.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.ShotcutInfo;
import com.wtkj.common.model.ShotcutInfoVo;
import com.wtkj.common.model.Tresource;
import com.wtkj.common.model.Tuser;
import com.wtkj.common.service.ShotcutServiceI;

@Service
public class ShotcutServiceImpl implements ShotcutServiceI {

	@Autowired
	private BaseDaoI<ShotcutInfo> shotcutInfoDao;

	@Autowired
	private BaseDaoI<Tresource> resourceDao;

	@Autowired
	private BaseDaoI<Tuser> userDao;

	@Override
	public void delete(String ids) throws Exception {
		// 删除快键模块的父级
		String sql1 = "delete from sys_shotcut where resourceId in"
				+ "(select distinct r.pid from sys_resource r left join sys_shotcut s on r.id = s.resourceId where s.id in("
				+ ids + "))";

		String sql2 = "delete from ShotcutInfo where id in(" + ids + ")";

		shotcutInfoDao.executeSql(sql1);
		shotcutInfoDao.executeHql(sql2);
	}

	@Override
	public void add(String ids, Long userId) {
		// 添加快键时,批量添加快键资源不配置图标,编辑的时候配置图标
		if (!StringUtils.isEmpty(ids)) {
			String[] idArray = ids.split(",");

			for (String id : idArray) {
				ShotcutInfo po = new ShotcutInfo();
				po.setUpdateDT(new Date());

				if (userId != null && userId > 0) {
					po.setUser(userDao.get(Tuser.class, userId));
				}
				Tresource rs = resourceDao.get(Tresource.class,
						Long.valueOf(id));
				po.setResource(rs);

				// 快键图标默认处理(在shotcut下名字和rms下名字一样)
				String shotIcon = rs.getIcon().replace("icon_rms_", "")
						+ ".png";
				System.out.println("===============shoticon name============="
						+ shotIcon);
				po.setIconUrl(shotIcon);
				shotcutInfoDao.save(po);
			}
		}
	}

	@Override
	public void edit(ShotcutInfoVo vo, Long userId) {
		// 快键资源不可编辑,只对快键图标修改
		if (vo.getId() == null || vo.getId() <= 0) {
			return;
		}

		ShotcutInfo po = shotcutInfoDao.get(ShotcutInfo.class, vo.getId());
		po.setUpdateDT(new Date());
		if (vo.getUserId() != null && vo.getUserId() > 0) {
			po.setUser(userDao.get(Tuser.class, vo.getUserId()));
		}
		po.setIconUrl(vo.getIconUrl());
		shotcutInfoDao.update(po);
	}

	@Override
	public ShotcutInfoVo get(Long id) {
		if (id == null || id <= 0) {
			return null;
		}

		ShotcutInfo po = shotcutInfoDao.get(ShotcutInfo.class, id);
		ShotcutInfoVo vo = toVo(po);

		return vo;
	}

	@Override
	public List<ShotcutInfoVo> dataGrid(ShotcutInfoVo vo, PageFilter ph,
			Long userId) {
		List<ShotcutInfoVo> vos = new ArrayList<ShotcutInfoVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ShotcutInfo t left join fetch t.user user where t.user.id ="
				+ userId + " and t.resource.resource is not null";
		List<ShotcutInfo> l = null;
		if (ph == null) {
			l = shotcutInfoDao.find(hql);
		} else {
			l = shotcutInfoDao.find(hql + orderHql(ph), params, ph.getPage(),
					ph.getRows());
		}

		for (ShotcutInfo t : l) {
			ShotcutInfoVo u = toVo(t);
			vos.add(u);
		}
		return vos;
	}

	@Override
	public Long count(ShotcutInfoVo vo, PageFilter ph, Long userId) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ShotcutInfo t where t.user.id =" + userId;
		return shotcutInfoDao.count("select count(*) " + hql, params);
	}

	private String orderHql(PageFilter ph) {
		if (ph == null) {
			return "";
		}
		String orderString = "";
		if ((ph.getSort() != null) && (ph.getOrder() != null)) {
			orderString = " order by t." + ph.getSort() + " " + ph.getOrder();
		}
		return orderString;
	}

	private ShotcutInfoVo toVo(ShotcutInfo po) {
		ShotcutInfoVo vo = new ShotcutInfoVo();
		vo.setIconUrl(po.getIconUrl());
		vo.setId(po.getId());
		vo.setUpdateDT(po.getUpdateDT());

		if (po.getResource() != null) {
			vo.setResourceId(po.getResource().getId());
			vo.setResourceName(po.getResource().getName());
			vo.setResourceIcon(po.getResource().getIcon());
			vo.setResourceUrl(po.getResource().getUrl());
		}

		if (po.getUser() != null) {
			vo.setUserId(po.getUser().getId());
			vo.setUserName(po.getUser().getName());
		}

		return vo;
	}

}
