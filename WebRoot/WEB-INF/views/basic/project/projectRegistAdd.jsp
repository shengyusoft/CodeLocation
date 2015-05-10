<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#goodsAddForm').form({
			url : '${pageContext.request.contextPath}/goods/add',
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
	
	$('#typeId').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=goodstype",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="goodsAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
			
				<tr>
					<th>商品类别 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="typeId" name="typeId"
						class="easyui-validatebox span2" style="width: 280px;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>品名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="text" id="name" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>单位 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="unit" style="width: 100%; height: 100%"
						type="text" id="unit" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>采购价&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="price" type="text" id="price"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>规格 &nbsp;</th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="standard" class="easyui-validatebox span2"/></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>