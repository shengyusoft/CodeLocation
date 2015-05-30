package com.wtkj.common.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.PageFilter;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Dictionary;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tdictionarytype;
import com.wtkj.common.service.DictionaryServiceI;

@Service
public class DictionaryServiceImpl implements DictionaryServiceI {

	@Autowired
	private BaseDaoI<Tdictionary> dictionaryDao;

	@Autowired
	private BaseDaoI<Tdictionarytype> dictionarytypeDao;

	@Override
	public void add(Dictionary r) {
		Tdictionary t = new Tdictionary();
		t.setDescription(r.getDescription());
		t.setLvs(r.getLvs());
		t.setIsdefault(GlobalConstant.NOT_DEFAULT);
		t.setState(GlobalConstant.ENABLE);
		t.setCode(r.getCode());
		t.setText(r.getText());
		t.setSeq(r.getSeq());
		t.setDictionarytype(dictionarytypeDao.get(Tdictionarytype.class,
				r.getDictionarytypeId()));
		dictionaryDao.save(t);
	}

	@Override
	public void delete(Long id) {
		Tdictionary t = dictionaryDao.get(Tdictionary.class, id);
		dictionaryDao.delete(t);
	}

	@Override
	public void edit(Dictionary r) {
		Tdictionary t = dictionaryDao.get(Tdictionary.class, r.getId());
		t.setDescription(r.getDescription());
		t.setLvs(r.getLvs());
		t.setText(r.getText());
		t.setSeq(r.getSeq());
		t.setCode(r.getCode());
		t.setState(r.getState());
		t.setDictionarytype(dictionarytypeDao.get(Tdictionarytype.class,
				r.getDictionarytypeId()));
		dictionaryDao.update(t);
	}

	@Override
	public Dictionary get(Long id) {
		Tdictionary t = dictionaryDao.get(Tdictionary.class, id);
		Dictionary r = new Dictionary();
		r.setId(t.getId());
		r.setIsdefault(t.getIsdefault());
		r.setText(t.getText());
		r.setSeq(t.getSeq());
		r.setCode(t.getCode());
		r.setDescription(t.getDescription());
		r.setLvs(t.getLvs());
		if (t.getDictionarytype() != null) {
			r.setDictionarytypeId(t.getDictionarytype().getId());
			r.setDictionarytypeName(t.getDictionarytype().getName());
		}
		r.setState(t.getState());
		return r;
	}

	@Override
	public List<Dictionary> dataGrid(Dictionary dictionary, PageFilter ph) {
		List<Dictionary> ul = new ArrayList<Dictionary>();
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tdictionary t ";
		List<Tdictionary> l = dictionaryDao.find(
				hql + whereHql(dictionary, params) + orderHql(ph), params,
				ph.getPage(), ph.getRows());
		for (Tdictionary t : l) {
			Dictionary u = new Dictionary();
			BeanUtils.copyProperties(t, u);
			if (t.getDictionarytype() != null) {
				u.setDictionarytypeId(t.getDictionarytype().getId());
				u.setDictionarytypeName(t.getDictionarytype().getName());
			}
			ul.add(u);
		}
		return ul;
	}

	@Override
	public Long count(Dictionary dictionary, PageFilter ph) {
		Map<String, Object> params = new HashMap<String, Object>();
		String hql = " from Tdictionary t ";
		return dictionaryDao
				.count("select count(*) " + hql + whereHql(dictionary, params),
						params);
	}

	private String whereHql(Dictionary dictionary, Map<String, Object> params) {
		String hql = "";
		if (dictionary != null) {
			hql += " where 1=1 ";
			if (dictionary.getText() != null) {
				hql += " and t.name like :name";
				params.put("name", "%%" + dictionary.getText() + "%%");
			}
			if (dictionary.getDictionarytypeId() != null) {
				hql += " and t.dictionarytype.id = :dictionarytypeId";
				params.put("dictionarytypeId", dictionary.getDictionarytypeId());
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
	public List<Dictionary> combox(String code) {
		List<Dictionary> ld = new ArrayList<Dictionary>();
		List<Tdictionary> lt = dictionaryDao
				.find("from Tdictionary t where t.state=0 and t.dictionarytype.code='"
						+ code + "' order by t.seq");
		if (lt != null && lt.size() > 0) {
			for (int i = 0; i < lt.size(); i++) {
				if (lt.get(i).getState() == 0) {
					Dictionary d = new Dictionary();
					d.setId(lt.get(i).getId());
					d.setText(lt.get(i).getText());
					ld.add(d);
				}
			}
		}
		return ld;
	}

	@Override
	public List<Dictionary> find(String code, String codeType) {
		List<Dictionary> ld = new ArrayList<Dictionary>();
		List<Tdictionary> lt = dictionaryDao
				.find("from Tdictionary t where t.state=0 and t.dictionarytype.code='"
						+ codeType + "' and t.code='" + code + "'");

		if (lt != null && lt.size() > 0) {
			for (int i = 0; i < lt.size(); i++) {
				if (lt.get(i).getState() == 0) {
					Dictionary d = new Dictionary();
					d.setId(lt.get(i).getId());
					d.setText(lt.get(i).getText());
					ld.add(d);
				}
			}
		}
		return ld;
	}

	@Override
	public Dictionary checkUnique(Dictionary dictionary) {
		Tdictionary t = dictionaryDao.get("from Tdictionary t where t.code = '"
				+ dictionary.getCode() + "' and t.dictionarytype.id="
				+ dictionary.getDictionarytypeId());
		if (t != null) {
			Dictionary r = new Dictionary();
			r.setId(t.getId());
			r.setIsdefault(t.getIsdefault());
			r.setText(t.getText());
			r.setSeq(t.getSeq());
			r.setCode(t.getCode());
			if (t.getDictionarytype() != null) {
				r.setDictionarytypeId(t.getDictionarytype().getId());
				r.setDictionarytypeName(t.getDictionarytype().getName());
			}
			r.setState(t.getState());
			return r;
		} else {
			return null;
		}
	}

	// 通过编码方式查找子编码
	@Override
	public List<Dictionary> findCodeLk(String code, String codeType) {
		List<Dictionary> ld = new ArrayList<Dictionary>();
		String hql = " from Tdictionary t where t.dictionarytype.code='"
				+ codeType + "' and t.code like '" + code + "%'";
		System.out.println("================>>" + hql);
		List<Tdictionary> lt = dictionaryDao.find(hql);
		if (lt != null && lt.size() > 0) {
			for (int i = 0; i < lt.size(); i++) {
				Dictionary d = new Dictionary();
				d.setId(lt.get(i).getId());
				d.setDescription(lt.get(i).getDescription());
				d.setText(lt.get(i).getText());
				ld.add(d);
			}
		}
		return ld;
	}

	// 行政区划
	@Override
	public List<Dictionary> findByViewCode(String viewcode, int lvs) {
		List<Dictionary> ld = new ArrayList<Dictionary>();
		String hql = "";
		if (!StringUtils.isEmpty(viewcode)) {
			hql = "from Tdictionary t where t.dictionarytype.id=14 and t.code like '"
					+ viewcode + "%%' and t.lvs=" + lvs;
		} else {
			hql = "from Tdictionary t where t.dictionarytype.id=14 and t.lvs="
					+ lvs;
		}

		List<Tdictionary> lt = dictionaryDao.find(hql);
		if (lt != null && lt.size() > 0) {
			for (int i = 0; i < lt.size(); i++) {
				if (lt.get(i).getState() == 0) {
					Dictionary d = new Dictionary();
					d.setId(lt.get(i).getId());
					d.setCode(lt.get(i).getCode());
					d.setText(lt.get(i).getText());
					ld.add(d);
				}
			}
		}
		return ld;
	}

	@Override
	public List<Dictionary> xzqhCombox(Long pid, int lvs) {
		List<Dictionary> ld = new ArrayList<Dictionary>();
		String hql = "";
		if (pid != null) {
			Tdictionary dic = dictionaryDao.get(Tdictionary.class, pid);
			if (dic != null && !StringUtils.isEmpty(dic.getCode())) {
				// FIXME hard code 数据字典类型为行政区划,根据上级编码和当前编码等级确定（市县级别）
				hql = "from Tdictionary t where t.dictionarytype.id=14 and t.code like '"
						+ dic.getCode() + "%%' and t.lvs=" + lvs;
			}

		} else {
			// FIXME hard code 数据字典类型为行政区划,根据当前编码等级确定第一级（省）
			hql = "from Tdictionary t where t.dictionarytype.id=14 and t.lvs="
					+ lvs;
		}

		List<Tdictionary> lt = dictionaryDao.find(hql);
		if (lt != null && lt.size() > 0) {
			for (int i = 0; i < lt.size(); i++) {
				if (lt.get(i).getState() == 0) {
					Dictionary d = new Dictionary();
					d.setId(lt.get(i).getId());
					d.setCode(lt.get(i).getCode());
					d.setText(lt.get(i).getText());
					ld.add(d);
				}
			}
		}
		return ld;
	}

}
