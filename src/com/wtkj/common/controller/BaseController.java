package com.wtkj.common.controller;

import java.text.SimpleDateFormat;

import org.springframework.beans.propertyeditors.CustomBooleanEditor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wtkj.common.CustomTimestampEditor;

@Controller
@RequestMapping("/base")
public class BaseController {

	protected int page = 1;// 当前页
	protected int rows = 10;// 每页显示记录数
	protected String sort;// 排序字段
	protected String order = "asc";// asc/desc

	protected String ids;// 主键集合，逗号分割

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		/**
		 * spring mvc针对表单的绑定数据 需要注册基本类型的数据才可以传值到后台
		 */
//		binder.registerCustomEditor(Date.class, new CustomDateEditor(
//				new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
		// binder.registerCustomEditor(Date.class, new CustomDateEditor(new
		// SimpleDateFormat("yyyy-MM-dd"), true));
		binder.registerCustomEditor(Boolean.class,
				new CustomBooleanEditor(true));
		// binder.registerCustomEditor(Long.class, new
		// CustomNumberEditor(Long.class, true));
		// binder.registerCustomEditor(Long.class, new
		// CustomNumberEditor(Double.class, true));
		// binder.registerCustomEditor(Long.class, new
		// CustomNumberEditor(Integer.class, true));

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);

		SimpleDateFormat datetimeFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		datetimeFormat.setLenient(false);

		binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(
				dateFormat, true));
		binder.registerCustomEditor(java.sql.Timestamp.class,
				new CustomTimestampEditor(datetimeFormat, true));

		/**
		 * 防止XSS攻击
		 */
//		binder.registerCustomEditor(String.class, new StringEscapeEditor(true,
//				false));
	}

	/**
	 * 用户跳转JSP页面
	 * 
	 * 此方法不考虑权限控制
	 * 
	 * @param folder
	 *            路径
	 * @param jspName
	 *            JSP名称(不加后缀)
	 * @return 指定JSP页面
	 */
	@RequestMapping("/{folder}/{jspName}")
	public String redirectJsp(@PathVariable String folder,
			@PathVariable String jspName) {
		return "/" + folder + "/" + jspName;
	}

}
