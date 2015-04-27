<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		//添加或者删除,根据id判断
		var id = '${pointInspect.id}';
		var url = null;
		if (isEmpty(id)) {
			url = '${pageContext.request.contextPath}/pointInspect/add';
		} else {
			url = '${pageContext.request.contextPath}/pointInspect/edit';
		}

		$('#pointInspectForm').form({
			url : url,
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

		//默认进入show
		//showlimit();
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="pointInspectForm" method="post"
			style="width: auto; height: auto;">
			<table class="grid">
				<tr>
					<th>巡点记录名称&nbsp; <label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input name="name" style="width: 80%; height: 98%" type="text" id="name"
							class="easyui-validatebox span2" data-options="required:true" value="${pointInspect.name}" />
						<input type="hidden" name="id" id="id" value="${pointInspect.id}" />
						<input type="hidden" name="userId" id="userId"value="${pointInspect.userId}" /> 
						<input type="hidden" name="createDT" id="createDT" value="${pointInspect.createDT}" />
						<input type="hidden" name="attachmentIds" id="attachmentIds" value="${pointInspect.attachmentIds}">
					</td>
				</tr>
			</table>
		</form>
		<input type="hidden" id="attachmentType" value="xdfw">
		<jsp:include page="../../upload.jsp"></jsp:include>
	</div>
</div>