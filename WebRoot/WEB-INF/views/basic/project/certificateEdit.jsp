<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#certificateEditForm').form({
			url : '${pageContext.request.contextPath}/certificate/edit',
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
	});
	document.getElementById("card_status").value="${certificate.card_status}";
	document.getElementById("card_type").value="${certificate.card_type}";
	
	$('#card_name').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=zsmc",
		parentField : 'dictionaryId',
		valueField : 'text',
		value : '${certificate.card_name}',
		textField : 'text',
		panelHeight : '300'				
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="certificateEditForm" method="post"">
			<table class="grid">
				<tr>
					<th>证书名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input type="hidden" name="id" id="id" value="${certificate.id}"> 
						<select id="card_name" name="card_name"
							class="easyui-validatebox span2" style="width: 180px;"
							data-options="required:true">
						</select>
					</td>
					<th>证书编码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="card_code" style="width: 100%; height: 100%"
						value="${certificate.card_code}" type="text" id="card_code"
						class="easyui-validatebox span2" data-options="required:true"/></td>
				</tr>
				<tr>
					<th>证书获取时间&nbsp;</th>
					<td><input class="Wdate" type="text" name="card_getdate" value="${certificate.card_getdate}" id="card_getdate" 
							style="width: 100%;height:100%"
							onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>
					<th>证书到期时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="card_enddate" id="card_enddate"
							style="width: 100%;height:100%" value="${certificate.card_enddate}"
							onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>
				</tr>

				<tr>
					<th>发证单位&nbsp;</th>
					<td><input name="card_issuer" type="text" id="card_issuer"
						value="${certificate.card_issuer}" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" /></td>
					<th>持证人 &nbsp;</th>
					<td><input name="card_owner" style="width: 100%; height: 100%"
						value="${certificate.card_owner}" type="text" id="card_owner"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>证书类型&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="card_type" name="card_type" style="width: 100%;height: 100%""
							class="easyui-validatebox span2" 
							data-options="required:true">
							<option value="A证">A证</option>
    						<option value="B证">B证</option>
    						<option value="C证">C证</option>
    						<option value="五大员证">五大员证</option>
    						<option value="建造师注册证">建造师注册证</option>
    						<option value="建造师执业资格证">建造师执业资格证</option>
    						<option value="职称证">职称证</option>
    						<option value="公司五大证">公司五大证</option>
    						<option value="安全生产考核合格证">安全生产考核合格证</option>
    						<option value="其他">其他</option>
						</select></td>
					<th>所属公司 &nbsp;</th>
					<td><input name="card_level" style="width: 100%; height: 100%"
						value="${certificate.card_level}" type="text" id="card_level"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>证书状态&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="card_status" name="card_status" value="${certificate.card_status}" style="width: 100%;height: 100%"
							class="easyui-validatebox span2" data-options="required:true">
							<option value="正常" selected>正常</option>
    						<option value="已使用">已使用</option>
    						<option value="已过期">已过期</option>
						</select></td>
					
				</tr>
				<tr>
					<th>备注&nbsp;</th>

					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="remark">${certificate.remark}</textarea> <input
						type="hidden" name="attachmentIds" id="attachmentIds"
						value="${certificate.attachmentIds}"></td>
				</tr>
			</table>
		</form>
		<input type="hidden" id="attachmentType" value="zsmc">
		<jsp:include page="../../upload.jsp"></jsp:include>
	</div>
</div>