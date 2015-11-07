<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#scoreCutRegisterAddForm').form({
			url : '${pageContext.request.contextPath}/scoreCutRegister/apply',
			onSubmit : function() {
				// 表单验证
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
		// 申请时间
		var d = new Date();
		d = d.format('yyyy-MM-dd');
		$('#show_date').val(d);
	});

	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="scoreCutRegisterAddForm" method="post">
		<input type="hidden" name="option" id="option" value="" />
			<table class="grid">
				<tr>
					<th>
						项目名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="5">
						<input name="projectName" id="projectName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						单位 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="unit" id="unit" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						数量 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="num" id="num" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 />
					</td>
				</tr>
				<tr>
					<th>
						完成时间 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="finishDate" id="finishDate" type="text" style="width: 100%; height: 100%"  
							 class="Wdate" data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
					<th>
						绩效提成金额（元） &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="amount" id="amount" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 />
					</td>
				</tr>
				<tr>
					<th>
						费用名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td colspan="5">
						<input name="costName" id="costName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					
				</tr>
				<tr>
					<th>
						申请人 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input value="${name}" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" disabled="disabled" />
					</td>
					<th>
						申请时间  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="show_date" id="show_date" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" disabled="disabled" />
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