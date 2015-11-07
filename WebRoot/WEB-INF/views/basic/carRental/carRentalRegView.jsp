<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
.caption{
	font-size: medium;
    font-style: normal;
    font-weight: bold;
    color: blue;
    margin-top: 20px;
}
</style>

<script type="text/javascript">
	$(function() {
		$('#carRentalRegEditForm').form({
			url : '${pageContext.request.contextPath}/carRentalReg/save',
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
		
		//审核时提交审核表单
		$('#processForm').form({
			url : '${pageContext.request.contextPath}/carRentalReg/complate',
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
		
		console.log('${viewType}');
		
	});
	
	$("#endMileage").blur(function() {
		$("#drivingMileage").val(parseInt($("#startingMileage").val()) - parseInt($("#endMileage").val()));
	});
	
	$("#unitPrice").blur(function() {
		$("#carCost").val(parseInt($("#unitPrice").val()) * parseInt($("#drivingMileage").val()));
	});
	
	$("#tolls").blur(function() {
		$("#totalCost").val(parseInt($("#tolls").val()) + parseInt($("#carCost").val()));
	});
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="carRentalRegEditForm" method="post">
			<table class="grid">
				<tr>
					<th>用车人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input type="hidden" name="id" value="${carRentalReg.id}"/>
						<c:if test="${carRentalReg.process_vo != null}">
							<input type="hidden" name="process_vo.id" value="${carRentalReg.process_vo.id}" />
						</c:if>
						<!-- 动作类型 -->
						<input type="hidden" name="actionType" id="actionType" value="" />
						<input name="usedName" value="${carRentalReg.usedName}"
						style="width: 100%;" type="text" id="usedName"
						class="easyui-validatebox span2" data-options="required:true" /></td>
						
					<th>用车时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="usedTime"
						value="<fmt:formatDate value="${carRentalReg.usedTime}" pattern="yyyy-MM-dd"/>"
						id="usedTime" style="width: 100%; height: 100%" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>	
					<th>用车事由&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5">
						<input name="usedReason" value="${carRentalReg.usedReason}"
						style="width: 100%;" type="text" id="usedReason"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				 <tr>
					<th>车主&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input name="driver" value="${carRentalReg.driver}"
						style="width: 100%;" type="text" id="driver"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				
					
					<th>车号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input name="license" value="${carRentalReg.license}"
						style="width: 100%;" type="text" id="license"
						class="easyui-validatebox span2" data-options="required:true" /></td>
						
				</tr>
				<tr>
					<th>起点里程&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input name="startingMileage" value="${carRentalReg.startingMileage}"
						style="width: 100%;" type="text" id="startingMileage"
						 data-options="required:true" /></td>
				
					<th>终点里程&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input name="endMileage" value="${carRentalReg.endMileage}"
						style="width: 100%;" type="text" id="endMileage"
						 data-options="required:true" /></td>
						
					<th>行驶里程&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input name="drivingMileage" value="${carRentalReg.drivingMileage}"
						style="width: 100%;" type="text" id="drivingMileage"
						 data-options="required:true" /></td>
				</tr>
				<tr>
					<th>单价(元/公里)&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="unitPrice"  value="${carRentalReg.unitPrice}"
						style="width: 100%;" type="text" id="unitPrice" class="easyui-numberbox"  precision="2" min="0"
						data-options="required:true" /></td>
						
					<th>合价(元)&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="carCost"  value="${carRentalReg.carCost}"
						style="width: 100%;" type="text" id="carCost" 
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>过路费(元)&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="tolls"  value="${carRentalReg.tolls}"
						style="width: 100%;" type="text" id="tolls" class="easyui-numberbox"  precision="2" min="0"
						data-options="required:true" /></td>
						
					<th>总计(元)&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="totalCost"  value="${carRentalReg.totalCost}"
						style="width: 100%;" type="text" id="totalCost" 
						data-options="required:true" /></td>
				</tr> 
			</table>
		</form>
		
		<c:if test="${fn:contains(viewType, 'handler')}">
			<form id="processForm" method="post">
				<table class="grid">
					<caption align="top" class="caption">流程审核</caption>  
					<tr>
						<th>流程名称 &nbsp;</th>
						<td><input type="hidden" name="id"
							value="${carRentalReg.process_vo.id}" /> <input type="hidden"
							name="option" id="option" value="" type="text" /><input
							name="processName" value="${carRentalReg.process_vo.processName}"
							type="text" id="processName" style="width: 100%; height: 100%"
							class="easyui-validatebox span2" readonly="readonly" /></td>
						<th>申请人 &nbsp;</th>
						<td><input type="hidden" name="applyUserId"
							value="${carRentalReg.process_vo.applyUserId}" /> <input
							name="applyUserName"
							value="${carRentalReg.process_vo.applyUserName}" type="text"
							id="applyUserName" style="width: 100%; height: 100%"
							class="easyui-validatebox span2" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>开始时间 &nbsp;</th>
						<td><input class="Wdate" type="text" name="startDT"
							readonly="readonly" style="width: 98%; height: 100%;"
							value="${carRentalReg.process_vo.startDT}" /></td>
						<th>结束时间 &nbsp;</th>
						<td><input class="Wdate" type="text" name="endDT"
							readonly="readonly" value="${carRentalReg.process_vo.endDT}"
							id="endDT" style="width: 98%; height: 100%;" /></td>
					</tr>
					<tr>
						<th>办理意见&nbsp;</th>
						<td colspan="4"><textarea style="width: 100%" rows="3"
								name="remark" id="remark"></textarea></td>
					</tr>
				</table>
			</form>
		</c:if>
	</div>
</div>