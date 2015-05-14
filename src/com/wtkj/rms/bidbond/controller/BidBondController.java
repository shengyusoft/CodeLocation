package com.wtkj.rms.bidbond.controller;

import java.math.BigDecimal;
import java.util.Date;
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
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.service.UserServiceI;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.common.utils.NumberToCN;
import com.wtkj.rms.bidbond.model.BidBondVo;
import com.wtkj.rms.bidbond.service.BidBondServiceI;

@Controller
@RequestMapping("/bidBond")
public class BidBondController extends BaseController {

	@Autowired
	private BidBondServiceI bidBondService;

	@Autowired
	private UserServiceI userService;

	@RequestMapping("/manager")
	public String manager(HttpServletRequest request) {
		return "/basic/bidBond/bidBond";
	}

	@RequestMapping("/combox")
	@ResponseBody
	public List<BidBondVo> findAll() {
		return bidBondService.findAll();
	}

	@RequestMapping("/dataGrid")
	@ResponseBody
	public Grid dataGrid(BidBondVo vo, PageFilter ph) {
		Grid grid = new Grid();
		grid.setRows(bidBondService.dataGrid(vo, ph));
		grid.setTotal(bidBondService.count(vo, ph));
		return grid;
	}

	@RequestMapping("/addPage")
	public String addPage(HttpServletRequest request) {
		return "/basic/bidBond/bidBondAdd";
	}

	@RequestMapping("/add")
	@ResponseBody
	public Json add(BidBondVo vo, HttpServletRequest request) {
		//普通员工提交
		Json j = new Json();
		try {
			//缴号自动生成，编号规则为年份+月份+编号
			vo.setIdNumber(generateIdNum(0));
			
			//申请人和申请时间
			SessionInfo sessionInfo = getSessionInfo(request);
			if(sessionInfo.getId() != null && sessionInfo.getId() > 0){
				vo.setApplierId(sessionInfo.getId());
			}
			vo.setApplyDT(new Date());
			
			//保证金转大写
			if(vo.getBondFee() != null){
				BigDecimal fee = new BigDecimal(vo.getBondFee());
				String feeCH = NumberToCN.number2CNMontrayUnit(fee);
				vo.setBondFeeCH(feeCH);
			}

			bidBondService.add(vo, request);
			j.setSuccess(true);
			j.setMsg("添加成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}
	
	//生成缴号:编号规则为年份+月份+编号
	private String generateIdNum(int type){
		long number = bidBondService.countAll(type);//获取缴纳申请总数
		String dateStr = DateUtil.convertDateToString(new Date(), "yyyyMMdd");
		String nstr = String.format("%04d", number);//4位数补零
		return dateStr+nstr;
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

		try {
			bidBondService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}

		return j;
	}

	@RequestMapping("/get")
	@ResponseBody
	public BidBondVo get(Long id) {
		return bidBondService.get(id);
	}

	@RequestMapping("/editPage")
	public String editPage(HttpServletRequest request, Long id) {
		BidBondVo bidBond = bidBondService.get(id);
		request.setAttribute("bidBondService", bidBond);
		return "/basic/bidBond/bidBondEdit";
	}

	@RequestMapping("/edit")
	@ResponseBody
	public Json edit(BidBondVo vo, HttpServletRequest request) {
		Json j = new Json();
		try {
			bidBondService.edit(vo, request);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	@RequestMapping("/detailPage")
	public String detailPage(HttpServletRequest request, Long id) {
		BidBondVo bidBond = bidBondService.get(id);
		request.setAttribute("bidBond", bidBond);
		return "/basic/bidBond/bidBondDetail";
	}

}