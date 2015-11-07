package com.wtkj.common;

//所有流程状态值管理
public class ProcessStateConstant {

	// 员工报销状态值
	public static final Integer BX_INIT = 0; // 初始化（仅保存）
	public static final Integer BX_APPLYED = 1; // 报销申请成功
	public static final Integer BX_AUDIT_KJ = 2; // 会计审批通过
	public static final Integer BX_BACK_KJ = -2; // 会计审批不通过
	public static final Integer BX_AUDIT_ZJL = 3; // 总经理审批通过
	public static final Integer BX_BACK_ZJL = -3; // 总经理审批不通过
	public static final Integer BX_CN = 4; // 出纳成功

	// 流程统一状态值控制
	public static final Integer STATE_INIT = 0; // 初始化（没提交之前的记录）
	public static final Integer STATE_APPLYED = 1; // 已申请
	
	//租车状态值
	public static final Integer ZC_AUDIT_ZHB_SUCCESS = 2; // 综合部确认
	public static final Integer ZC_AUDIT_ZHB_FAIL = -2; // 综合部退回

}
