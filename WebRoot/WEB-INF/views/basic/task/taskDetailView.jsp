<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$('#taskDetailForm').form({
			url : '${ctx}/taskDetail/save',
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
					if(parent.$.modalDialogTwo.openner_dataGrid){
						parent.$.modalDialogTwo.openner_dataGrid.datagrid('reload');
						parent.$.modalDialogTwo.handler.dialog('close');
					}else if(parent.$.modalDialog.openner_dataGrid){
						parent.$.modalDialog.openner_dataGrid.datagrid('reload');
						parent.$.modalDialog.handler.dialog('close');
					}
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: auto; padding: 3px;">
		<form id="taskDetailForm" method="post">
			<table class="grid">
				<tr>
					<th width="150px">时间节点&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input type="hidden" name="id" id="id" value="${taskDetail.id}"/>
						<input type="hidden" name="taskId" id="taskId" value="${taskDetail.taskId}"/>
						<input class="Wdate" type="text" name="timeLine"
						value="<fmt:formatDate value="${taskDetail.timeLine}" pattern="yyyy-MM-dd"/>"
						id="timeLine" style="width: 100%; height: 100%"
						onclick="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>完成内容 &nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="5"
							name="finshContent" id="finshContent">${taskDetail.finshContent}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>
