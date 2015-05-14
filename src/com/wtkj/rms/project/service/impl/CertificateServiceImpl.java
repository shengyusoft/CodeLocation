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
import com.wtkj.rms.project.model.Certificate;
import com.wtkj.rms.project.service.CertificateServiceI;


@Service
public class CertificateServiceImpl implements CertificateServiceI {

	@Autowired
	private BaseDaoI<Certificate> certificateDao;

	@Override
	public void add(Certificate vo, HttpServletRequest request) {
		certificateDao.save(vo);
	}

	@Override
	public void delete(Long id) {
		Certificate p = certificateDao.get(Certificate.class, id);
		certificateDao.delete(p);
	}

	@Override
	public void delete(String ids) {
		String sql = "delete from tb_certificate where id in (" + ids + ")";
		try {
			certificateDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(Certificate vo, HttpServletRequest request) {
		certificateDao.update(vo);
	}

	@Override
	public Certificate get(Long id) {
		return certificateDao.get(Certificate.class, id);

	}

	@Override
	public List<Certificate> dataGrid(Certificate vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Certificate t ";
		List<Certificate> l = certificateDao.find(hql + whereHql(vo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		return l;
	}

	@Override
	public List<Certificate> findAll() {
		return certificateDao.find(" from Certificate t ");
	}

	@Override
	public Long count(Certificate vo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Certificate t ";
		return certificateDao.count("select count(*) " + hql
				+ whereHql(vo, params), params);
	}

	private String whereHql(Certificate vo, Map<String, Object> params) {
		String hql = "";
		if (vo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(vo.getCard_name())) {
				hql += " and t.card_name like :name";
				params.put("name", "%%" + vo.getCard_name() + "%%");
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
	public List<Certificate> checkRelate(String ids) {
		return null;
	}

}
