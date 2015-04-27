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
		$('#purchasePlanAddForm').form({
			url : '${pageContext.request.contextPath}/purchasePlan/add',
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
					$('#purchasePlan_id').val(id);
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.messager.alert('提示', result.msg);
					$('#qsave').linkbutton('disable');
					var d1 = $('#goodsDiv');
					var d1s = d1.attr('style');
					d1.attr('style', d1s.replace('display: none;', ''));

					var d2 = $('#purchasePlanDiv');
					var d2s = d2.attr('style');
					d2.attr('style', d2s.replace('display: none;', ''));
					
					var d3 = $('#doDiv');
					var d3s = d3.attr('style');
					d3.attr('style', d3s.replace('display: none;', ''));
					
					loadGoods();
					loadpurchasePlans();
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
			var purchasePlanId = $('#purchasePlan_id').val();
			if (isEmpty(purchasePlanId)) {
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
					$.post('${ctx}/purchasePlan/batchAdd', {
						'ids' : selected,
						'purchasePlanId' : purchasePlanId
					}, function(result) {
						if (result.success) {
							parent.$.messager.alert('提示', "导入成功", 'info');
							//加载报价单
							loadpurchasePlans();
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
			sortpurchasePlan : 'asc',
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
	function loadpurchasePlans() {
		var purchasePlanId = $('#purchasePlan_id').val();
		if(isEmpty(purchasePlanId)){
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
			frozenColumns : [ [{
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
				title : '采购价',
				align : 'center',
				field : 'goods.price',
				formatter : function(val, raw, index) {
					if (raw) {
						var goods = raw.goods;
						return goods.price;
					}
				}
			}, {
				width : '60',
				title : '预定数量',
				align : 'center',
				field : 'scheduleNum'
			}, {
				width : '60',
				title : '实收数量',
				align : 'center',
				field : 'acceptNum'
			}, {
				width : '60',
				title : '备注',
				align : 'center',
				field : 'remark'
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
	
	function editFun(id) {
		if (id) {
			parent.$
					.modalDialog_1({
						title : '编辑订单',
						width : '400',
						height : '220',
						href : '${ctx}/purchasePlanDetail/editPage?id=' + id,
						buttons : [
								{
									text : '编辑',
									handler : function() {
										//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
										parent.$.modalDialog.openner_dataGrid = dataGrid2;
										var f = parent.$.modalDialog.handler
												.find('#purchasePlanDetailEditForm');
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
				$.post('${ctx}/purchasePlanDetail/delete', {
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
<div class="easyui-layout" data-options="fit:true,bpurchasePlan:false">
	<div data-options="region:'north'" title="报价单基本信息"
		style="width: 900px; height: 70px"
		data-options="fit:true,bpurchasePlan:false">
		<form id="purchasePlanAddForm" method="post"
			style="width: 900px; height: 20px;">
			<table class="grid">
				<tr>
					<th>客户&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="customer" name="customer.id"
						class="easyui-validatebox span2" style="width: 280px;"
						data-options="required:true">
					</select> <input type="hidden" name="id" id="purchasePlan_id"
						value="${purchasePlan.id}"></td>
				</tr>
			</table>
		</form>
	</div>
	<div id="goodsDiv" data-options="region:'west'" title="商品信息"
		style="width: 500px; display: none"
		data-options="fit:true,border:false">
		<table id="dataGrid1" data-options="fit:true,border:false"></table>
	</div>

	<div id="doDiv" data-options="region:'center'" title="操作"
		style="width: 70px; padding: 1px; text-align: center;display: none">
		<div
			style="vertical-align: middle; text-align: center; margin-top: 160px">
			<button onclick="batchAdd()">导入</button>
		</div>
	</div>

	<div id="purchasePlanDiv"
		data-options="region:'east',fit:true,collapsed:false" title="订单详情"
		style="overflow: hidden; width: 500px; display: none">
		<table id="dataGrid2" data-options="fit:true,border:false"></table>
	</div>

</div>