<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#reimbursementAddForm').form({
			url : '${pageContext.request.contextPath}/reimbursement/apply',
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
	
	$('#provice').combobox({
		url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=&&lvs="+2,
		parentField : 'pid',
		valueField : 'id',
		textField : 'text',
		panelHeight : 300,
		required:true,
		editable:false,//不可编辑，只能选择
		value:'--请选择--',
		onChange:function(provice){
	    	$('#city').combobox({
	    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+provice+"&&lvs=3",
		    valueField:'id', //值字段
		    textField:'text', //显示的字段
		    panelHeight:'auto',
		    required:true,
		    editable:false,//不可编辑，只能选择
		    value:'--请选择--',
		    onChange:function(city,n){
		    	$('#county').combobox({
			    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+city+"&&lvs=4",
				    valueField:'id', //值字段
				    textField:'text', //显示的字段
				    panelHeight:'auto',
				    required:true,
				    editable:false,//不可编辑，只能选择
				    value:'--请选择--'
				});
	 		}
	    });
	   }
	});
	
	$('#city').combobox({
	    valueField:'id', //值字段
	    textField:'text', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:false,//不可编辑，只能选择
	    value:'--请选择--'
	});
	
	$('#county').combobox({
	    valueField:'id', //值字段
	    textField:'text', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:false,//不可编辑，只能选择
	    value:'--请选择--'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="reimbursementAddForm" method="post">
			<table class="grid">
				<tr>
					<th>时间范围 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input type="hidden" name="option" id="option" value="" />
						<input class="Wdate" type="text" name="startDT" id="startDT"
						style="width: 68%; height: 100%;" data-options="required:true"
						onfocus="showStart('yyyy-MM-dd')" /></td>
					<td><input class="Wdate" type="text" name="endDT" id="endDT"
						style="width: 68%; height: 100%;" data-options="required:true"
						onfocus="showEnd('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="2">省：<select id="provice"
						data-options="editable:false,required:true" name="provice.id"
						class="easyui-validatebox span2" style="width: 150px;">
					</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 市：<select id="city"
						name="city.id" class="easyui-validatebox span2"
						style="width: 150px;">
					</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 县(区)：<select id="county"
						name="county.id" data-options="editable:false,required:true"
						class="easyui-validatebox span2" validType="selectValueRequired"
						style="width: 150px;">
					</select>
					</td>
				</tr>
				<tr>
					<th>工作事情&nbsp;</th>
					<td colspan="4"><textarea class="easyui-validatebox"
							style="width: 100%" rows="5" name="workDetail"
							data-options="required:true" id="workDetail"></textarea></td>
				</tr>
				<tr>
					<th>费用明细&nbsp;</th>
					<td colspan="4"><textarea class="easyui-validatebox"
							style="width: 100%" rows="5" name="costDetail"
							data-options="required:true" id="costDetail"></textarea></td>
				</tr>
				<tr>
					<th>费用小计&nbsp;</th>
					<td colspan="3">
						<table title="费用小计" width="800">
							<tr>
								<th width="80">交通费&nbsp;</th>
								<td><input name="trafficFee" min="0" value="0"
									type="number" id="trafficFee" style="width: 100%; height: 100%"
									min="0" value="0" class="easyui-validatebox span2" /></td>
								<th width="80">就餐费&nbsp;</th>
								<td><input name="mealFee" min="0" value="0" type="number"
									id="mealFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">办公费&nbsp;</th>
								<td><input name="officeFee" min="0" value="0" type="number"
									id="officeFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">招待费&nbsp;</th>
								<td><input name="receiveFee" min="0" value="0"
									type="number" id="receiveFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
							</tr>
							<tr>
								<th width="80">证章费&nbsp;</th>
								<td><input name="badgeFee" min="0" value="0" type="number"
									id="badgeFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">通讯费&nbsp;</th>
								<td><input name="communicationFee" min="0" value="0"
									type="number" id="communicationFee"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">培训费&nbsp;</th>
								<td><input name="trainFee" min="0" value="0" type="number"
									id="trainFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">其它&nbsp;</th>
								<td><input name="otherFee" min="0" value="0" type="number"
									id="otherFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
							</tr>
						</table>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>