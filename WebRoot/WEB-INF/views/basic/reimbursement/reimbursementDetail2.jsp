<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
					<td>
						<input id="startDT" name="startDT" class="easyui-datebox" readonly="readonly" type="text" 
						value='<fmt:formatDate value="${reimbursement.startDT}" pattern="yyyy-MM-dd"/>'/>
					</td>
					<td>
						<input id="endDT" name="endDT" class="easyui-datebox" readonly="readonly" type="text" 
						value='<fmt:formatDate value="${reimbursement.endDT}" pattern="yyyy-MM-dd"/>' />
					</td>
				</tr>
				<tr>
					<th>地点 &nbsp;</th>
					<td colspan="3"><input name="placeName" readonly="readonly"
						value="${reimbursement.place}" type="text" id="trafficFee"
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
								<th width="80">交通费（元）&nbsp;</th>
								<td><input name="trafficFee" readonly="readonly"
									value="${reimbursement.trafficFee}" type="text"
									id="trafficFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">就餐费（元）&nbsp;</th>
								<td><input name="mealFee" value="${reimbursement.mealFee}"
									type="text" id="mealFee" readonly="readonly"
									style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">办公费（元）&nbsp;</th>
								<td><input name="officeFee"
									value="${reimbursement.officeFee}" type="text" id="officeFee"
									style="width: 100%; height: 100%" readonly="readonly"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">招待费（元）&nbsp;</th>
								<td><input name="receiveFee" readonly="readonly"
									value="${reimbursement.receiveFee}" type="text"
									id="receiveFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
							</tr>
							<tr>
								<th width="80">刻章费（元）&nbsp;</th>
								<td><input name="badgeFee" readonly="readonly"
									value="${reimbursement.badgeFee}" type="text" id="badgeFee"
									style="width: 100%; height: 100%" readonly="readonly"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">通讯费（元）&nbsp;</th>
								<td><input name="communicationFee" readonly="readonly"
									value="${reimbursement.communicationFee}" type="text"
									id="communicationFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">物品购置费（元）&nbsp;</th>
								<td><input name="trainFee" min="0"
									value="${reimbursement.trainFee}" type="text" id="trainFee"
									style="width: 100%; height: 100%" readonly="readonly"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">其它费（元）&nbsp;</th>
								<td><input name="otherFee" min="0"
									value="${reimbursement.otherFee}" type="text" id="otherFee"
									style="width: 100%; height: 100%" readonly="readonly"
									class="easyui-numberbox" precision="2" min="0" /></td>
							</tr>
							<tr>
								<th width="80">文印费（元）&nbsp;</th>
								<td><input name="wyFee" value="${reimbursement.wyFee}"
									type="text" id="wyFee" readonly="readonly"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<th width="80">制证费（元）&nbsp;</th>
								<td><input name="zzFee" type="text" id="zzFee"
									value="${reimbursement.zzFee}" readonly="readonly"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<th width="120">住宿费（元）&nbsp;</th>
								<td><input name="zsFee" value="${reimbursement.zsFee}"
									type="text" id="zsFee" readonly="readonly"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<th width="80">快递费（元）&nbsp;</th>
								<td><input name="kdFee" value="${reimbursement.kdFee}"
									type="text" id="kdFee" readonly="readonly"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>