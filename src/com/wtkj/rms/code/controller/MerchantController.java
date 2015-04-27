package com.wtkj.rms.code.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.controller.BaseController;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.po.Project;
import com.wtkj.rms.code.model.vo.MerchantVo;
import com.wtkj.rms.code.service.MerchantServiceI;

@Controller
@RequestMapping("/merchant")
public class MerchantController extends BaseController {

	@Autowired
	private MerchantServiceI merchantService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/code/merchant";
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(MerchantVo Merchant, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(merchantService.dataGrid(Merchant, ph));
		grid.setTotal(merchantService.count(Merchant, ph));
		return grid;
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<MerchantVo> findAll() {
		return merchantService.findAll();
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/code/merchantAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(MerchantVo p, HttpServletRequest request) {
		Json j = new Json();
		try {
			merchantService.add(p, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/delete")
	@ResponseBody
	public Json delete(String ids) {
		Json j = new Json();

		// 检查级联删除
		List<Merchant> merchantRelateds = merchantService.checkRelate(ids);
		String msg = "";
		if (merchantRelateds != null && merchantRelateds.size() > 0) {
			msg += "以下服务商,有关联记录,不能删除:<ul style='margin-left:32px'>";
			for (int i = 0; i < merchantRelateds.size(); i++) {
				Merchant p = merchantRelateds.get(i);
				String pName = p.getName().length() > 10 ? p.getName()
						.substring(0, 10) + "..." : p.getName();
				if (i == 3) {
					if (merchantRelateds.size() > 4) {
						msg += "<li>" + pName + "....</li>";
					} else {
						msg += "<li>" + pName + "</li></ul>";
					}
					j.setMsg(msg);
					j.setSuccess(false);
					return j;
				}
				msg += "<li>" + pName + "</li>";
			}

			j.setMsg(msg + "</ul>");
			j.setSuccess(false);
			return j;

		}

		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}

		try {
			merchantService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public MerchantVo get(Long id) {
		return merchantService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		MerchantVo merchant = merchantService.get(id);
		request.setAttribute("merchant", merchant);
		return "/basic/code/merchantEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(MerchantVo merchant, HttpServletRequest request) {
		Json j = new Json();
		try {
			merchantService.edit(merchant, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		MerchantVo merchant = merchantService.get(id);
		request.setAttribute("merchant", merchant);
		return "/basic/code/merchantDetail";
	}

}