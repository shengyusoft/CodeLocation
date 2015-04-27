<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid2;
	//load the purchasePlan details
	$(function() {
		loadpurchasePlanDetails();
	});

	function loadpurchasePlanDetails() {
		var purchasePlanId = $('#purchasePlan_id').val();
		if (isEmpty(purchasePlanId)) {
			purchasePlanId = 0;
		}
		dataGrid2 = $('#dataGrid2').datagrid({
			url : ctxPath + '/purchasePlanDetail/dataGrid',
			striped : true,
			rownumbers : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortpurchasePlan : 'asc',
			queryParams : {
				'purchasePlan.id' : purchasePlanId
			},
			columns : [ [ {
				width : '200',
				title : '品名',
				align : 'center',
				field : 'goods.name',
				formatter : function(val, raw, index) {
					if (raw) {
						var goods = raw.goods;
						return goods.name;
					}
				}
			}, {
				width : '120',
				title : '预定数量',
				align : 'center',
				field : 'scheduleNum'
			}, {
				width : '120',
				title : '采购价(元)',
				align : 'center',
				field : 'goods.price',
				formatter : function(val, raw, index) {
					if (raw) {
						var goods = raw.goods;
						return goods.price;
					}
				}
			}, {
				width : '120',
				title : '合计(元)',
				align : 'center',
				field : 'total',
				formatter : function(val, raw, index) {
					if (raw) {
						var total = 0;
						var salePrice = raw.goods.price;
						var scheduleNum = raw.scheduleNum;
						total = scheduleNum * salePrice;
						return total;
					}
				}
			} ] ],
			toolbar : '#toolbar'
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,bpurchasePlan:false">
	<div data-options="region:'center',fit:true,collapsed:false"
		style="overflow: hidden; width: 700px; bpurchasePlan: none">
		<table class="grid" style="bpurchasePlan: none"
			data-options="fit:true,bpurchasePlan:false">
			<tr>
				<th width="40">订货单位:</th>
				<td width="120"><input name="name"
					style="width: 100%; height: 100%; bpurchasePlan: none;" type="text"
					value="${purchasePlan.customer.companyName}"
					class="easyui-validatebox span2" readonly="readonly" /><input
					type="hidden" name="id" id="purchasePlan_id" value="${purchasePlan.id}"></td>
				
				<th width="60">添加时间:</th>
				<td width="260"><input type="text" readonly="readonly"
					class="easyui-validatebox span2" id="seDt"
					style="width: 98%; height: 100%; bpurchasePlan: none"
					value="${purchasePlan.addDt}" /></td>
			</tr>
			<tr>
				<th width="60">客服电话:</th>
				<td align="center" width="100"><input
					style="width: 100%; height: 100%; bpurchasePlan: none" type="text"
					value="${purchasePlan.customer.servicePhone}"
					class="easyui-validatebox span2" readonly="readonly" /></td>

				<th width="40">传真:</th>
				<td width="100"><input
					style="width: 100%; height: 100%; bpurchasePlan: none" type="text"
					value="${purchasePlan.customer.fax}" class="easyui-validatebox span2"
					readonly="readonly" /></td>
			</tr>
		</table>
		<br />
		<table id="dataGrid2" data-options="fit:true,border:false"
			style="margin-top: 225px"></table>
	</div>

</div>