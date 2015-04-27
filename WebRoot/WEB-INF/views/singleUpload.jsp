<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<script type="text/javascript">
	$(function() {
		$('#shotcutForm').form({
			url : ctxPath + '/shotcut/edit',
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
					parent.$.messager.alert('成功', result.msg, 'success');
					parent.$.modalDialog.handler.dialog('close');
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		
		$('#fileAddForm').form({
			url : ctxPath + '/image/upload',
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
					$('#iconUrl').val(result.obj);
					$('#shotcutDisplay').attr('src', '/tmp/' + result.obj);
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>

<form id="shotcutForm" method="post" enctype="multipart/form-data"
	style="display: none;">
	<table class="grid">
		<tr>
			<td colspan="3"><input type="hidden" id="shotcutId" name="id"
				value="${vo.id}"></input> <input type="hidden" id="iconUrl"
				name="iconUrl" value=""></input></td>
		</tr>
	</table>
</form>
<form id="fileAddForm" method="post" enctype="multipart/form-data"
	style="height: auto;">
	<table class="grid">
		<tr>
			<td><input type='text' disabled="disabled" name='textfield'
				id='textfield' class='txt' /> <input type='button' class='btn'
				onclick="document.getElementById('myfile').click()" value='浏览...' />
				<input type="file" name="myfile" class="file" id="myfile"
				style="display: none"
				onchange="document.getElementById('textfield').value=this.value" />
				<input type="submit" name="myfile" class="btn" value="上传" /></td>
		</tr>
		<tr>
			<td style="text-align: center; vertical-align: middle;"><img
				id="shotcutDisplay" style="width: 110px; height: 110px;" src="" /></td>
		</tr>
	</table>
</form>
