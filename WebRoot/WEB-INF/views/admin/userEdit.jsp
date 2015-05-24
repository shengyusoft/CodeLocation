<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
	$(function() {
	
		$('#organizationId').combotree({
			url : '${ctx}/organization/tree',
			parentField : 'pid',
			lines : true,
			panelHeight : 'auto',
			value : '${user.organizationId}'
		});
		
		$('#roleIds').combotree({
			url : '${ctx}/role/tree',
			parentField : 'pid',
			lines : true,
			panelHeight : 'auto',
			multiple : true,
			required: true,
			cascadeCheck : false,
			value : $.stringToList('${user.roleIds}')
		});
		
		$('#userEditForm').form({
			url : '${ctx}/user/edit',
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
		
		pubMethod.bind('usertype', 'usertype');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
		<form id="userEditForm" method="post">
			<div class="light-info" style="overflow: hidden;padding: 3px;">
				<div>密码不修改请留空。</div>
			</div>
			<table class="grid">
				<tr>
					<th width="20%">登录名</th>
					<td><input name="id" type="hidden" style="width: 134px;" value="${user.id}">
					<input name="loginname" type="text" class="easyui-validatebox" readonly="readonly" disabled="disabled" value="${user.loginname}"></td>
					<th width="20%">姓名</th>
					<td><input name="name" type="text" style="width: 134px;" class="easyui-validatebox" data-options="required:true" value="${user.name}"></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input type="text" name="password" style="width: 134px;"/></td>
					<th>性别</th>
					<td><select name="sex" class="easyui-combobox" data-options="width:140,editable:false,panelHeight:'auto'">
						<c:forEach items="${sexList}" var="sexList">
							<option value="${sexList.key}" <c:if test="${sexList.key == user.sex}">selected="selected"</c:if>>${sexList.value}</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>年龄</th>
					<td><input type="text" name="age" value="${user.age}" style="width: 134px;"/></td>
					<th>用户类型</th>
					<td><input id="usertype" name="usertype" value="${user.usertype}" style="width: 140px;" /></td>
				</tr>
				<tr>
					<th>部门</th>
					<td><select id="organizationId" name="organizationId" style="width: 140px;" class="easyui-validatebox" data-options="required:true"></select></td>
					<th>角色</th>
					<td><input  id="roleIds" name="roleIds" style="width: 140px;"/></td>
				</tr>
				<tr>
					<th>办公电话</th>
					<td><input type="text" name="officePhone" value="${user.officePhone}" style="width: 134px;" /></td>
					<th>手机号码</th>
					<td><input type="text" class="easyui-validatebox" data-options="required:true" name="mobilePhone" value="${user.mobilePhone}" style="width: 140px;" /></td>
				</tr>
				<tr>
					<th>传值号码</th>
					<td><input type="text" name="fax" value="${user.fax}" style="width: 134px;" /></td>
					<th>电子邮件</th>
					<td><input name="email" value="${user.email}" style="width: 140px;" data-options="validType:'email'" /></td>
				</tr>
				<tr>
					<th>备注</th>
					<td colspan="3">
						<textarea rows="5" name="remark" style="font-size: 10px; width: 96%">${user.remark}</textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>