<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function(){
		$('#businessCostApprovalRegisterApprovalZJLForm').form({
			url : '${pageContext.request.contextPath}/businessCostApprovalRegister/approvalZJL',
			onSubmit : function() {
				// 表单验证
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
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="businessCostApprovalRegisterApprovalZJLForm" method="post">
			<!-- 主键 -->
			<input id="id" name="id" type="hidden" value="${id}" />
			<table class="grid">
				<tr>
					<th width="120px">
						审批状态  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<select id="yesOrNo" name="yesOrNo" class="easyui-combobox" data-options="editable:false,required:true" style="width: 180px;">
							<option value="1">通过</option>
							<option value="-1">不通过</option>
						</select>
					</td>
				</tr>
				<tr>
					<th width="120px">
						审批意见  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<textarea class="easyui-validatebox span2" style="width: 100%" rows="2" name="managerOpinion"></textarea>
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="2">
						<textarea class="easyui-validatebox span2" style="width: 100%" rows="2" name="managerRemark"></textarea>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>