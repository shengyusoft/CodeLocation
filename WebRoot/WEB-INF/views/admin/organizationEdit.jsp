<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	$(function() {
		$('#pid').combotree({
			url : '${ctx}/organization/tree?flag=false',
			parentField : 'pid',
			lines : true,
			panelHeight : 'auto',
			value :'${organization.pid}'
		});
		
		if ($(':input[name="id"]').val().length > 0) {
			$.post( '${ctx}/organization/get', {
				id : $(':input[name="id"]').val()
			}, function(result) {
				if (result.id != undefined) {
					$('#organizationEditForm').form('load', {
						'id' : result.id,
						'code' : result.code,
						'name' : result.name,
						'address' : result.address,
						'icon' : result.icon,
						'seq' : result.seq
					});
					$('#pid').combotree('setValue',result.pid);
				}
			}, 'json');
		}
		
		$('#organizationEditForm').form({
			url : '${ctx}/organization/edit',
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
					parent.$.modalDialog.openner_treeGrid.treegrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_treeGrid这个对象，是因为organization.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				}
			}
		});
		
	});
</script>
<div style="padding: 3px;">
	<form id="organizationEditForm" method="post">
		<table class="grid">
			<tr>
				<td>编号</td>
				<td><input name="id" type="hidden" style="width: 134px;" value="${organization.id}">
				<input name="code" type="text"  /></td>
				<td>部门名称</td>
				<td><input name="name" type="text" value="${organization.name}" style="width: 134px;" class="easyui-validatebox" data-options="required:true" ></td>
			</tr>
			<tr>
				<td>排序</td>
				<td><input name="seq" class="easyui-numberspinner" value="${organization.seq}" style="widtd: 140px;" data-options="editable:false,required:true"></td>
				<td>菜单图标</td>
				<td><input name="icon" value="${organization.icon}" style="width: 134px;"/></td>
			</tr>
			<tr>
				<td>地址</td>
				<td colspan="3"><input name="address" type="text" style="width: 378px;" value="${organization.address}"/></td>
			</tr>
			<tr>
				<td>上级部门</td>
				<td colspan="3"><select id="pid" name="pid" style="width: 239px;"></select>
				<a class="easyui-linkbutton" href="javascript:void(0)" onclick="$('#pid').combotree('clear');" >清空</a></td>
			</tr>
		</table>
	</form>
</div>
