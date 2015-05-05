package com.wtkj.common.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.wtkj.common.Tree;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Dictionary;
import com.wtkj.common.model.Dictionarytype;
import com.wtkj.common.model.Tdictionary;
import com.wtkj.common.model.Tdictionarytype;
import com.wtkj.common.service.DictionarytypeServiceI;

@Service
public class DictionarytypeServiceImpl implements DictionarytypeServiceI {

	@Autowired
	private BaseDaoI<Tdictionarytype> dictionarytypeDao;

	@Override
	public void add(Dictionarytype r) {
		Tdictionarytype t = new Tdictionarytype();
		t.setCode(r.getCode());
		t.setName(r.getName());
		t.setSeq(r.getSeq());
		t.setDescription(r.getDescription());
		
		if(!StringUtils.isEmpty(r.getPid())){
			Tdictionarytype type = dictionarytypeDao.get(Tdictionarytype.class, Long.valueOf(r.getPid()));
			if(type != null){
				t.setDictionarytype(type);
			}
		}
		dictionarytypeDao.save(t);
	}

	@Override
	public void delete(Long id) {
		Tdictionarytype t = dictionarytypeDao.get(Tdictionarytype.class, id);
		dictionarytypeDao.delete(t);
	}

	@Override
	public void edit(Dictionarytype r) {
		Tdictionarytype t = dictionarytypeDao.get(Tdictionarytype.class, r.getId());
		t.setCode(r.getCode());
		t.setDescription(r.getDescription());
		t.setName(r.getName());
		t.setSeq(r.getSeq());
		
		if(!StringUtils.isEmpty(r.getPid())){
			Tdictionarytype type = dictionarytypeDao.get(Tdictionarytype.class, Long.valueOf(r.getPid()));
			if(type != null){
				t.setDictionarytype(type);
			}
		}
		
		dictionarytypeDao.update(t);
	}

	@Override
	public Dictionarytype get(Long id) {
		Tdictionarytype t = dictionarytypeDao.get(Tdictionarytype.class, id);
		Dictionarytype r = new Dictionarytype();
		r.setCode(t.getCode());
		r.setDescription(t.getDescription());
		r.setId(t.getId());
		r.setName(t.getName());
		r.setSeq(t.getSeq());
		if(t.getDictionarytype() != null){
			r.setPid(t.getDictionarytype().getId().toString());
		}
		return r;
	}

	@Override
	public List<Tree> tree() {
		List<Tdictionarytype> l = null;
		List<Tree> lt = new ArrayList<Tree>();

		l = dictionarytypeDao.find("select distinct t from Tdictionarytype t order by t.seq");

		if ((l != null) && (l.size() > 0)) {
			for (Tdictionarytype r : l) {
				Tree tree = new Tree();
				tree.setId(r.getId().toString());
				if (r.getDictionarytype() != null) {
					tree.setPid(r.getDictionarytype().getId().toString());
					tree.setIconCls("icon_folder");
				}else{
					tree.setIconCls("icon_company");
				}
				tree.setText(r.getName());
				lt.add(tree);
			}
		}
		return lt;
	}

	@Override
	public List<Dictionarytype> combox(String pid) {
		List<Dictionarytype> ld = new ArrayList<Dictionarytype>();
		List<Tdictionarytype> lt = dictionarytypeDao
				.find("from Tdictionarytype t where t.dictionarytype.id='"
						+ pid + "'");
		if (lt != null && lt.size() > 0) {
			for (int i = 0; i < lt.size(); i++) {
				Dictionarytype d = new Dictionarytype();
				d.setId(lt.get(i).getId());
				d.setName(lt.get(i).getName());
				d.setDescription(lt.get(i).getDescription());
				ld.add(d);
			}
		}
		return ld;
	}


}
