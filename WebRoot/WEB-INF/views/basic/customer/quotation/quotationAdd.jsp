<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid1;
	var dataGrid2;
	$(function() {
		$('#quotationAddForm').form({
			url : '${pageContext.request.contextPath}/quotation/add',
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
					parent.$.modalDialog.openner_dataGrid.load();
					var id = result.obj.id;
					$('#quotation_id').val(id);
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.messager.alert('提示', result.msg);
					$('#qsave').linkbutton('disable');
					var d1 = $('#goodsDiv');
					var d1s = d1.attr('style');
					d1.attr('style', d1s.replace('display: none;', ''));

					var d2 = $('#quotationDiv');
					var d2s = d2.attr('style');
					d2.attr('style', d2s.replace('display: none;', ''));
					
					var d3 = $('#doDiv');
					var d3s = d3.attr('style');
					d3.attr('style', d3s.replace('display: none;', ''));
					loadGoods();
					loadQuotations();
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});

	//加载客户信息
	$('#customer').combobox({
		url : "${pageContext.request.contextPath}/customer/combox",
		parentField : 'customer',
		valueField : 'id',
		textField : 'companyName',
		panelHeight : 'auto'
	});

	function batchAdd() {
		if (dataGrid1) {
			var selected = getSelecteds(dataGrid1);
			var quotationId = $('#quotation_id').val();
			if (isEmpty(quotationId)) {
				parent.$.messager.alert('警告', '报价单基本信息没有录入，请保存基本信息');
				return;
			}

			if (isEmpty(selected)) {
				parent.$.messager.alert('警告', '至少选中一条记录!');
				return;
			}
			parent.$.messager.confirm('询问', '确认导入选中的记录吗？', function(b) {
				if (b) {
					progressLoad();
					$.post('${ctx}/quotation/batchAdd', {
						'ids' : selected,
						'quotationId' : quotationId
					}, function(result) {
						if (result.success) {
							parent.$.messager.alert('提示', result.msg, 'info');
							//加载报价单
							loadQuotations();
						} else {
							parent.$.messager
									.alert('警告', result.msg, 'warning');
						}

						progressClose();
					}, 'JSON');
				}
			});

		}
	}

	function loadGoods() {
		dataGrid1 = $('#dataGrid1').datagrid({
			url : ctxPath + '/goods/dataGrid',
			striped : true,
			rownumbers : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			columns : [ [

			{
				checkbox : true,
				field : 'id',
				width : '30',
			}, {
				width : '80',
				title : '商品种类',
				align : 'center',
				field : 'typeText'
			}, {
				width : '80',
				title : '商品名称',
				align : 'center',
				field : 'name'
			}, {
				width : '60',
				title : '单位',
				sortable : true,
				align : 'center',
				field : 'unit'
			}, {
				width : '60',
				title : '规格',
				align : 'center',
				field : 'standard'
			}, {
				width : '60',
				title : '采购价',
				sortable : true,
				align : 'center',
				field : 'price',
				editor : {
					type : 'numberbox',
					options : {
						precision : 1
					}
				}
			}, {
				width : '60',
				title : '备注',
				align : 'center',
				field : 'remark'
			} ] ],
			groupField : 'typeText',
			view : groupview,
			groupFormatter : function(value, rows) {
				return value + ' - ' + rows.length + ' Item(s)';
			},
			toolbar : '#toolbar'
		});
	}

	function loadQuotations() {
		var quotationId = $('#quotation_id').val();
		if(isEmpty(quotationId)){
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
			frozenColumns : [ [

			{
				checkbox : true,
				field : 'id',
				width : '30',
			}, {
				width : '80',
				title : '种类',
				align : 'center',
				field : 'goods.type',
				formatter : function(val, raw, index) {
					if (raw) {
						var goods = raw.goods;
						return goods.type.text;
					}
				}
			}, {
				width : '80',
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
				width : '60',
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
				width : '60',
				title : '报价',
				align : 'center',
				field : 'salePrice'
			}, {
				width : '60',
				title : '订价',
				align : 'center',
				field : 'goods.order',
				formatter : function(val, raw, index) {
					if (raw) {
						var goods = raw.goods;
						return goods.orderPrice1;
					}
				}
			}, {
				field : 'action',
				title : '操作',
				width : 80,
				formatter : function(value, row, index) {
					var str = '&nbsp;';
					str += $.formatString(
									'<a href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a>',
									row.id);
					str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
					str += $.formatString(
									'<a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a>',
									row.id);
					return str;
				}
			} ] ],
			toolbar : '#toolbar'
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north'" title="报价单基本信息"
		style="width: 900px; height: 70px"
		data-options="fit:true,border:false">
		<form id="quotationAddForm" method="post"
			style="width: 900px; height: 20px;">
			<table class="grid">
				<tr>
					<th>客户&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="customer" name="customer.id"
						class="easyui-validatebox span2" style="width: 280px;"
						data-options="required:true">
					</select> <input type="hidden" name="id" id="quotation_id"
						value="${qutotation.id}"></td>
					<th>报价有效期限 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="startDt"
						id="startDt" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
					<td><input class="Wdate" type="text" name="endDt" id="endDt"
						style="width: 98%; height: 100%;" data-options="required:true"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="goodsDiv" data-options="region:'west'" title="商品信息"
		style="width: 500px; display: none"
		data-options="fit:true,border:false">
		,
		<table id="dataGrid1" data-options="fit:true,border:false"></table>
	</div>

	<div id="doDiv" data-options="region:'center'" title="操作"
		style="width: 70px; padding: 1px; text-align: center;display: none">
		<div
			style="vertical-align: middle; text-align: center; margin-top: 160px">
			<button onclick="batchAdd()">导入</button>
		</div>
	</div>

	<div id="quotationDiv"
		data-options="region:'east',fit:true,collapsed:false" title="报价单详情"
		style="overflow: hidden; width: 500px; display: none">
		<table id="dataGrid2" data-options="fit:true,border:false"></table>
	</div>

</div>