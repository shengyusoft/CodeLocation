<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid2;
	//load the order details
	$(function() {
		loadOrderDetails();
	});

	function loadOrderDetails() {
		var orderId = $('#order_id').val();
		if (isEmpty(orderId)) {
			orderId = 0;
		}
		dataGrid2 = $('#dataGrid2').datagrid({
			url : ctxPath + '/orderDetail/dataGrid',
			striped : true,
			rownumbers : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			queryParams : {
				'torder.id' : orderId
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
				title : '单价(元)',
				align : 'center',
				field : 'salePrice'
			}, {
				width : '120',
				title : '实收数量',
				align : 'center',
				field : 'acceptNum'
			}, {
				width : '120',
				title : '合计(元)',
				align : 'center',
				field : 'total',
				formatter : function(val, raw, index) {
					if (raw) {
						var total = 0;
						var salePrice = raw.salePrice;
						var scheduleNum = raw.scheduleNum;
						var acceptNum = raw.acceptNum;

						if (acceptNum > 0) {
							total = acceptNum * salePrice;
						} else {
							total = scheduleNum * salePrice;
						}
						return total;
					}
				}
			} ] ],
			toolbar : '#toolbar'
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,collapsed:false"
		style="overflow: hidden; width: 700px; border: none">
		<table class="grid" style="border: none"
			data-options="fit:true,border:false">
			<tr>
				<th width="40">订货单位:</th>
				<td width="120"><input name="name"
					style="width: 100%; height: 100%; border: none;" type="text"
					value="${order.customer.companyName}"
					class="easyui-validatebox span2" readonly="readonly" /><input
					type="hidden" name="id" id="order_id" value="${order.id}"></td>
				
				<th width="60">订单时间:</th>
				<td width="260"><input type="text" readonly="readonly"
					class="easyui-validatebox span2" id="seDt"
					style="width: 98%; height: 100%; border: none"
					value="${order.orderDt}" /></td>
				
				<th width="60">送达时间:</th>
				<td width="260"><input type="text" readonly="readonly"
					class="easyui-validatebox span2" id="seDt"
					style="width: 98%; height: 100%; border: none"
					value="${order.arrivedDt}" /></td>
			</tr>
			<tr>
				<th width="60">客服电话:</th>
				<td align="center" width="100"><input
					style="width: 100%; height: 100%; border: none" type="text"
					value="${order.customer.servicePhone}"
					class="easyui-validatebox span2" readonly="readonly" /></td>

				<th width="40">传真:</th>
				<td width="100"><input
					style="width: 100%; height: 100%; border: none" type="text"
					value="${order.customer.fax}" class="easyui-validatebox span2"
					readonly="readonly" /></td>
					
				<th width="40">品质投诉:</th>
				<td width="100"><input
					style="width: 100%; height: 100%; border: none" type="text"
					value="${order.complaintTel}" class="easyui-validatebox span2"
					readonly="readonly" /></td>
			</tr>
		</table>
		<br />
		<table id="dataGrid2" data-options="fit:true,border:false"
			style="margin-top: 225px"></table>
	</div>

</div>