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
import com.wtkj.rms.code.model.po.Contract;
import com.wtkj.rms.code.model.po.Merchant;
import com.wtkj.rms.code.model.vo.ContractVo;
import com.wtkj.rms.code.service.ContractServiceI;

@Controller
@RequestMapping("/contract")
public class ContractController extends BaseController {

	@Autowired
	private ContractServiceI contractService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/code/contract";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<ContractVo> combox(HttpServletRequest request) {
		return contractService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(ContractVo Contract, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(contractService.dataGrid(Contract, ph));
		grid.setTotal(contractService.count(Contract, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/code/contractAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(ContractVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			contractService.add(vo, request);
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
		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}

		// 检查级联删除,关联合同,软件
		List<Contract> contractRelateds = contractService.checkRelate(ids);
		String msg = "";
		if (contractRelateds != null && contractRelateds.size() > 0) {
			// 关联,删除失败的任务
			msg += "以下合同,有关联记录,不能删除:<ul style='margin-left:32px'>";
			for (int i = 0; i < contractRelateds.size(); i++) {
				Contract p = contractRelateds.get(i);
				String pName = p.getName().length() > 10 ? p.getName()
						.substring(0, 10) + "..." : p.getName();
				if (i == 3) {
					if (contractRelateds.size() > 4) {
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

		try {
			contractService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public ContractVo get(Long id) {
		return contractService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		ContractVo contract = contractService.get(id);
		request.setAttribute("contract", contract);
		return "/basic/code/contractEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(ContractVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			contractService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		ContractVo contract = contractService.get(id);
		request.setAttribute("contract", contract);
		return "/basic/code/contractDetail";
	}

}