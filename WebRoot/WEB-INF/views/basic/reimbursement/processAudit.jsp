<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#processForm').form({
			url : '${pageContext.request.contextPath}/reimbursement/complate',
			onSubmit : function() {
				debugger;
				
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
					//parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="processForm" method="post">
			<table class="grid">
				<tr>
					<th>流程名称 &nbsp;</th>
					<td><input type="hidden" name="id" value="${process.id}" /> 
					<input type="hidden" name="option" id="option" value="" type="text" /><input
						name="processName" value="${process.processName}" type="text"
						id="processName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>申请人 &nbsp;</th>
					<td>
					<input type="hidden" name="applyUserId" value="${process.applyUserId}" /> 
					<input name="applyUserName" value="${process.applyUserName}"
						type="text" id="applyUserName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>开始时间 &nbsp;</th>
					<td>
						<input class="Wdate" type="text" name="startDT"
						readonly="readonly" style="width: 98%; height: 100%;"
						value="${process.startDT}" /></td>
					<th>结束时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="endDT"
						readonly="readonly" value="${process.endDT}" id="endDT"
						style="width: 98%; height: 100%;" /></td>
				</tr>
				<tr>
					<th>办理意见&nbsp;</th>
					<td colspan="4"><textarea style="width: 100%" rows="5" name="remark" id="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>