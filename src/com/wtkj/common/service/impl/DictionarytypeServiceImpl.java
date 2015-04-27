package com.wtkj.common.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wtkj.common.Tree;
import com.wtkj.common.dao.BaseDaoI;
import com.wtkj.common.model.Dictionarytype;
import com.wtkj.common.model.Tdictionarytype;
import com.wtkj.common.service.DictionarytypeServiceI;

@Service
public class DictionarytypeServiceImpl implements DictionarytypeServiceI {

	@Autowired
	private BaseDaoI<Tdictionarytype> dictionarytypeDao;

	@Override
	public void add(Dictionarytype r) {
		Tdictionarytype t = new Tdictionarytype();
		t.setName(r.getName());
		t.setSeq(r.getSeq());
		t.setDescription(r.getDescription());
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
		t.setDescription(r.getDescription());
		t.setName(r.getName());
		t.setSeq(r.getSeq());
		dictionarytypeDao.update(t);
	}

	@Override
	public Dictionarytype get(Long id) {
		Tdictionarytype t = dictionarytypeDao.get(Tdictionarytype.class, id);
		Dictionarytype r = new Dictionarytype();
		r.setDescription(t.getDescription());
		r.setId(t.getId());
		r.setName(t.getName());
		r.setSeq(t.getSeq());
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


}
