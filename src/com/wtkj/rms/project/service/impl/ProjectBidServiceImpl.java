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
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tdictionarytype;
import com.wtkj.rms.project.model.Certificate;
import com.wtkj.rms.project.model.ProjectBid;
import com.wtkj.rms.project.service.ProjectBidServiceI;

@Service
public class ProjectBidServiceImpl implements ProjectBidServiceI {

	@Autowired
	private BaseDaoI<ProjectBid> projectBidDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Certificate> certificateDao;

	@Autowired
	private BaseDaoI<Tdictionarytype> dictionarytypeDao;

	@Override
	public void add(ProjectBid p, HttpServletRequest request) {
		// p.setRegistDT(new Date());

		p.setProjectMgr(dictionaryDao.get(Tdictionary.class, p.getProjectMgr()
				.getId()));
		p.setTechniqueMgr(dictionaryDao.get(Tdictionary.class, p
				.getTechniqueMgr().getId()));
		p.setAqy(certificateDao.get(Certificate.class, p.getAqy().getId()));

		p.setProvice(dictionaryDao.get(Tdictionary.class, p.getProvice()
				.getId()));
		p.setCity(dictionaryDao.get(Tdictionary.class, p.getCity().getId()));
		p.setCounty(dictionaryDao.get(Tdictionary.class, p.getCounty().getId()));

		p.setCompany(dictionaryDao.get(Tdictionary.class, p.getCompany()
				.getId()));

		p.setManageFee(calMangerFee(p));

		projectBidDao.save(p);
	}

	@Override
	public void delete(String ids) {
		String sqlids = "";
		if (!StringUtils.isEmpty(ids) && ids.length() > 0) {
			String[] idArray = ids.split(",");
			if (idArray.length == 1) {
				sqlids = "'" + idArray[0] + "'";
			} else {
				for (int i = 0; i < idArray.length; i++) {
					String id = idArray[i];
					sqlids += i == idArray.length ? ("'" + id + "'") : ("'"
							+ id + "',");
				}
			}
		}
		String sql = "delete from ProjectBid where id in (" + sqlids + ")";
		projectBidDao.executeSql(sql);
	}

	@Override
	public void edit(ProjectBid p, HttpServletRequest request) {

		p.setProjectMgr(dictionaryDao.get(Tdictionary.class, p.getProjectMgr()
				.getId()));
		p.setTechniqueMgr(dictionaryDao.get(Tdictionary.class, p
				.getTechniqueMgr().getId()));
		p.setAqy(certificateDao.get(Certificate.class, p.getAqy().getId()));

		p.setProvice(dictionaryDao.get(Tdictionary.class, p.getProvice()
				.getId()));
		p.setCity(dictionaryDao.get(Tdictionary.class, p.getCity().getId()));
		p.setCounty(dictionaryDao.get(Tdictionary.class, p.getCounty().getId()));

		p.setCompany(dictionaryDao.get(Tdictionary.class, p.getCompany()
				.getId()));

		p.setManageFee(calMangerFee(p));

		projectBidDao.update(p);
	}

	@Override
	public ProjectBid get(String id) {
		ProjectBid p = null;
		if (!StringUtils.isEmpty(id)) {
			p = projectBidDao.get(ProjectBid.class, Long.valueOf(id));
		}
		return p;

	}

	@Override
	public List<ProjectBid> dataGrid(ProjectBid p, PageFilter ph) {
		// List<ProjectRegist> pl = new ArrayList<ProjectRegist>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBid t ";
		List<ProjectBid> l = projectBidDao.find(hql + whereHql(p, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (ProjectBid prst : l) {
			if (!StringUtils.isEmpty(prst.getBds())) {
				prst.setBdNames(getDicTexts(prst.getBds()));
			}
		}

		return l;
	}

	@Override
	public Long count(ProjectBid p, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from ProjectBid t ";
		return projectBidDao.count(
				"select count(*) " + hql + whereHql(p, params), params);
	}

	private String whereHql(ProjectBid p, Map<String, Object> params) {
		String hql = "";
		if (p != null) {
			hql += " where 1=1 ";

			// 项目名称
			if (!StringUtils.isEmpty(p.getProjectName())) {
				hql += " and t.projectName like :projectName";
				params.put("projectName", "%%" + p.getProjectName() + "%%");
			}

			// 公司名称
			if (p.getCompany() != null
					&& !StringUtils.isEmpty(p.getCompany().getText())) {
				hql += " and t.company.text like :companyName";
				params.put("companyName", "%%" + p.getCompany().getText()
						+ "%%");
			}

			// 中标时间
			if (p.getDurationSt() != null) {
				hql += " and t.bidDt >= :durationst";
				params.put("durationst", p.getDurationSt());
			}

			if (p.getDurationEt() != null) {
				hql += " and t.bidDt <= :durationet";
				params.put("durationet", p.getDurationEt());
			}

			// 按地区搜索
			if (p.getProvice() != null && p.getProvice().getId() != null
					&& p.getProvice().getId() > 0) {
				hql += " and t.provice.id = :proviceId";
				params.put("proviceId", p.getProvice().getId());
			}

			if (p.getCity() != null && p.getCity().getId() != null
					&& p.getCity().getId() > 0) {
				hql += " and t.city.id = :cityId";
				params.put("cityId", p.getCity().getId());
			}

			if (p.getCounty() != null && p.getCounty().getId() != null
					&& p.getCounty().getId() > 0) {
				hql += " and t.county.id = :countyId";
				params.put("countyId", p.getCounty().getId());
			}

			// 登记人
			if (!StringUtils.isEmpty(p.getRecordman())) {
				hql += " and t.recordman like :recordman";
				params.put("recordman", "%%" + p.getRecordman() + "%%");
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

	private String getDicTexts(String dicIds) {
		StringBuilder texts = new StringBuilder();
		List<Tdictionary> ds = dictionaryDao.findBySql(
				"select * from sys_dictionary where id in(" + dicIds + ")",
				Tdictionary.class);
		for (Tdictionary t : ds) {
			texts.append(t.getText() + ",");
		}
		if (texts.length() == 0) {
			return "";
		}
		return texts.substring(0, texts.length() - 1);
	}

	private Double calMangerFee(ProjectBid p) {
		Double fee = 0d;
		if (p.getBid_cost() != null) {
			float rate = p.getManageFeeRate() == null ? 0f : p
					.getManageFeeRate();
			fee = p.getBid_cost() * (rate / 100);
		}
		return fee;
	}
}
