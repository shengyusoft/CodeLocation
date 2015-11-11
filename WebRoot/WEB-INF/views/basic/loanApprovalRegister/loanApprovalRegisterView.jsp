<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.wtkj.common.GlobalConstant"%>
<%@ page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
.caption{
	font-size: medium;
    font-style: normal;
    font-weight: bold;
    color: blue;
    margin-top: 20px;
}
</style>

<script type="text/javascript">
	$(function() {
		$('#loanApprovalRegisterEditForm').form({
			url : '${pageContext.request.contextPath}/loanApprovalRegister/save',
			onSubmit : function() {
				progressLoad();
				var isValid = $(this).form('validate');
				if (!isValid) {
					progressClose();
				}
				return isValid;
			},
			success : function(result) {
				progressClose();
				result = $.parseJSON(result);
				if (result.success) {
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		
		//审核时提交审核表单
		$('#processForm').form({
			url : '${pageContext.request.contextPath}/loanApprovalRegister/complate',
			onSubmit : function() {
				progressLoad();
				var isValid = $(this).form('validate');
				if (!isValid) {
					progressClose();
				}
				return isValid;
			},
			success : function(result) {
				progressClose();
				result = $.parseJSON(result);
				if (result.success) {
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.messager.alert('提示',result.msg,'success');
					var grid = parent.$.modalDialog.openner_dataGrid;
					if(!isEmpty(grid)){
						grid.datagrid('reload');
					}
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		console.log('${viewType}');
	});
	
	// 金额转大写
	function toUpperCase(val){
		if(val != null && val != ""){
			var res = toCap(val);
			$('#loanMoneyCap').val(res);
		}else{
			$('#loanMoneyCap').val("");
		}
	}
	// 数字转中文大写
	function toCap(n) {
		if (!/^(0|[1-9]\d*)(\.\d+)?$/.test(n)){
			return "数据非法";
		}
		var unit = "千百拾亿千百拾万千百拾元角分", str = "";
		n += "00";
		var p = n.indexOf('.');
		if (p >= 0){
			n = n.substring(0, p) + n.substr(p + 1, 2);
		}
		unit = unit.substr(unit.length - n.length);
		for ( var i = 0; i < n.length; i++){
			str += '零壹贰叁肆伍陆柒捌玖'.charAt(n.charAt(i)) + unit.charAt(i);
		}
		return str.replace(/零(千|百|拾|角)/g, "零").replace(/(零)+/g, "零")
			.replace(/零(万|亿|元)/g, "$1").replace(/(亿)万|壹(拾)/g, "$1$2")
			.replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
	}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="loanApprovalRegisterEditForm" method="post">
			<!-- 主键 -->
			<input type="hidden" name="id" value="${loanApprovalRegister.id}" />
			<c:if test="${loanApprovalRegister.process_vo != null}">
				<input type="hidden" name="process_vo.id" value="${loanApprovalRegister.process_vo.id}" />
			</c:if>
			<!-- 动作类型 --> 
			<input type="hidden" name="actionType" id="actionType" value="" />
			<table class="grid">
				<tr>
					<th>借款人 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td><input name="loan" id="loan" type="text"
						style="width: 100%;" class="easyui-validatebox span2"
						value="${loanApprovalRegister.loan}" data-options="required:true" />
					</td>
					<th>借款日期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td><input id="loanDate" class="disabled" readonly="readonly"
						name="loanDate"
						value="<fmt:formatDate value="${loanApprovalRegister.loanDate}" pattern="yyyy-MM-dd"/>" />
					</td>
				</tr>
				<tr>
					<th>借款金额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td><input name="loanMoney" id="loanMoney" type="text"
						style="width: 100%;" value="${loanApprovalRegister.loanMoney}"
						class="easyui-numberbox" data-options="required:true" precision="2"
						onblur="toUpperCase(this.value)" /></td>
					<td colspan="2"><input id="loanMoneyCap" class="disabled" readonly="readonly" name="loanMoneyCap"
						value="${loanApprovalRegister.loanMoneyCap}" style="width: 90%;" /></td>
				</tr>
				<tr>
					<th>借款事由 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3"><input name="loanReason" id="loanReason"
						type="text" style="width: 100%;"
						value="${loanApprovalRegister.loanReason}"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th rowspan="3">款项支付 &nbsp;<label
						style="vertical-align: middle; text-align: center;"></label>
					</th>
					<th>户名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2"><input name="userName" id="userName"
						type="text" style="width: 100%;"
						value="${loanApprovalRegister.userName}"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>开户行 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2"><input name="bank" id="bank" type="text"
						style="width: 100%;" value="${loanApprovalRegister.bank}"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>账号 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2"><input name="account" id="account" type="text"
						style="width: 100%;" value="${loanApprovalRegister.account}"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="2"
							name="loanRemark">${loanApprovalRegister.loanRemark}</textarea></td>
				</tr>
			</table>
		</form>

		<c:if test="${fn:contains(viewType, 'handler')}">
			<form id="processForm" method="post">
				<table class="grid">
					<caption align="top" class="caption">流程审核</caption>
					<tr>
						<th>流程名称 &nbsp;</th>
						<td><input type="hidden" name="id"
							value="${loanApprovalRegister.process_vo.id}" /> <input type="hidden"
							name="option" id="option" value="" type="text" /><input
							name="processName" value="${loanApprovalRegister.process_vo.processName}"
							type="text" id="processName" style="width: 100%; height: 100%"
							class="easyui-validatebox span2" readonly="readonly" /></td>
						<th>申请人 &nbsp;</th>
						<td><input type="hidden" name="applyUserId"
							value="${loanApprovalRegister.process_vo.applyUserId}" /> <input
							name="applyUserName"
							value="${loanApprovalRegister.process_vo.applyUserName}" type="text"
							id="applyUserName" style="width: 100%; height: 100%"
							class="easyui-validatebox span2" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>开始时间 &nbsp;</th>
						<td><input class="Wdate" type="text" name="startDT"
							readonly="readonly" style="width: 98%; height: 100%;"
							value="${loanApprovalRegister.process_vo.startDT}" /></td>
						<th>结束时间 &nbsp;</th>
						<td><input class="Wdate" type="text" name="endDT"
							readonly="readonly" value="${loanApprovalRegister.process_vo.endDT}"
							id="endDT" style="width: 98%; height: 100%;" /></td>
					</tr>
					<tr>
						<th>办理意见&nbsp;</th>
						<td colspan="4"><textarea style="width: 100%" rows="2"
								name="remark" id="remark"></textarea></td>
					</tr>
					<tr>
						<th>备注&nbsp;</th>
						<td colspan="4"><textarea style="width: 100%" rows="2"
								name="remark2" id="remark2"></textarea></td>
					</tr>
				</table>
			</form>
		</c:if>
	</div>
</div>