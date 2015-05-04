<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#reimbursementEditForm').form({
			url : '${pageContext.request.contextPath}/reimbursement/edit',
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
	
	$('#province').combobox({
		url : "${pageContext.request.contextPath}/dictionarytype/combox?pid=14",
		parentField : 'pid',
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto',
		required:true,
		editable:true,//不可编辑，只能选择
		value:'--请选择--',
		onChange:function(province){
	    	$('#city').combobox({
	    	url : "${pageContext.request.contextPath}/dictionarytype/combox?pid="+province,
		    valueField:'id', //值字段
		    textField:'name', //显示的字段
		    panelHeight:'auto',
		    required:true,
		    editable:true,//不可编辑，只能选择
		    value:'--请选择--',
		    onChange:function(city){
		    	$('#place').combobox({
			    	url : "${pageContext.request.contextPath}/dictionarytype/combox?pid="+city,
				    valueField:'id', //值字段
				    textField:'name', //显示的字段
				    panelHeight:'auto',
				    required:true,
				    editable:true,//不可编辑，只能选择
				    value:'--请选择--'
				});
	 		}
	    	
	    });
	   }
	});
	
	$('#city').combobox({
    	url : "${pageContext.request.contextPath}/dictionarytype/combox",
	    valueField:'id', //值字段
	    textField:'name', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:true,//不可编辑，只能选择
	    value:'--请选择--'
	});
	
	$('#place').combobox({
    	url : "${pageContext.request.contextPath}/dictionarytype/combox",
	    valueField:'id', //值字段
	    textField:'name', //显示的字段
	    value : '${reimbursement.place.id}',
	    panelHeight:'auto',
	    required:true,
	    editable:true,//不可编辑，只能选择
	    value:'--请选择--'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="reimbursementEditForm" method="post" >
			<table class="grid">
				<tr>
					<th>时间范围 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input type="hidden" name="id" value="${reimbursement.id}" />
						<input class="Wdate" type="text" name="startDT" value="${reimbursement.startDT}" id="startDT" style="width: 98%; height: 100%;" onfocus="showDate('yyyy-MM-dd')" />
					</td>
					<td>
						<input class="Wdate" type="text" name="endDT" value="${reimbursement.endDT}" id="endDT"style="width: 98%; height: 100%;"onfocus="showDate('yyyy-MM-dd')" />
					</td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<select id="province" name="province" class="easyui-validatebox span2" style="width: 140px;">
					</select>
					</td>
					<td>
						<select id="city" name="city" class="easyui-validatebox span2" style="width: 140px;">
					</select>
					</td>
					<td>
						<select id="place" name="place.id"
						class="easyui-validatebox span2" style="width: 140px;">
					</select>
					</td>
				</tr>
				<tr>
					<th>工作事情&nbsp;</th>
					<td colspan="4">
						<textarea style="width: 100%" rows="5"name="workDetail" id="workDetail"> ${reimbursement.workDetail}
						</textarea>
					</td>
				</tr>
				<tr>
					<th>费用明细&nbsp;</th>
					<td colspan="4"><textarea style="width: 100%" rows="5"
							name="costDetail" id="costDetail">${reimbursement.costDetail}</textarea></td>
				</tr>
				<tr>
					<th>费用小计&nbsp;</th>
					<td colspan="3">
						<table title="费用小计" width="800" >
							<tr>
								<th width="80">交通费&nbsp;</th>
								<td>
									<input name="trafficFee" value="${reimbursement.trafficFee}" type="number" id="trafficFee" style="width: 100%; height: 100%" class="easyui-validatebox span2" />
								</td>
								<th width="80">就餐费&nbsp;</th>
								<td>
									<input name="mealFee" value="${reimbursement.mealFee}" type="number" id="mealFee" style="width: 100%; height: 100%" class="easyui-validatebox span2" />
								</td>
								<th width="80">办公费&nbsp;</th>
								<td>
									<input name="officeFee" value="${reimbursement.officeFee}" type="number" id="officeFee" style="width: 100%; height: 100%" class="easyui-validatebox span2" />
								</td>
								<th width="80">招待费&nbsp;</th>
								<td>
									<input name="receiveFee" value="${reimbursement.receiveFee}" type="number" id="receiveFee" style="width: 100%; height: 100%" class="easyui-validatebox span2"/>
								</td>
							</tr>
							<tr>
								<th width="80">证章费&nbsp;</th>
								<td>
									<input name="badgeFee" value="${reimbursement.badgeFee}" type="number" id="badgeFee" style="width: 100%; height: 100%" class="easyui-validatebox span2" />
								</td>
								<th width="80">通讯费&nbsp;</th>
								<td>
									<input name="communicationFee" value="${reimbursement.communicationFee}" type="number" id="communicationFee" style="width: 100%; height: 100%" class="easyui-validatebox span2" />
								</td>
								<th width="80">培训费&nbsp;</th>
								<td>
									<input name="trainFee" value="${reimbursement.trainFee}" type="number" id="trainFee" style="width: 100%; height: 100%" class="easyui-validatebox span2"/>
								</td>
								<th width="80">其它&nbsp;</th>
								<td>
									<input name="otherFee" value="${reimbursement.otherFee}" type="number" id="otherFee" style="width: 100%; height: 100%" class="easyui-validatebox span2" />
								</td>
							</tr>
					</table>
					</td>
				</tr>
				
			</table>
		</form>
	</div>
</div>