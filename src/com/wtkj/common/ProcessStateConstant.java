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

}
