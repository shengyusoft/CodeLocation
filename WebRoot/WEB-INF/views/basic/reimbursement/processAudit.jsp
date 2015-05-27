<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#processForm').form({
			url : '${pageContext.request.contextPath}/reimbursement/complate',
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
					parent.$.messager.alert('提示',result.msg,'success');
					debugger;
					var grid = parent.$.modalDialog.openner_dataGrid;
					if(!isEmpty(grid)){
						grid.datagrid('reload');
					}
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<table class="grid">
			<tr>
				<th>时间范围 &nbsp;<label
					style="color: red; vertical-align: middle; text-align: center;">*</label></th>
				<td><input class="Wdate" readonly="readonly" type="text"
					name="startDT" value="${reimbursement.startDT}" id="startDT"
					style="width: 98%; height: 100%;" /></td>
				<td><input class="Wdate" readonly="readonly" type="text"
					name="endDT" value="${reimbursement.endDT}" id="endDT"
					style="width: 98%; height: 100%;" /></td>
			</tr>
			<tr>
				<th>地点 &nbsp;</th>
				<td><input name="processName" value="${reimbursement.place}"
					type="text" id="processName" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>工作事情&nbsp;</th>
				<td colspan="4"><textarea style="width: 100%" rows="3"
						name="workDetail" id="workDetail"> ${reimbursement.workDetail}
						</textarea></td>
			</tr>
			<tr>
				<th>费用明细&nbsp;</th>
				<td colspan="4"><textarea style="width: 100%" rows="3"
						readonly="readonly" name="costDetail" id="costDetail">${reimbursement.costDetail}</textarea></td>
			</tr>
			<tr>
				<th>费用小计&nbsp;</th>
				<td colspan="3">
					<table title="费用小计" width="800">
						<tr>
							<th width="80">交通费（元）&nbsp;</th>
							<td><input name="trafficFee"
								value="${reimbursement.trafficFee}" type="number"
								id="trafficFee" readonly="readonly"
								style="width: 100%; height: 100%"
								class="easyui-validatebox span2" /></td>
							<th width="80">就餐费（元）&nbsp;</th>
							<td><input name="mealFee" readonly="readonly"
								value="${reimbursement.mealFee}" type="number" id="mealFee"
								style="width: 100%; height: 100%"
								class="easyui-validatebox span2" /></td>
							<th width="80">办公费（元）&nbsp;</th>
							<td><input name="officeFee"
								value="${reimbursement.officeFee}" type="number" id="officeFee"
								style="width: 100%; height: 100%" readonly="readonly"
								class="easyui-validatebox span2" /></td>
							<th width="80">招待费（元）&nbsp;</th>
							<td><input name="receiveFee" readonly="readonly"
								value="${reimbursement.receiveFee}" type="number"
								id="receiveFee" style="width: 100%; height: 100%"
								class="easyui-validatebox span2" /></td>
						</tr>
						<tr>
							<th width="80">证章费（元）&nbsp;</th>
							<td><input name="badgeFee" readonly="readonly"
								value="${reimbursement.badgeFee}" type="number" id="badgeFee"
								style="width: 100%; height: 100%"
								class="easyui-validatebox span2" /></td>
							<th width="80">通讯费（元）&nbsp;</th>
							<td><input name="communicationFee"
								value="${reimbursement.communicationFee}" readonly="readonly"
								type="number" id="communicationFee"
								style="width: 100%; height: 100%"
								class="easyui-validatebox span2" /></td>
							<th width="80">培训费（元）&nbsp;</th>
							<td><input name="trainFee" value="${reimbursement.trainFee}"
								readonly="readonly" type="number" id="trainFee"
								style="width: 100%; height: 100%"
								class="easyui-validatebox span2" /></td>
							<th width="80">其它（元）&nbsp;</th>
							<td><input name="otherFee" value="${reimbursement.otherFee}"
								readonly="readonly" type="number" id="otherFee"
								style="width: 100%; height: 100%"
								class="easyui-validatebox span2" /></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<form id="processForm" method="post">
			<table class="grid">
				<tr>
					<th>流程名称 &nbsp;</th>
					<td><input type="hidden" name="id" value="${reimbursement.process_vo.id}" /> <input
						type="hidden" name="option" id="option" value="" type="text" /><input
						name="processName" value="${reimbursement.process_vo.processName}" type="text"
						id="processName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>申请人 &nbsp;</th>
					<td><input type="hidden" name="applyUserId"
						value="${reimbursement.process_vo.applyUserId}" /> <input name="applyUserName"
						value="${reimbursement.process_vo.applyUserName}" type="text" id="applyUserName"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>开始时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="startDT"
						readonly="readonly" style="width: 98%; height: 100%;"
						value="${reimbursement.process_vo.startDT}" /></td>
					<th>结束时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="endDT"
						readonly="readonly" value="${reimbursement.process_vo.endDT}" id="endDT"
						style="width: 98%; height: 100%;" /></td>
				</tr>
				<tr>
					<th>办理意见&nbsp;</th>
					<td colspan="4"><textarea style="width: 100%" rows="3"
							name="remark" id="remark"></textarea></td>
				</tr>
			</table>
		</form>

	</div>
</div>