<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function() {
		$('#projectMeasureRegisterEditForm').form({
			url : '${pageContext.request.contextPath}/projectMeasureRegister/edit',
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
	// 表单加载
	$(function(){
		// 加载表单
		$('#projectMeasureRegisterEditForm').form('load', '/projectMeasureRegister/get?id=${id}');
	});
	// 省市县地点选择
	$('#provice').combobox({
		onSelect : function(record) {
			$('#city').combobox({
				url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=" + record.id + "&&lvs=3",
				valueField : 'text', //值字段
				textField : 'text', //显示的字段
				readonly : false,
				required : true,
				editable : false,//不可编辑，只能选择
				onSelect : function(record) {
					$('#county').combobox({
						url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=" + record.id + "&&lvs=4",
						valueField : 'text', //值字段
						textField : 'text', //显示的字段
						panelHeight : 'auto',
						readonly : false,
						required : true,
						editable : false//不可编辑，只能选择
					});
				}
			});
		}
	});

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectMeasureRegisterEditForm" method="post">
		<!-- 主键 -->
		<input id="id" name="id" type="hidden" />
			<table class="grid">
				<tr>
					<th>
						项目名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="projectName" id="projectName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						项目所在地 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						省：<input id="provice" name="provice" class="easyui-combobox" style="width: 140px"
		                               data-options="required:true,editable:true,valueField:'text',textField:'text',url:'/dictionary/xzqhCombox?pid=&&lvs=2'">
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						市：<input id="city" name="city" class="easyui-combobox" style="width: 140px;" />
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						县(区)：<input id="county" name="county" class="easyui-combobox" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<th>
						业务负责人&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="chargePerson" id="chargePerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系电话&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="contactPhone" id="contactPhone" type="text" style="width: 100%; height: 100%"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						测量费用&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="measureCost" id="measureCost" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" precision="2" min="0" data-options="required:true" />
					</td>
					<th>
						预付费用 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="prepayCost"  id="prepayCost" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" precision="2" min="0" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						付款方式&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="payWay" id="payWay" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						测量负责人 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="measurePerson" id="measurePerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						测量内容&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="measureContent" id="measureContent" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						测量进度&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="measureProgress" id="measureProgress" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3">
						<textarea style="width: 100%" rows="2" name="remark"></textarea>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>