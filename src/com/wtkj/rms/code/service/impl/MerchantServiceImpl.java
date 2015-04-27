package com.wtkj.rms.code.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.vo.MerchantVo;
import com.wtkj.rms.code.service.MerchantServiceI;

@Service
public class MerchantServiceImpl implements MerchantServiceI {

	@Autowired
	private BaseDaoI<Merchant> merchantDao;

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Override
	public void add(MerchantVo merchantVo, HttpServletRequest request) {
		Merchant merchant = new Merchant();
		BeanUtils.copyProperties(merchantVo, merchant);
		merchant.setMerchantType(dictionaryDao.get(Tdictionary.class,
				merchantVo.getDictionaryId()));
		merchantDao.save(merchant);
	}

	@Override
	public void delete(Long id) {
		Merchant merchant = merchantDao.get(Merchant.class, id);
		merchantDao.delete(merchant);
	}

	@Override
	public void delete(String ids) {
		if (StringUtils.isEmpty(ids)) {
			return;
		}

		String sql = "delete from CM_Merchant where id in (" + ids + ")";
		try {
			merchantDao.executeSql(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void edit(MerchantVo merchantVo, HttpServletRequest request) {
		Merchant merchant = new Merchant();
		BeanUtils.copyProperties(merchantVo, merchant);
		merchant.setMerchantType(dictionaryDao.get(Tdictionary.class,
				merchantVo.getDictionaryId()));
		merchantDao.update(merchant);
	}

	@Override
	public MerchantVo get(Long id) {
		MerchantVo mvo = new MerchantVo();
		Merchant mpo = merchantDao.get(Merchant.class, id);
		BeanUtils.copyProperties(mpo, mvo);
		mvo.setDictionaryId(mpo.getMerchantType().getId());
		mvo.setDictionaryText(mpo.getMerchantType().getText());
		return mvo;

	}

	@Override
	public List<MerchantVo> dataGrid(MerchantVo merchantVo, PageFilter ph) {
		List<MerchantVo> pl = new ArrayList<MerchantVo>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Merchant t ";
		List<Merchant> l = merchantDao.find(hql + whereHql(merchantVo, params)
				+ orderHql(ph), params, ph.getPage(), ph.getRows());

		for (Merchant t : l) {
			MerchantVo p = new MerchantVo();
			BeanUtils.copyProperties(t, p);
			if (t.getMerchantType() != null) {
				p.setDictionaryId(t.getMerchantType().getId());
				p.setDictionaryText(t.getMerchantType().getText());
			}
			pl.add(p);
		}
		return pl;
	}

	@Override
	public List<MerchantVo> findAll() {
		List<MerchantVo> pl = new ArrayList<MerchantVo>();
		List<Merchant> l = merchantDao.find("from Merchant t");
		for (Merchant t : l) {
			MerchantVo p = new MerchantVo();
			BeanUtils.copyProperties(t, p);
			if (t.getMerchantType() != null) {
				p.setDictionaryId(t.getMerchantType().getId());
				p.setDictionaryText(t.getMerchantType().getText());
			}
			pl.add(p);
		}
		return pl;
	}

	@Override
	public Long count(MerchantVo merchantVo, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Merchant t ";
		return merchantDao
				.count("select count(*) " + hql + whereHql(merchantVo, params),
						params);
	}

	private String whereHql(MerchantVo merchantVo, Map<String, Object> params) {
		String hql = "";
		if (merchantVo != null) {
			hql += " where 1=1 ";
			if (!StringUtils.isEmpty(merchantVo.getName())) {
				hql += " and t.name like :name";
				params.put("name", "%%" + merchantVo.getName() + "%%");
			}
			if (merchantVo.getDictionaryId() != null) {
				hql += " and t.merchantType.id = :merchantTypeId";
				params.put("merchantTypeId", merchantVo.getDictionaryId());
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
	public List<Merchant> checkRelate(String ids) {
		String sql = "select distinct m.* from CM_Merchant m "
				+ "left join CM_Project p on p.merchantId = m.id "
				+ "left join CM_Contract c on c.trusteeId = m.id or c.entrusteId = m.id "
				+ "left join CM_Software s on s.softwareVendorId = m.id or s.maintenanceServiceId = m.id "
				+ "where (p.merchantId is not null or c.trusteeId is not null or c.entrusteId is not null "
				+ "or s.softwareVendorId is not null or s.maintenanceServiceId is not null) "
				+ "and m.id in(" + ids + ")";
		List<Merchant> merchants = null;

		try {
			merchants = merchantDao.findBySql(sql, Merchant.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return merchants;
	}

}
