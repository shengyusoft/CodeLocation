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
<title>项目报名登记</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		init();
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectRegister/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				checkbox : true,
				field : 'id',
				width : '30',
			}, {
				width : '120',
				title : '文件名',
				sortable : true,
				align : 'center',
				field : 'fileName'
			},{
				width : '120',
				title : '区域代码',
				sortable : true,
				align : 'center',
				field : 'fillAreaCode'
			},{
				width : '120',
				title : '加气站代码',
				sortable : true,
				align : 'center',
				field : 'fillDeptCode'
			},
			{
				width : '120',
				title : '充装人员代码',
				sortable : true,
				align : 'center',
				field : 'fillPsnlCode'
			},{
				width : '120',
				title : '电子标签编码',
				sortable : true,
				align : 'center',
				field : 'labelUid'
			},{
				width : '120',
				title : '加气枪号',
				sortable : true,
				align : 'center',
				field : 'fillGunNum'
			},{
				width : '120',
				title : '车牌号',
				align : 'center',
				field : 'vehicle',
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '';
					} else {
						var href="<a href='#' onClick='detailVehicle(\""+ value.carnumber+"\")'>"+value.carnumber+"</a>";
						return href;
					}
				}
			}, {
				width : '120',
				title : '加气站',
				sortable : true,
				align : 'center',
				field : 'station',
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '';
					} else {
						var href="<a href='#' onClick='detailStation("+ value.id+")'>"+value.name+"</a>";
						return href;
					}
				}
			},{
				width : '200',
				title : '加气时间',
				align : 'center',
				field : 'fillDateTime'
			}, {
				width : '140',
				title : '加气用时',
				align : 'center',
				field : 'fillTimes'
			},{
				width : '120',
				title : '加气方量',
				sortable : true,
				align : 'center',
				field : 'fillAmount'
			},{
				width : '120',
				title : 'POS机编码',
				sortable : true,
				align : 'center',
				field : 'fillPosUid'
			} ] ],

			toolbar : '#toolbar'
		});

	});
	
	//必要的初始化
	function init(){
		$('#stationId').combobox({
			url : "${pageContext.request.contextPath}/station/combox",
			parentField : 'stationId',
			valueField : 'id',
			textField : 'name',
			panelHeight : 'auto'
		});
	}
	
	//车辆详情
	function detailVehicle(carNum) {
		parent.$.modalDialog({
			title : '车辆详情',
			width : '870',
			height : '560',
			href : '${ctx}/vehicle/detailPage?carNum=' + carNum,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
	
	//加气站详情
	function detailStation(id) {
		parent.$.modalDialog({
			title : '加气站详情',
			width : '870',
			height : '560',
			href : '${ctx}/station/detailPage?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		
		queryParams.name = "";
		var carOwer = $('#carOwer').val();
		var carNum = $('#carNum').val();
		var stationId = $('#stationId').combobox('getValue');
		var st = $('#st').val();
		var et = $('#et').val();
		var minAmount = $('#minAmount').val();
		var maxAmount = $('#maxAmount').val();
		
		queryParams['vehicle.driver'] = carOwer;
		queryParams['vehicle.carnumber'] = carNum;
		queryParams['station.id'] = stationId==null?'':stationId;
		queryParams.searchStartDt = st;
		queryParams.searchEndDt = et;
		queryParams.searchAmountLow = isEmpty(minAmount)?-1:minAmount;
		queryParams.searchAmountHigh = isEmpty(maxAmount)?-1:maxAmount;
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#carOwer').val('');
		$('#carNum').val('');
		$('#st').val('');
		$('#et').val('');
		$('#minAmount').val('');
		$('#maxAmount').val('');
		$('#stationId').combobox('clear');
	}


	function detailFun() {
		var id = null;
		var str1 = null;
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
		str1 = rows[0].fillDeptCode 
		
		parent.$.modalDialog({
			title : '加气详情',
			width : '815',
			height : '500',
			href : '${ctx}/projectRegister/detailPage?id=' + id+'&fillDeptCode='+str1,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: true">

		<a onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">搜索 </a>
		<a onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">清空 </a>

		<a onclick="detailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			

		<c:if test="${fn:contains(sessionInfo.resourceList, '/projectRegister/search')}">
			<table>
				<tr>
					
					<th>车牌号:</th>
					<td><input type="text" id="carNum"> </td>
					<th>加气站:</th>
					<td>
						<select id="stationId" name="stationId" style="width:120px" 
						class="easyui-validatebox span2"></select>
					</td>
				</tr>	
				<tr>
					<th>加气时间段:</th>
					<td>
						<input class="Wdate" type="text" name="st" id="st"
						style="height: 100%" onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /> - 
						<input class="Wdate" type="text" name="et" id="et" style="height: 100%"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /> 
					</td>
					
					<!--<td rowspan="2">
						<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton"
							data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
					
						<a onclick="clearFun();" href="javascript:void(0);"class="easyui-linkbutton"
							data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
					</td>-->
				
					<th>加气量区间:</th>
					<td colspan="2">
						<input type="number" id="minAmount" min="0"> - 
						<input type="number" id="maxAmount" min="0"> 
					</td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>