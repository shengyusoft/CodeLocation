<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>报销管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/reimbursement/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : false,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			queryParams:{
	        	type : 0
	        },
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [

			{
				checkbox : true,
				field : 'id',
				width : '30',
				rowspan : 2
			}, {
				width : '150',
				title : '申请人',
				rowspan : 2,
				align : 'center',
				field : 'process_vo1',
				formatter : function(value, row, index) {
					return isEmpty(row.process_vo)?'':row.process_vo.applyUserName;
				}
			}, {
				width : '150',
				title : '时间范围',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'startDT',
				formatter : function(value, row, index) {
					var st = formatDate(row.startDT);
					var et = formatDate(row.endDT);
					return st + "--" + et;
				}
			}, {
				width : '140',
				title : '地点',
				rowspan : 2,
				align : 'center',
				field : 'place'
			}, {
				width : '130',
				title : '工作',
				rowspan : 2,
				align : 'center',
				field : 'workDetail'
			}, {
				width : '150',
				title : '费用明细',
				rowspan : 2,
				align : 'center',
				field : 'costDetail'
			}, {
				width : '120',
				title : '状态',
				rowspan : 2,
				align : 'center',
				field : 'process_vo',
				formatter : function(value, row, index) {
					if (value != null) {
						switch (value.state) {
						case 0:
							return '初始化';
						case 1:
							return '<font color="green">已申请</font>';
						case 2:
							return '<font color="green">会计审批通过</font>';
						case 3:
							return '<font color="green">总经理审批通过</font>';
						case 4:
							return '<font color="green">【财务出纳成功】</font>';
						case -2:
							return '<font color="red">【会计审核退回】</font>';
						case -3:
							return '<font color="red">【总经理审核退回】</font>';
						}
					}
				}
			} ] ],

			columns : [ [{
				title : '费用小计',
				colspan : 12
			}],[ {
				width : '100',
				title : '交通费（元）',
				align : 'center',
				field : 'trafficFee'
			}, {
				width : '100',
				title : '就餐费（元）',
				align : 'center',
				field : 'mealFee'
			}, {
				width : '100',
				title : '办公费（元）',
				align : 'center',
				field : 'officeFee'
			}, {
				width : '100',
				title : '招待费（元）',
				align : 'center',
				field : 'receiveFee'
			}, {
				width : '100',
				title : '刻章费（元）',
				align : 'center',
				field : 'badgeFee'
			}, {
				width : '100',
				title : '通讯费（元）',
				align : 'center',
				field : 'communicationFee'
			}, {
				width : '100',
				title : '物品购置费（元）',
				align : 'center',
				field : 'trainFee'
			}, {
				width : '100',
				title : '文印费（元）',
				sum : true,
				align : 'center',
				field : 'wyFee'
			}, {
				width : '100',
				title : '制证费（元）',
				sum : true,
				align : 'center',
				field : 'zzFee'
			}, {
				width : '100',
				title : '住宿费（元）',
				sum : true,
				align : 'center',
				field : 'zsFee'
			}, {
				width : '100',
				title : '快递费（元）',
				sum : true,
				align : 'center',
				field : 'kdFee'
			}, {
				width : '100',
				title : '其他费（元）',
				align : 'center',
				field : 'otherFee'
			}, {
				width : '100',
				title : '合计（元）',
				align : 'center',
				field : 'total',
			}  ] ],

			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.place = "";
		queryParams.startDT = "";
		queryParams.endDT = "";
		queryParams['process_vo.applyUserName'] = "";

		var name = $('#place').val();
		var startDT = $('#startDT').val();
		var endDT = $('#endDT').val();
		var applyUserName = $('#applyUserName').val();
		
		if (!isEmpty(name)) {
			queryParams.place = name;
		}
		if (!isEmpty(applyUserName)) {
			queryParams['process_vo.applyUserName'] = applyUserName;
		}
		
		if(!isEmpty(startDT)){
			queryParams.startDT = startDT;
		}
		
		if(!isEmpty(endDT)){
			queryParams.endDT = endDT;
		}
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#place').val('');
		$('#applyUserName').val('');
		$('#startDT').val('');
		$('#endDT').val('');
	}

	function addFun() {
		parent.$
				.modalDialog({
					title : '报销申请',
					width : '900',
					height : '500',
					resizable : true,
					href : '${ctx}/reimbursement/addPage',
					buttons : [
							{
								text : '保存',
								handler : function() {
									//传入后台区分是保存还是申请
									parent.$.modalDialog.openner_dataGrid = dataGrid;
									parent.$.modalDialog.handler
											.find('#option').val(0);
									parent.$.modalDialog.type = 0;
									var f = parent.$.modalDialog.handler
											.find('#reimbursementAddForm');
									f.submit();
								}
							},
							{
								text : '申请',
								handler : function() {
									parent.$.modalDialog.openner_dataGrid = dataGrid;
									parent.$.modalDialog.handler
											.find('#option').val(1);
									var f = parent.$.modalDialog.handler
											.find('#reimbursementAddForm');
									parent.$.modalDialog.type = 1;
									f.submit();
								}
							},
							{
								text : '退出',
								handler : function() {
									parent.$.modalDialog.handler
											.dialog('close');
								}
							} ]
				});
	}

	function deleteFun() {
		var selected = getSelected();
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/reimbursement/delete', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						removeSelectedRow(dataGrid);
						dataGrid.datagrid('reload');
					} else {
						parent.$.messager.alert('警告', result.msg, 'warning');
					}

					progressClose();
				}, 'JSON');
			}
		});
	}

	function editFun() {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('提示', '没有可编辑对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('提示', '只能对一条记录编辑!');
			return;
		}

		id = rows[0].id;
		var state = rows[0].process_vo.state;
		if (!isEmpty(state) && state > 0) {
			parent.$.messager.alert('提示', '申请已提交，不可编辑!');
			return;
		}

		parent.$
				.modalDialog({
					title : '编辑报销单',
					width : '900',
					height : '500',
					href : '${ctx}/reimbursement/editPage?id=' + id,
					buttons : [
							{
								text : '编辑',
								handler : function() {
									//传入后台区分是保存还是申请
									parent.$.modalDialog.openner_dataGrid = dataGrid;
									parent.$.modalDialog.handler
											.find('#option').val(2);
									var f = parent.$.modalDialog.handler
											.find('#reimbursementEditForm');
									f.submit();
								}
							},
							{
								text : '申请',
								handler : function() {
									parent.$.modalDialog.openner_dataGrid = dataGrid;
									parent.$.modalDialog.handler
											.find('#option').val(1);
									var f = parent.$.modalDialog.handler
											.find('#reimbursementEditForm');
									parent.$.modalDialog.type = 1;
									f.submit();
								}
							},
							{
								text : '退出',
								handler : function() {
									parent.$.modalDialog.handler
											.dialog('close');
								}
							} ]
				});
	}
	
	function auditFun(id, state) {
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有审核对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能审核一条记录!');
			return;
		}

		id = rows[0].process_vo.id;
		
		parent.$.modalDialog({
			title : '报销审批',
			width : '900',
			height : '500',
			resizable : true,
			href : ctxPath+'/reimbursement/handlerPage?id='+id,
			buttons : [
					{
						text : '通过',
						handler : function() {
							var f = parent.$.modalDialog.handler
									.find('#processForm');
							parent.$.modalDialog.openner_dataGrid = dataGrid;
							parent.$.modalDialog.handler.find('#option').val(0);
							f.submit();
						}
					},{
						text : '退回',
						handler : function() {
							var f = parent.$.modalDialog.handler
									.find('#processForm');
							parent.$.modalDialog.openner_dataGrid = dataGrid;
							parent.$.modalDialog.handler.find('#option').val(1);
							f.submit();
						}
					}, {
						text : '退出',
						handler : function() {
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});

	}

	function detailFun() {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有可查看对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能查看一条记录!');
			return;
		}

		id = rows[0].id;
		parent.$.modalDialog({
			title : '报销流程详情',
			autoScroll : true,
			width : document.body.clientWidth * 0.7,
			height : document.body.clientHeight * 0.9,
			href : '${ctx}/reimbursement/detailPage?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
	
	//申请详情
	function detail2Fun() {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有可查看对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能查看一条记录!');
			return;
		}

		id = rows[0].id;
		parent.$.modalDialog({
			title : '报销申请详情',
			autoScroll : true,
			width : '900',
			height : '500',
			href : '${ctx}/reimbursement/detailPage2?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
	
	function printFun(type) {
		var startDT = $('#startDT').val();
		var endDT = $('#endDT').val();
		var applier = $('#applyUserName').val();
		var place = $('#place').val();
		var url = ctxPath + "/report/reimbursement?type="+type+"&&startDT="+startDT+"&&endDT="+endDT+"&&applier="+applier+"&&place="+place;
		if(type == 0){
			var tmp = window.open (url,'newwindow','width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-30)+ ',top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
			tmp.focus();
		}else{
			var tmp = window.open(url);
			tmp.focus();
		}
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: true">

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/add')}">
				<a onclick="addFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add'">添加 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font
					color="gray">添加</font> </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/edit')}">
				<a onclick="editFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit'">编辑</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit_disabled'"><font
					color="gray">编辑</font> </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/delete')}">
				<a onclick="deleteFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del'">删除 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del_disabled'"><font
					color="gray">删除</font> </a>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/detail2')}">
				<a onclick="detail2Fun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">申请详情</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">申请详情</font> </a>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/detail')}">
				<a onclick="detailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">查看流程</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">查看流程</font> </a>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/handlerPage')}">
				<a onclick="auditFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit'">审核 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit_disabled'"><font
					color="gray">审核</font> </a>
			</c:otherwise>
		</c:choose>

		<a onclick="printFun(0);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览</a> <a
			onclick="printFun(1);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/reimbursement/search')}">
			<table>
				<tr>
					<th>地点:</th>
					<td><input type="text" id="place"></td>
					<th>申请人:</th>
					<td><input type="text" id="applyUserName"></td>
					<th>时间范围:</th>
					<td><input class="Wdate" data-options="required:true"
						type="text" name="startDT" id="startDT"
						style="width: 150px;"
						onfocus="showStart('yyyy-MM-dd')" /> <input class="Wdate"
						data-options="required:true" type="text" name="endDT" id="endDT"
						style="width: 150px;" onfocus="showEnd('yyyy-MM-dd')" />
					</td>
					<td><a onclick="searchFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
						onclick="clearFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a></td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>