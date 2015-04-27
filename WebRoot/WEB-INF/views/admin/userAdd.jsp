<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	$(function() {

		$('#organizationId').combotree({
			url : '${ctx}/organization/tree',
			parentField : 'pid',
			lines : true,
			panelHeight : 'auto'
		});

		$('#roleIds').combotree({
			url : '${ctx}/role/tree',
			multiple : true,
			required : true,
			panelHeight : 'auto'
		});

		$('#userAddForm').form({
			url : '${ctx}/user/add',
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
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('提示', result.msg, 'warning');
				}
			}
		});

		//绑定字典:为用户类型赋值
		pubMethod.bind('usertype', 'usertype');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="userAddForm" method="post">
			<table class="grid">
				<tr>
					<th width="20%">登录名</th>
					<td><input name="loginname" style="width: 134px;" type="text"
						class="easyui-validatebox" data-options="required:true" value=""></td>
					<th width="20%">姓名</th>
					<td><input name="name" type="text" style="width: 134px;"
						class="easyui-validatebox" data-options="required:true" value=""></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input name="password" type="password"
						style="width: 134px;" class="easyui-validatebox"
						data-options="required:true"></td>
					<th>性别</th>
					<td><select name="sex" class="easyui-combobox"
						data-options="width:140,editable:false,panelHeight:'auto'">
							<c:forEach items="${sexList}" var="sexList">
								<option value="${sexList.key}">${sexList.value}</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>年龄</th>
					<td><input type="text" name="age" style="width: 134px;" /></td>
					<th>用户类型</th>
					<td><input id="usertype" name="usertype" style="width: 140px;" /></td>
				</tr>
				<tr>
					<th>部门</th>
					<td><select id="organizationId" name="organizationId"
						style="width: 140px;" class="easyui-validatebox"
						data-options="required:true"></select></td>
					<th>角色</th>
					<td><select id="roleIds" name="roleIds" style="width: 140px;"></select></td>
				</tr>
				
				<tr>
					<th>办公电话</th>
					<td><input type="text" name="officePhone" style="width: 134px;" /></td>
					<th>手机号码</th>
					<td><input type="text" name="mobilePhone" style="width: 140px;" /></td>
				</tr>
				<tr>
					<th>传值号码</th>
					<td><input type="text" name="fax" style="width: 134px;" /></td>
					<th>电子邮件</th>
					<td><input name="email" style="width: 140px;" data-options="validType:'email'" /></td>
				</tr>
				
				<tr>
					<th>备注</th>
					<td colspan="3">
						<textarea rows="5" name="remark" style="font-size: 10px; width: 96%"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>