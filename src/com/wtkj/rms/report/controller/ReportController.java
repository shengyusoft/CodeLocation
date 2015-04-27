package com.wtkj.rms.report.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.jasperreports.JasperReportsMultiFormatView;

import com.wtkj.common.GlobalConstant;
import com.wtkj.common.SessionInfo;
import com.wtkj.common.controller.BaseController;
import com.wtkj.common.utils.DateUtil;
import com.wtkj.rms.dailymaintain.model.TaskVo;
import com.wtkj.rms.dailymaintain.service.TaskServiceI;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController {

	@Autowired
	protected TaskServiceI taskService;

	// 维护档案报表
	@RequestMapping("/taskRecordManager")
	public String manager(HttpServletRequest request) {
		return "/basic/report/taskRecord";
	}

	@RequestMapping("/print")
	public ModelAndView maintainPrint(HttpServletRequest request,
			String acceptUserName, String name, String place, String excuteDT)
			throws IOException {

		SessionInfo sessionInfo = (SessionInfo) request.getSession()
				.getAttribute(GlobalConstant.SESSION_INFO);
		TaskVo task = new TaskVo();

		// 参数处理
		acceptUserName = new String(acceptUserName.getBytes("iso-8859-1"),
				"UTF-8");
		name = new String(name.getBytes("iso-8859-1"), "UTF-8");
		place = new String(place.getBytes("iso-8859-1"), "UTF-8");
		task.setAcceptUserName(acceptUserName);
		task.setName(name);
		task.setPlace(place);
		try {
			if (!StringUtils.isEmpty(excuteDT)) {
				task.setExcuteDT(DateUtil.convertStringToDate("yyyy-MM-dd",
						excuteDT));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		List<TaskVo> tasks = null;
		task.setTaskState(GlobalConstant.TASK_FINSHED);
		task.setDocumented(1);
		tasks = taskService.dataGrid(sessionInfo.getId(), task, null);
		JRDataSource data = new JRBeanCollectionDataSource(tasks);

		Map<String, Object> parameterMap = new HashMap<String, Object>();
		parameterMap.put("datasource", data);

		String imageRead = request.getRealPath("/style/images/Other/logoa.png");//
//		System.out.println(imageRead);
//		InputStream imageIn = new FileInputStream(new File(imageRead));// 图片一个数据流
		parameterMap.put("logo", imageRead);

		parameterMap
				.put(JasperReportsMultiFormatView.DEFAULT_FORMAT_KEY, "pdf");
		return new ModelAndView("htmlReport", parameterMap);

	}
}