package com.wtkj.rms.carRental.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.Grid;
import com.wtkj.common.Json;
import com.wtkj.common.PageFilter;
import com.wtkj.common.ProcessStateConstant;
import com.wtkj.common.model.User;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.carRental.model.CarRentalReg;
import com.wtkj.rms.carRental.model.CarRentalRegVo;
import com.wtkj.rms.carRental.service.CarRentalRegServiceI;
import com.wtkj.rms.process.controller.BaseProcessController;
import com.wtkj.rms.process.model.Process;
import com.wtkj.rms.process.model.ProcessVo;

@Controller
@RequestMapping({ "/carRentalReg" })
public class CarRentalRegController extends BaseProcessController {
	// 流程名称
	private static final String PROCESS_NAME = "申请租车";

	// 流程结束状态
	private static final int PROCESS_FINISHED = ProcessStateConstant.ZC_AUDIT_ZHB_SUCCESS;

	@Autowired
	private CarRentalRegServiceI carRentalRegService;

	@RequestMapping({ "/manager" })
	public String manager(HttpServletRequest request) {
		return "/basic/carRental/carRentalReg";
	}

	@RequestMapping({ "/dataGrid" })
	@ResponseBody
	public Grid dataGrid(HttpServletRequest request,
			CarRentalRegVo carRentalReg, PageFilter ph) {
		Grid grid = new Grid();
		User user = getLoginUser(request);
		List<CarRentalReg> pos = carRentalRegService.dataGrid(user,
				carRentalReg, ph);

		List<CarRentalRegVo> pos1 = new ArrayList<CarRentalRegVo>();
		for (CarRentalReg cr : pos) {
			pos1.add(toVo(cr));
		}
		grid.setRows(pos1);
		grid.setTotal(carRentalRegService.count(user, carRentalReg, ph));
		return grid;
	}

	/**
	 * CRUD以及处理的界面统一管理
	 * 
	 * @param request
	 * @param handlerType处理类型add
	 *            ,detail,edit,handler
	 * @return
	 */
	@RequestMapping("/viewPage")
	public String viewPage(HttpServletRequest request, String viewType, Long id) {
		// 获取当前用户
		viewType = StringUtils.isEmpty(viewType) ? "" : viewType;

		CarRentalReg carRentalReg = null;
		if (!StringUtils.isEmpty(id) && Long.valueOf(id) > 0) {
			// 编辑，详情，处理
			carRentalReg = carRentalRegService.get(id);
		} else {
			// 添加
			carRentalReg = new CarRentalReg();
		}

		request.setAttribute("carRentalReg", toVo(carRentalReg));
		request.setAttribute("viewType", viewType);
		// 申请人和申请时间

		// 根据类型返回 缴纳或者退回页面
		return "/basic/carRental/carRentalRegView";
	}

	@RequestMapping({ "/delete" })
	@ResponseBody
	public Json delete(String ids) {
		Json j = new Json();
		if (StringUtils.isEmpty(ids)) {
			j.setMsg("没有记录!");
			j.setSuccess(true);
			return j;
		}
		try {
			this.carRentalRegService.delete(ids);
			j.setMsg("删除成功！");
			j.setSuccess(true);
		} catch (Exception e) {
			j.setMsg(e.getMessage());
		}
		return j;
	}

	/**
	 * add edit apply(3个操作通过传一个操作符控制，做成一个方法即可)
	 * 
	 * @param crr
	 * @param request
	 * @return
	 */
	@RequestMapping({ "/save" })
	@ResponseBody
	public Json save(CarRentalRegVo vo, String actionType,
			HttpServletRequest request) {
		Json j = new Json();
		User user = getLoginUser(request);
		CarRentalReg carReg = null;
		String msg = "", detail = "";
		Long docId = 0l;
		int processState = 0;
		try {
			if (GlobalConstant.ACTION_EDIT.equals(actionType)) {
				msg = "修改成功!";
				// 编辑，注意需要关联process
				carRentalRegService.edit(toPo(vo), request);

			} else {
				if (GlobalConstant.ACTION_ADD.equals(actionType)) {
					msg = "添加成功!";
					processState = ProcessStateConstant.STATE_INIT;
					detail = user.getName() + " 于 "
							+ DateUtil.convertDateToString(new Date())
							+ " 生成租车记录成功,下一步:提交申请单!";
				} else if (GlobalConstant.ACTION_COMMIT.equals(actionType)) {
					msg = "提交成功!";
					processState = ProcessStateConstant.STATE_APPLYED;
					String nextOper = getNextOperator("role_zhb_manger");
					detail = user.getName() + " 于 "
							+ DateUtil.convertDateToString(new Date())
							+ " 申请租车成功,下一步执行人:" + nextOper;
				}
				
				if(vo.getId() != null && vo.getId() > 0){
					carRentalRegService.edit(toPo(vo), request);
					docId = vo.getId();
				}else{
					docId = carRentalRegService.add(toPo(vo), request);
				}

				// 申请提交后不能修改
				carReg = carRentalRegService.get(docId);

				Long processId = vo.getProcess_vo() == null ? null : vo
						.getProcess_vo().getId();
				// 更新流程
				Process process = updateProcess(request, processId,
						PROCESS_NAME, docId, user, processState);
				// 更新资源-关联流程
				carReg.setProcess(process);
				carRentalRegService.edit(carReg, request);

				// 更新流程历史记录
				updateHistory(request, user, process, detail);
			}
			j.setSuccess(true);
			j.setMsg(msg);
		} catch (Exception e) {
			e.printStackTrace();
			j.setMsg(e.getMessage());
		}
		return j;
	}

	// 审核通过方法
	// 流程审批相关,process docid,remark
	// 前台需要将process 的id 置入
	// 审批通过
	@RequestMapping("/complate")
	@ResponseBody
	public Json complate(ProcessVo vo, HttpServletRequest request) {
		Json j = new Json();
		if (vo == null || vo.getId() <= 0) {
			j.setMsg("未关联流程实例，流程启动失败");
			return j;
		}

		Process po = processService.get(vo.getId());
		po.setRemark(vo.getRemark());// 审批意见
		po.setOption(vo.getOption());
		vo = process2Vo(po);
		if (vo != null && vo.getDocId() != null && vo.getDocId() > 0) {
			if (vo.getOption() == 1) {
				return abort(vo, request);
			}
			if (carRentalRegService.get(vo.getDocId()) != null) {
				User user = getLoginUser(request);
				if (user != null) {
					String roleNames = user.getRoleNames();
					// 状态更新
					if (roleNames.indexOf("综合部经理") >= 0) {
						po.setState(ProcessStateConstant.ZC_AUDIT_ZHB_SUCCESS);// 综合部审核通过，流程结束
						vo.setEndDT(new Date());
						// 增加流程操作历史记录
						updateHistory(request, user, po, "综合部经理：" + user.getName() + "审核通过!租车流程结束");

					} else if (roleNames.indexOf("超级管理员") >= 0) {
						// 可以审批所有的单子,注：流程的状态递增的数列
						po.setState(vo.getState() + 1);
						// 增加流程操作历史记录
						if (isProcessFinished(po)) {
							updateHistory(request, user, po, "超级管理员："+user.getName() + "审核通过!租车流程结束");

						} else {
							updateHistory(request, user, po,"超级管理员：" + user.getName()+ "审批通过!");
						}
					}

					try {
						po.setArriveDT(new Date());
						processService.edit(po, request);
						j.setSuccess(true);
						j.setMsg("审批成功！");
					} catch (Exception e) {
						e.printStackTrace();
						j.setSuccess(false);
						j.setMsg("审批失败！");
						j.setMsg(e.getMessage());
					}
				}
			}
		}
		return j;
	}

	// 审批不通过
	@RequestMapping("/abort")
	@ResponseBody
	public Json abort(ProcessVo vo, HttpServletRequest request) {
		Json j = new Json();
		User user = getLoginUser(request);
		if (vo == null || vo.getId() <= 0 || vo.getDocId() == null
				|| vo.getDocId() <= 0) {
			j.setMsg("流程为空!");
			return j;
		}
		Process po = processService.get(vo.getId());
		if (!StringUtils.isEmpty(vo.getRemark())) {
			po.setRemark(vo.getRemark());
		}

		if (user == null) {
			j.setMsg("办理人为空,请重新登录!");
			return j;
		}

		if (carRentalRegService.get(vo.getDocId()) == null) {
			j.setMsg("资源为空,数据异常!");
			return j;
		}

		String roleNames = user.getRoleNames();

		// 状态更新
		if (roleNames.indexOf("综合部经理") >= 0) {
			po.setState(ProcessStateConstant.ZC_AUDIT_ZHB_FAIL);// 审批不通过
			// 增加流程操作历史记录
			updateHistory(request,user,po,"综合部经理："+ user.getName() + "审批不通过!");

		} else if (roleNames.indexOf("超级管理员") >= 0) {
			// 可以审批所有的单子
			po.setState(-(vo.getState()+1));
			// 增加流程操作历史记录
			updateHistory(request, user, po,"超级管理员："+ user.getName() + "审批不通过!");
		}

		try {
			po.setArriveDT(new Date());
			processService.edit(po, request);
			j.setSuccess(true);
			j.setMsg("审批成功！");
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg(e.getMessage());
		}

		return j;
	}

	// 查看那流程图
	@RequestMapping("/processChart")
	public String processChart(HttpServletRequest request, Long id) {
		Process process = carRentalRegService.get(id).getProcess();
		if (process != null && process.getId() != null && process.getId() > 0) {
			process = processService.get(process.getId());
			request.setAttribute("process", process2Vo(process));
		}
		
		return "/basic/carRental/processChart";
	}

	/**
	 * po vo 转换
	 * 
	 * @param po
	 * @return
	 */
	private CarRentalRegVo toVo(CarRentalReg po) {
		CarRentalRegVo vo = new CarRentalRegVo();
		BeanUtils.copyProperties(po, vo);
		if (po.getProcess() != null && po.getProcess().getId() != null
				&& po.getProcess().getId() > 0) {
			Process process = processService.get(po.getProcess().getId());
			vo.setProcess_vo(process2Vo(process));
		}
		return vo;
	}

	private CarRentalReg toPo(CarRentalRegVo vo) {
		CarRentalReg po = new CarRentalReg();
		BeanUtils.copyProperties(vo, po);
		if (vo.getProcess_vo() != null) {
			po.setProcess(process2Po(vo.getProcess_vo()));
		}
		return po;
	}

	@Override
	protected boolean isProcessFinished(Process process) {
		if (process != null && process.getId() != null && process.getId() > 0) {
			return process.getState() == PROCESS_FINISHED;
		} else {
			return false;
		}
	}
}
