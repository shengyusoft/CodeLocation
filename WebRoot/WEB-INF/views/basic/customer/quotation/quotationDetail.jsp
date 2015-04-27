<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid2;
	//load the quotation details

	$(function() {
		loadQuotations();
		var st = '${quotation.startDt}';
		st = st.substring(0,st.lastIndexOf(' '));
		var et = '${quotation.endDt}';
		et = et.substring(0,et.lastIndexOf(' '));
		$('#seDt').val(st+' - '+et);
	});

	function loadQuotations() {
		var quotationId = $('#quotation_id').val();
		if (isEmpty(quotationId)) {
			quotationId = 0;
		}
		dataGrid2 = $('#dataGrid2').datagrid({
			url : ctxPath + '/quotationDetail/dataGrid',
			striped : true,
			rownumbers : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			queryParams : {
				'quotation.id' : quotationId
			},
			columns : [ [ {
				width : '120',
				title : '种类',
				align : 'center',
				field : 'goodsTypeText'
			}, {
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
				width : '120',
				title : '单位',
				align : 'center',
				field : 'goods.unit',
				formatter : function(val, raw, index) {
					if (raw) {
						var goods = raw.goods;
						return goods.unit;
					}
				}
			}, {
				width : '120',
				title : '报价',
				align : 'center',
				field : 'salePrice'
			}, {
				width : '120',
				title : '订价',
				align : 'center',
				field : 'goods.order',
				formatter : function(val, raw, index) {
					if (raw) {
						var goods = raw.goods;
						return goods.orderPrice1;
					}
				}
			} ] ],
			groupField : 'goodsTypeText',
			view : groupview,
			groupFormatter : function(value, rows) {
				return value + ' - ' + rows.length + ' Item(s)';
			},
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
				<th width="40">客户:</th>
				<td width="120"><input name="name"
					style="width: 100%; height: 100%; border: none;" type="text"
					value="${quotation.customer.companyName}"
					class="easyui-validatebox span2" readonly="readonly" /><input
					type="hidden" name="id" id="quotation_id" value="${quotation.id}"></td>

				<th width="60">客服电话:</th>
				<td align="center" width="100"><input
					style="width: 100%; height: 100%; border: none" type="text"
					value="${quotation.customer.servicePhone}"
					class="easyui-validatebox span2" readonly="readonly" /></td>

				<th width="40">传真:</th>
				<td width="100"><input
					style="width: 100%; height: 100%; border: none" type="text"
					value="${quotation.customer.fax}" class="easyui-validatebox span2"
					readonly="readonly" /></td>

				<th width="40">日期 :</th>
				<td width="260"><input type="text" readonly="readonly"
					class="easyui-validatebox span2" id="seDt"
					style="width: 98%; height: 100%; border: none"
					value="${quotation.startDt}-${quotation.endDt}" /></td>
			</tr>
		</table>
		<br />
		<table id="dataGrid2" data-options="fit:true,border:false"
			style="margin-top: 225px"></table>
	</div>

</div>