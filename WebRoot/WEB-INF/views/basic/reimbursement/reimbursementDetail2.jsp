<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$.fn.datebox.defaults.formatter = function(date) {
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		var d = date.getDate();
		return m + '-' + d + '-' + y;
	};
	
	$('#startDT').datebox({   
	    formatter : function(date){
	    	var y = date.getFullYear();
	    	var m = date.getMonth()+1;
	    	var d = date.getDate();
	    	return m+'-'+d+'-'+y;

	    }
	}); 
	
	$('#endDT').datebox({   
	    formatter : function(date){
	    	var y = date.getFullYear();
	    	var m = date.getMonth()+1;
	    	var d = date.getDate();
	    	return m+'-'+d+'-'+y;

	    }
	}); 
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="reimbursementDetail2Form" method="post">
			<table class="grid">
				<tr>
					<th>时间范围 &nbsp;</th>
					<td><input class="easyui-datebox" readonly="readonly"
						type="text" name="startDT" value="${reimbursement.startDT}"
						id="startDT" /></td>
					<td><input class="easyui-datebox" readonly="readonly"
						data-options="required:true" type="text" name="endDT"
						value="${reimbursement.endDT}" id="endDT" /></td>
				</tr>
				<tr>
					<th>地点 &nbsp;</th>
					<td colspan="3"><input name="placeName" readonly="readonly"
						value="${reimbursement.placeName}" type="text" id="trafficFee"
						data-options="required:true" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>工作事情&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							readonly="readonly" name="workDetail" id="workDetail"> ${reimbursement.workDetail}
						</textarea></td>
				</tr>
				<tr>
					<th>费用明细&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="costDetail" readonly="readonly" id="costDetail">${reimbursement.costDetail}</textarea></td>
				</tr>
				<tr>
					<th>费用小计&nbsp;</th>
					<td colspan="3">
						<table title="费用小计" width="800">
							<tr>
								<th width="80">交通费&nbsp;</th>
								<td><input name="trafficFee" readonly="readonly"
									value="${reimbursement.trafficFee}" type="number"
									id="trafficFee" data-options="required:true"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">就餐费&nbsp;</th>
								<td><input name="mealFee" readonly="readonly"
									value="${reimbursement.mealFee}" type="number" id="mealFee"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">办公费&nbsp;</th>
								<td><input name="officeFee" readonly="readonly"
									value="${reimbursement.officeFee}" type="number" id="officeFee"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">招待费&nbsp;</th>
								<td><input name="receiveFee" readonly="readonly"
									value="${reimbursement.receiveFee}" type="number"
									id="receiveFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
							</tr>
							<tr>
								<th width="80">证章费&nbsp;</th>
								<td><input name="badgeFee" readonly="readonly"
									value="${reimbursement.badgeFee}" type="number" id="badgeFee"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">通讯费&nbsp;</th>
								<td><input name="communicationFee" readonly="readonly"
									value="${reimbursement.communicationFee}" type="number"
									id="communicationFee" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">培训费&nbsp;</th>
								<td><input name="trainFee" readonly="readonly"
									value="${reimbursement.trainFee}" type="number" id="trainFee"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<th width="80">其它&nbsp;</th>
								<td><input name="otherFee" readonly="readonly"
									value="${reimbursement.otherFee}" type="number" id="otherFee"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>