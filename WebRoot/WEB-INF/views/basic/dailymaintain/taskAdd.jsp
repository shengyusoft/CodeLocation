<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#taskAddForm').form({
			url : '${pageContext.request.contextPath}/task/add',
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
	
	showMoney();
	
	$('#acceptUserId').combobox({
		url : "${pageContext.request.contextPath}/user/combox?ocode=ywgroup&&dcode=zy",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});

	$('#taskTypeId').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=whtype",
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'
						
	});

	$('#contractId').combobox({
		url : "${pageContext.request.contextPath}/contract/combox",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});
	
	$("#charge").combobox({
		onChange: function (oldV,newV) {
			showMoney();
		}
	});
	
	function showMoney(){
		var select = null;
		try {
			select = $('#charge').combobox('getValue');
		} catch (e) {
			select = $('#charge').val();
		}
		if(select == 0){//不收费
			$('#money').attr('readonly','readonly');
			$('#money').attr('disabled','disabled');
		}else{//收费
			$('#money').removeAttr('readonly','readonly');
			$('#money').removeAttr('disabled','disabled');
		}
	}
	
	function startDTlimit() {
		WdatePicker({
			minDate : '%y-%M-%d',
			dateFmt : 'yyyy-MM-dd'
		});
	}
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="taskAddForm" method="post"
			style="width: 830px; height: auto;">
			<table class="grid">
				<tr>
					<th width="10%">任务名称 &nbsp; <label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td width="30%">
						<input name="name"
							style="width: 98%; height: 98%" type="text" id="name"
							class="easyui-validatebox span2" data-options="required:true" />
						<input type="hidden" name="attachmentIds" id="attachmentIds" />
					</td>

					<th width="10%">任务地点 &nbsp; <label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td width="30%"><input name="place"
						style="width: 98%; height: 98%" type="text" id="place"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>任务模块 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="taskModule" style="width: 98%; height: 98%"
						type="text" id="taskModule" class="easyui-validatebox span2"
						data-options="required:true"/></td>

					<th>负责人 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="acceptUserId" name="acceptUserId"
						style="width: 98%; height: auto" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>

					<th>任务执行日期&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="excuteDT"
						id="excuteDT" style="width: 98%; height: 98%"
						onfocus="startDTlimit()" /></td>

					<th>时间段&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><input class="Wdate" type="text"
						name="startTime" id="startTime" style="width: 45%; height: 98%"
						onfocus="showDate('HH:mm')" value="08:30" /> -- <input class="Wdate"
						type="text" name="endTime" id="endTime" value="17:30"
						style="width: 45%; height: 98%" onfocus="showDate('HH:mm')" />
					</td>

				</tr>

				<tr>
					<th>维护类型&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="taskTypeId" name="taskTypeId"
						style="width: 98%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>
					<th>重要等级&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="level" class="easyui-combobox" name="level"
						style="width: 100px;" panelHeight="auto">
							<option value="1">一般</option>
							<option value="2">重要</option>
							<option value="3">紧急</option>
					</select></td>
				</tr>
				<tr>
					<th>是否收费&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="charge" class="easyui-combobox combobox-f combo-f" name="charge"
						style="width: 100px;" panelHeight="auto">
							<option value="0" selected="selected">否</option>
							<option value="1">是</option>
					</select></td>

					<th>收费金额</th>
					<td><input name="money" type="text" id="money"
						style="width: 98%; height: 98%" class="easyui-validatebox span2"/></td>
				</tr>
				<tr>
					<th>合同</th>
					<td>
						<select id="contractId" name="contractId"
							style="width: 98%;" class="easyui-validatebox span2">
						</select>
					</td>

					<th>联系业主</th>
					<td>姓名:<input name="contactUser"  type="text" id="contactUser"
						style="width: 36%;" class="easyui-validatebox span2"/>&nbsp;号码:
						<input name="contactPhone" type="text" id="contactPhone" style="width: 36%;"
						class="easyui-validatebox span2" />
					</td>
				</tr>
				<tr>
					<th>问题描述</th>
					<td colspan="3"><textarea style="width: 98%" rows="5"
							name="describle"></textarea></td>
				</tr>

				<tr>
					<th>维护任务</th>
					<td colspan="3"><textarea style="width: 98%" rows="5"
							name="taskdetail"></textarea></td>
				</tr>
			</table>
		</form>
		<input type="hidden" id="attachmentType" value="rcwh">
		<jsp:include page="../../upload.jsp"></jsp:include>
	</div>
</div>