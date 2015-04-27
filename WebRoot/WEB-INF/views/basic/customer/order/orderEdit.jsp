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
	loadGoods();
	loadOrders();
	$(function() {
		$('#orderEditForm').form({
			url : '${pageContext.request.contextPath}/order/edit',
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
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.messager.alert('提示', result.msg);
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
	
	////判断checkbox的check状态
	var sign = '${order.sign}';
	if(sign){
		$('#sign')[0].checked = true;
	}else{
		$('#sign')[0].checked = false;
	}

	//加载客户信息
	$('#customer').combobox({
		url : "${pageContext.request.contextPath}/customer/combox",
		parentField : 'customer',
		valueField : 'id',
		value : '${order.customer.id}',
		textField : 'companyName',
		panelHeight : 'auto'
	});

	function batchAdd() {
		if (dataGrid1) {
			var selected = getSelecteds(dataGrid1);
			var orderId = $('#order_id').val();
			if (isEmpty(orderId)) {
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
					$.post('${ctx}/order/batchAdd', {
						'ids' : selected,
						'orderId' : orderId
					}, function(result) {
						if (result.success) {
							parent.$.messager.alert('提示', "导入成功", 'info');
							//加载报价单
							loadOrders();
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

	//加载商品列表	
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

	//加载订单列表	
	function loadOrders() {
		var orderId = $('#order_id').val();
		if (isEmpty(orderId)) {
			orderId = 0;
		}
		dataGrid2 = $('#dataGrid2')
				.datagrid(
						{
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
							frozenColumns : [ [
									{
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
									},
									{
										width : '60',
										title : '单价',
										align : 'center',
										field : 'salePrice'
									},
									{
										width : '60',
										title : '预定数量',
										align : 'center',
										field : 'scheduleNum'
									},
									{
										width : '60',
										title : '实收数量',
										align : 'center',
										field : 'acceptNum'
									},
									{
										width : '60',
										title : '备注',
										align : 'center',
										field : 'remark'
									},
									{
										field : 'action',
										title : '操作',
										width : 80,
										formatter : function(value, row, index) {
											var str = '&nbsp;';
											str += $
													.formatString(
															'<a href="javascript:void(0)" onclick="editFun(\'{0}\');" >编辑</a>',
															row.id);
											str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
											str += $
													.formatString(
															'<a href="javascript:void(0)" onclick="deleteFun(\'{0}\');" >删除</a>',
															row.id);
											return str;
										}
									} ] ],
							toolbar : '#toolbar'
						});
	}

	function editFun(id) {
		if (id) {
			parent.$
					.modalDialog_1({
						title : '编辑订单',
						width : '400',
						height : '220',
						href : '${ctx}/orderDetail/editPage?id=' + id,
						buttons : [
								{
									text : '编辑',
									handler : function() {
										//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
										parent.$.modalDialog.openner_dataGrid = dataGrid2;
										var f = parent.$.modalDialog.handler
												.find('#orderDetailEditForm');
										f.submit();
									}
								},
								{
									text : '关闭',
									handler : function() {
										parent.$.modalDialog.handler
												.dialog('close');
										dataGrid.datagrid('reload');
									}
								} ]
					});
		}
	}

	function deleteFun(id) {
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/orderDetail/delete', {
					ids : id
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						removeSelectedRow(dataGrid2);
						dataGrid2.datagrid('reload');
					} else {
						parent.$.messager.alert('警告', result.msg, 'warning');
					}

					progressClose();
				}, 'JSON');
			}
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north'" style="width: 900px; height: 75px"
		data-options="fit:true,border:false">
		<form id="orderEditForm" method="post"
			style="width: 900px; height: 50px;">
			<table class="grid">
				<tr>
					<th>客户&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="customer" name="customer.id"
						class="easyui-validatebox span2" style="width: 280px;"
						data-options="required:true">
					</select> <input type="hidden" name="id" id="order_id" value="${order.id}"></td>

					<th>投诉电话</th>
					<td><input type="text" name="complaintTel"
						value="${order.complaintTel}" id="complaintTel"
						style="width: 98%; height: 100%;" /></td>
				</tr>

				<tr>
					<th>订单送达时间</th>
					<td colspan="3"><input class="Wdate" type="text"
						name="arrivedDt" id="arrivedDt" style="width: 98%; height: 100%"
						value="${order.arrivedDt}"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>

					<th>订单状态</th>
					<td><label> <input type="checkbox" name="sign" id="sign"
							value="1" /> 已经签收
					</label></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="goodsDiv" data-options="region:'west'" title="商品信息"
		style="width: 500px;" data-options="fit:true,border:false">
		<table id="dataGrid1" data-options="fit:true,border:false"></table>
	</div>

	<div id="doDiv" data-options="region:'center'" title="操作"
		style="width: 70px; padding: 1px; text-align: center;">
		<div
			style="vertical-align: middle; text-align: center; margin-top: 160px">
			<button onclick="batchAdd()">导入</button>
		</div>
	</div>

	<div id="orderDiv"
		data-options="region:'east',fit:true,collapsed:false" title="报价单详情"
		style="overflow: hidden; width: 500px;">
		<table id="dataGrid2" data-options="fit:true,border:false"></table>
	</div>

</div>