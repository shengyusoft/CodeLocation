<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function() {
		$('#projectPatrolRecordEditForm').form({
			url : '${pageContext.request.contextPath}/projectPatrolRecord/edit',
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
		
		$("#projectName").attr("readonly", true);
		$("#patrolNo").attr("readonly", true);
	});
	// 表单加载
	$(function(){
		// 加载表单
		$('#projectPatrolRecordEditForm').form('load', '/projectPatrolRecord/get?id=${id}');
	});

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectPatrolRecordEditForm" method="post">
		<!-- 主键 -->
		<input id="id" name="id" type="hidden" />
		<!-- 巡查登记表主键 -->
			<input id="registerId" name="registerId" type="hidden" />
			<table class="grid">
				<tr>
					<th>
						项目名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input id="projectName" name="projectName" class="easyui-validatebox span2" style="width: 225px" />
					</td>
					<th>
						巡查人 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="patrolPerson" id="patrolPerson" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						巡查时间 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="patrolTime" id="patrolTime" type="text" style="width: 70%; height: 100%"  
							 class="Wdate" data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
					<th>
						巡查次数 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="patrolNo" id="patrolNo" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" min="0"  />
					</td>
				</tr>
				<tr>
					<th>
						巡查结果&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="patrolResult" id="patrolResult" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						处理措施&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="handleMethod" id="handleMethod" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5">
						<textarea style="width: 100%" rows="2" name="remark"></textarea>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>