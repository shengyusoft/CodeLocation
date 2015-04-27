package com.wtkj.common;

import java.util.LinkedHashMap;
import java.util.Map;

public class GlobalConstant {

	public static final String SESSION_INFO = "sessionInfo";

	public static final Integer ENABLE = 0; // 启用
	public static final Integer DISABLE = 1; // 禁用

	public static final Integer DEFAULT = 0; // 默认
	public static final Integer NOT_DEFAULT = 1; // 非默认

	@SuppressWarnings({ "serial", "unchecked", "rawtypes" })
	public static final Map sexlist = new LinkedHashMap() {
		{
			put("0", "男");
			put("1", "女");
		}
	};
	@SuppressWarnings({ "unchecked", "serial", "rawtypes" })
	public static final Map statelist = new LinkedHashMap() {
		{
			put("0", "启用");
			put("1", "停用");
		}
	};

	// 用户类型
	public static final String USERTYPE_CJGLY = "super"; // 超级管理员
	public static final String USERTYPE_LD = "ld"; // 领导
	public static final String USERTYPE_XMJL = "xmjl"; // 项目经理
	public static final String USERTYPE_ZZ = "zz"; // 组长
	public static final String USERTYPE_ZY = "zy"; // 组员

	// 统一状态值
	public static final Integer STATE_START = 1; // 开始
	public static final Integer STATE_ING = 2; // 进行中..
	public static final Integer STATE_END = 3; // 结束
	public static final Integer STATE_OVER = 4; // 过期

	// 任务状态值
	public static final Integer TASK_NOTSTART = 0; // 未启动(待启动)
	public static final Integer TASK_ASSIGNED = 1; // 已分配(待接受)
	public static final Integer TASK_ACCEPTED = 2; // 已接受(待处理)
	public static final Integer TASK_HANDLERING = 3; // 未完成待续(处理中)
	public static final Integer TASK_FINSHED = 4; // 任务完成(结束)
	public static final Integer TASK_OVERTIME = 5; // 任务过期(处理中)
	
	public static final Integer TASK_ACCEPT_OVERTIME = 5; // 任务过期(处理中)

	// 计划类型 1仅一次 2 每天 3 每周 4 每月
	public static final Integer TASK_SCHEDULETYPE_ONE = 1; // 仅一次
	public static final Integer TASK_SCHEDULETYPE_DAY = 2; // 每天
	public static final Integer TASK_SCHEDULETYPE_WEEK = 3; // 每周
	public static final Integer TASK_SCHEDULETYPE_MONTH = 4; // 每月
	public static final Integer TASK_SCHEDULETYPE_QUARTER = 5; // 每月
	public static final Integer TASK_SCHEDULETYPE_YEAR = 6; // 每月

	// 待办类型
	public static final String TODO_RCWH = "日常维护";
	
	public static final String TEMP_DIR = "tmp";
	
	//操作码,SQL,HQL等
	public static final String ACTION_EQ = "=";
	public static final String ACTION__NOT_EQ = "!=";
	public static final String ACTION_MORE = ">";
	public static final String ACTION_MORE_EQ = ">=";
	public static final String ACTION_LESS = ">";
	public static final String ACTION_LESS_EQ = "<=";

}
