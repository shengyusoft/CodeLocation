<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid2;
	//load the purchaseBalance details
	$(function() {
		loadpurchaseBalanceDetails();
	});

	function loadpurchaseBalanceDetails() {
		var purchaseBalanceId = $('#purchaseBalance_id').val();
		if (isEmpty(purchaseBalanceId)) {
			purchaseBalanceId = 0;
		}
		dataGrid2 = $('#dataGrid2').datagrid({
			url : ctxPath + '/purchaseBalanceDetail/dataGrid',
			striped : true,
			rownumbers : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortpurchaseBalance : 'asc',
			queryParams : {
				'purchaseBalance.id' : purchaseBalanceId
			},
			columns : [ [ {
				width : '120',
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
				width : '80',
				title : '预定数量',
				align : 'center',
				field : 'scheduleNum'
			}, {
				width : '80',
				title : '实际数量',
				align : 'center',
				field : 'acceptNum'
			}, {
				width : '80',
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
				width : '80',
				title : '合计(元)',
				align : 'center',
				field : 'total',
				formatter : function(val, raw, index) {
					if (raw) {
						var total = 0;
						var salePrice = raw.goods.price;
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
			}, {
				width : '80',
				title : '核定单价',
				align : 'center',
				field : 'decidePrice'
			}, {
				width : '80',
				title : '采购差价',
				align : 'center',
				field : 'decidePrice1',
				formatter : function(val, raw, index) {
					if (raw) {
						var res = 0;
						var price1 = raw.goods.price;
						var price2 = raw.decidePrice;
						res = price1 - price2;
						return res;
					}
				}
			}, {
				width : '100',
				title : '备注',
				align : 'center',
				field : 'remark'
			} ] ],
			toolbar : '#toolbar'
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,bpurchaseBalance:false">
	<div data-options="region:'center',fit:true,collapsed:false"
		style="overflow: hidden; width: 700px; bpurchaseBalance: none">
		<table class="grid" style="bpurchaseBalance: none"
			data-options="fit:true,bpurchaseBalance:false">
			<tr>
				<th width="40">订货单位:</th>
				<td width="120"><input name="name"
					style="width: 100%; height: 100%; bpurchaseBalance: none;" type="text"
					value="${purchaseBalance.customer.companyName}"
					class="easyui-validatebox span2" readonly="readonly" /><input
					type="hidden" name="id" id="purchaseBalance_id"
					value="${purchaseBalance.id}"></td>

				<th width="60">结算时间:</th>
				<td width="260"><input type="text" readonly="readonly"
					class="easyui-validatebox span2" id="seDt"
					style="width: 98%; height: 100%; bpurchaseBalance: none"
					value="${purchaseBalance.balanceDt}" /></td>
			</tr>
		</table>
		<br />
		<table id="dataGrid2" data-options="fit:true,border:false"
			style="margin-top: 225px"></table>
	</div>

</div>