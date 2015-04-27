<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		//添加或者删除,根据id判断
		var id = '${taskSchedule.id}';
		var url = null;
		if (isEmpty(id)) {
			url = '${pageContext.request.contextPath}/taskSchedule/add';
		} else {
			url = '${pageContext.request.contextPath}/taskSchedule/edit';
		}

		$('#taskScheduleForm').form({
			url : url,
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

		//默认进入show
		showlimit();
	});

	$("#sheduleType").combobox({
		onChange: function (oldV,newV) {
			showlimit();
		}
	});
	
	function showlimit(){
		var select = null;
		try {
			select = $('#sheduleType').combobox('getValue');
		} catch (e) {
			select = $('#sheduleType').val();
		}
		
		if(select == 1){//仅一次
			$('#dateLimit').removeAttr('data-options');
			$('#dateLimit').hide();
		}else{//收费
			$('#dateLimit').attr('data-options','required:true');
			$('#dateLimit').show();
		}
	}

	function startDTlimit() {
		var endDT = $dp.$('endDT');
		WdatePicker({
			onpicked : function() {
				endDT.focus();
			},
			maxDate : '#F{$dp.$D(\'endDT\')}',
			minDate : '%y-%M-%d',
			dateFmt : 'yyyy-MM-dd'
		});
	}

	function endDTlimit() {
		var minDT = $dp.$D('startDT');
		if(isEmpty(minDT)){
			minDT = '%y-%M-%d';
		}else{
			minDT='#F{$dp.$D(\'startDT\')}';
		}
		WdatePicker({
			minDate : minDT,
			dateFmt : 'yyyy-MM-dd'
		});
	}
	
	//初始化计划类型
	var sheduleType = '${taskSchedule.sheduleType}';
	$('#sheduleType').val(sheduleType);

	var autoArrange = '${taskSchedule.autoArrange}';

	if (autoArrange == 'true' || autoArrange == true) {
		$('#autoArrange').val(1);
	} else {
		$('#autoArrange').val(0);
	}

	$('#taskId').combobox({
		url : "${pageContext.request.contextPath}/task/combox",
		valueField : 'id',
		textField : 'name',
		value : '${taskSchedule.taskId}',
		panelHeight : 'auto'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="taskScheduleForm" method="post"
			style="width: auto; height: auto;">
			<table class="grid">
				<tr>
					<th width="30%">任务&nbsp; <label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="taskId" name="taskId"
						style="width: auto; min-width: 130px"
						class="easyui-validatebox span2" data-options="required:true">
					</select> <input type="hidden" name="id" id="id" value="${taskSchedule.id}" />
						<input type="hidden" name="userId" id="id"
						value="${taskSchedule.userId}" /> <input type="hidden"
						name="addTime" id="id" value="${taskSchedule.addTime}" />
						<input type="hidden" name="state" id="state" value="${taskSchedule.state}" />
						</td>
				</tr>

				<tr>
					<th>循环类型 &nbsp; <label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="sheduleType" class="easyui-combobox"
						name="sheduleType" style="width: 100%; min-width: 100px"
						panelHeight="auto" data-options="required:true">
							<option value="1">仅一次</option>
							<option value="2">每天</option>
							<option value="3">每周</option>
							<option value="4">每月</option>
							<option value="5">每季度</option>
							<option value="6">每年</option>
					</select></td>
				</tr>
				<tr>
					<th>任务首次执行日期&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="excuteDT"
						data-options="required:true" value="${taskSchedule.excuteDT}"
						id="excuteDT" style="width: 45%; height: 98%"
						onfocus="showDate('yyyy-MM-dd')" /></td>

				</tr>

				<tr>
					<th>产生任务提前&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="sheduleAdvice" class="easyui-combobox"
						name="sheduleAdvice" style="width: 100%; min-width: 100px"
						panelHeight="auto">
							<option value="1">一天</option>
							<option value="2">两天</option>
							<option value="3">三天</option>
					</select></td>
				</tr>
				<tr id="dateLimit">
					<th>计划期限&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text"
						value="${taskSchedule.startDT}" name="startDT" id="startDT"
						data-options="required:true" style="width: 45%; height: 98%"
						onfocus="startDTlimit()" />&nbsp;到&nbsp;<input class="Wdate"
						type="text" name="endDT" id="endDT" value="${taskSchedule.endDT}"
						style="width: 45%; height: 98%" data-options="required:true"
						onfocus="endDTlimit()" /></td>
				</tr>

				<tr>
					<th>自动安排任务&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="autoArrange" class="easyui-combobox"
						name="autoArrange" style="width: 100%; min-width: 100px"
						panelHeight="auto">
							<option value="0">手动安排</option>
							<option value="1">自动安排</option>
					</select></td>
				</tr>
				<tr>
					<td colspan="2">
						<p style="font-family: sans-serif; font-size: 12px; color: gray">
							说明:产生任务提前几天是相对于任务的执行日期而言的,比如任务的执行日期是7月1日,提前一天就是在6月30日产生任务</p>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>