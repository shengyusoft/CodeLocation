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
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-statistics.js"
	charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>项目中标登记</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		init();
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectBid/dataGrid',
			striped : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			showFooter : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,400, 500 ],
			columns : [ [
					{
						checkbox : true,
						field : 'id',
						width : '30',
					},
					{
						title : '序号',
						field : 'index',
						align : 'center',
						width : '40',
						formatter : function(val, row, index) {
							if(isEmpty(val)){
        						return index + 1;																																																																			
        					}else{
        						return val;
        					}
						}
					},
					{
						width : '60',
						title : '公司名称',
						align : 'center',
						field : 'company',
						formatter : function(value, row, index) {
							return isEmpty(value) ? ''
									: value.text;
						}
					},
					{
						width : '400',
						title : '项目名称',
						sortable : true,
						align : 'center',
						field : 'projectName'
					},
					{
						width : '100',
						title : '状态',
						sortable : true,
						align : 'center',
						field : 'state',
						formatter : function(val){
							if(val == 0){
								return '正常上报';
							}else if(val == 1){
								return '<font color="red">过期申请上报</font>';
							}else if(val == 2){
								return '<font color="green">审批通过</font>';
							}
						}
					},
					{
						width : '130',
						title : '项目地点',
						sortable : true,
						align : 'center',
						field : 'county',
						formatter : function(value, row, index) {
							var place = '';
							if(row == null || isEmpty(row.id)){
								return '';
							}
							if (!isEmpty(row.county)&& !isEmpty(row.county.description)) {
								place = row.county.description;
							} else {
								place = row.provice + row.city+ row.county;
							}
							return place;
						}
					},
					{
						width : '120',
						title : '标段',
						align : 'center',
						field : 'bdNames'
					},
					{
						width : '60',
						title : '项目经理',
						sortable : true,
						align : 'center',
						field : 'projectMgr',
						formatter : function(value, row, index) {
							return isEmpty(value) ? '': value.text;
						}
					},
					{
						width : '75',
						title : '技术负责人',
						sortable : true,
						align : 'center',
						field : 'techniqueMgr',
						formatter : function(value, row, index) {
							return isEmpty(value) ? '': value.text;
						}
					}, {
						width : '75',
						title : '中标时间',
						sortable : true,
						align : 'center',
						field : 'bidDt',
						formatter : Common.formatter
					}, {
						width : '85',
						title : '合同签订时间',
						align : 'center',
						field : 'signDt',
						formatter : Common.formatter
					}, {
						width : '85',
						title : '工期结束时间',
						align : 'center',
						field : 'duration',
						formatter : Common.formatter
					}, {
						width : '120',
						title : '中标价(元)',
						sum : true,
						align : 'center',
						field : 'bid_cost',
						formatter : function(val,row,index){
							debugger;
							if(row != null && row.state == 1){
								return '';
							}else{
								return val;
							}
						}
					}, {
						width : '90',
						title : '管理费比例(%)',
						align : 'center',
						field : 'manageFeeRate',
						formatter : function(val,row,index){
							if(row != null && row.state == 1){
								return '';
							}else{
								return val;
							}
							
						}
					}, {
						width : '100',
						title : '管理费(元)',
						align : 'center',
						field : 'manageFee',
						formatter : function(val,row,index){
							if(row != null && row.state == 1){
								return '';
							}else{
								return val;
							}
						}
					}, {
						width : '75',
						title : '施工负责人',
						sortable : true,
						align : 'center',
						field : 'headman',
						formatter : function(val,row,index){
							if(row != null && row.state == 1){
								return '';
							}else{
								return val;
							}
						}
					}, {
						width : '95',
						title : '联系电话',
						sortable : true,
						align : 'center',
						field : 'tel',
						formatter : function(val,row,index){
							if(row != null && row.state == 1){
								return '';
							}else{
								return val;
							}
						}
					}, {
						width : '50',
						title : '登记人',
						sortable : true,
						align : 'center',
						field : 'recordman'
					} ] ],
			onLoadSuccess:function(){
			    //$('#dataGrid').datagrid('statistics');
			    var footerObj = new Array();
			    var obj = {bid_cost: "${totalBidCost}", index: "<b>合计:</b>"};
			   	footerObj.push(obj);
			   	if(footerObj.length > 0){
					$('#dataGrid').datagrid('reloadFooter',footerObj);
				}
			},
			toolbar : '#toolbar'
		});	
	});

	//必要的初始化
	function init() {
		$('#provice').combobox({
			url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=&&lvs=" + 2,
			parentField : 'pid',
			valueField : 'id',
			textField : 'text',
			panelHeight : 300,
			editable : false,//不可编辑，只能选择
			onChange : function(provice) {
				$('#city').combobox({
					url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+ provice+ "&&lvs=3",
					valueField : 'id', //值字段
					textField : 'text', //显示的字段
					panelHeight : 300,
					editable : false,//不可编辑，只能选择
					onChange : function(city, n) {
						$('#county').combobox({
							url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+ city+ "&&lvs=4",
							valueField : 'id', //值字段
							textField : 'text', //显示的字段
							panelHeight : 300,
							editable : false
						});				
					}
				});				
			}
		});				

		$('#city').combobox({
			//url : "${pageContext.request.contextPath}/dictionary/xzqhCombox",
			valueField : 'id', //值字段
			textField : 'text', //显示的字段
			panelHeight : 300,
			editable : false
		});

		$('#county').combobox({
			//url : "${pageContext.request.contextPath}/dictionary/xzqhCombox",
			valueField : 'id', //值字段
			textField : 'text', //显示的字段
			panelHeight : 'auto',
			editable : false
		});
	}

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.projectName = "";
		queryParams.companyName = "";
		queryParams.st = "";
		queryParams.et = "";
		queryParams['provice.id'] = -1;
		queryParams['city.id'] = -1;
		queryParams['county.id'] = -1;

		var projectName = $('#projectName').val();
		var companyName = $('#companyName').val();
		var st = $('#st').val();
		var et = $('#et').val();
		var provice = $('#provice').combobox('getValue');
		var city = $('#city').combobox('getValue');
		var county = $('#county').combobox('getValue');

		queryParams.projectName = isEmpty(projectName) ? "" : projectName;
		queryParams['company.text'] = isEmpty(companyName) ? "" : companyName;
		queryParams.durationSt = isEmpty(st) ? "" : st;
		queryParams.durationEt = isEmpty(et) ? "" : et;

		queryParams['provice.id'] = isEmpty(provice) ? -1 : provice;
		queryParams['city.id'] = isEmpty(city) ? -1 : city;
		queryParams['county.id'] = isEmpty(county) ? -1 : county;

		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#projectName').val('');
		$('#companyName').val('');
		$('#st').val('');
		$('#et').val('');
		$('#provice').combobox('clear');
		$('#city').combobox('clear');
		$('#county').combobox('clear');
	}
	
	function printFun(type) {
		var projectName = $('#projectName').val();
		var companyName = $('#companyName').val();
		var st = $('#st').val();
		var et = $('#et').val();
		var provice = $('#provice').combobox('getValue');
		provice = isEmpty(provice)?0:provice;
		var city = $('#city').combobox('getValue');
		city = isEmpty(city)?0:city;
		var county = $('#county').combobox('getValue');
		county = isEmpty(county)?0:county;
		var url = ctxPath + "/report/projectBid?projectName="+projectName+"&companyName="+companyName+"&st="+st+"&et="+et+"&provice="+provice+"&city="+city+"&county="+county+"&type="+type;
		console.log(url);
		if(type == 0){
			var tmp = window.open (
					url,
					'newwindow',
					'width='+(window.screen.availWidth-10)+
					',height='+(window.screen.availHeight-30)+ 
					',top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no'
			);
			
			tmp.focus();
		}else{
			var tmp = window.open(url);
			tmp.focus();
		}
	}

	function addFun() {
		parent.$.modalDialog({
			title : '项目中标登记',
			width : 980,
			height : 410,
			href : '${ctx}/projectBid/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					parent.$.modalDialog.handler.find('#option').val(0);//直接保存
					var f = parent.$.modalDialog.handler.find('#projectBidAddForm');
					f.submit();
				}
			},{
				text : '申请上传',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					parent.$.modalDialog.handler.find('#option').val(1);//过期申请
					var f = parent.$.modalDialog.handler.find('#projectBidAddForm');
					f.submit();
				}
			}]
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
				$.post('${ctx}/projectBid/delete', {
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
			parent.$.messager.alert('警告', '没有可编辑对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能对一条记录编辑!');
			return;
		}
		id = rows[0].id;
		var state = rows[0].state;
		if(state == 1){
			alert('审核中,不能修改!');
			return;
		}
		parent.$.modalDialog({
			title : '项目中标登记编辑',
			width : 980,
			height : 410,
			href : '${ctx}/projectBid/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#projectBidEditForm');
					parent.$.modalDialog.handler.find('#option').val(0);//过期申请
					f.submit();
				}
			},{
				text : '申请上传',
				id : 'bid_apply',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					parent.$.modalDialog.handler.find('#option').val(1);//过期申请
					var f = parent.$.modalDialog.handler.find('#projectBidEditForm');
					f.submit();
				}
			} ]
		});
	}
	
	function auditFun() {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有可编辑对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能对一条记录编辑!');
			return;
		}
		id = rows[0].id;
		var state = rows[0].state;
		if(state == 0){
			alert('不是申请的数据，无需审核!');
			return;
		}else if(state == 2){
			alert('已经审核!');
			return;
		}
		parent.$.modalDialog({
			title : '项目中标登记过期审核',
			width : 980,
			height : 410,
			href : '${ctx}/projectBid/auditPage?id=' + id,
			buttons : [ {
				text : '同意上报',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#projectBidEditForm');
					parent.$.modalDialog.handler.find('#option').val(0);//过期申请
					f.submit();
				}
			}]
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
			title : '项目中标登记详情',
			width : 980,
			height : 410,
			href : '${ctx}/projectBid/detailPage?id=' + id,
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

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/projectBid/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectBid/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectBid/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectBid/detail')}">
				<a onclick="detailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">详情</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/projectBid/audit')}">
				<a onclick="auditFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit'">过期审核 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit_disabled'"><font
					color="gray">过期审核</font> </a>
			</c:otherwise>
		</c:choose>
		
		<a onclick="printFun(0);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览</a> <a
			onclick="printFun(1);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>

		<a onclick="searchFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
		<a onclick="clearFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/projectBid/search')}">
			<table>
				<tr>
					<th>项目名称:</th>
					<td><input type="text" id="projectName"></td>
					<th>中标时间:</th>
					<td><input class="Wdate" type="text" name="st" id="st"
						style="height: 100%" onfocus="showDate('yyyy-MM-dd')" /> - <input
						class="Wdate" type="text" name="et" id="et" style="height: 100%"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>公司名称:</th>
					<td><input type="text" id="companyName"></td>
					<th>地点:</th>
					<td>省<select id="provice" data-options="editable:false"
						name="provice.id" class="easyui-validatebox span2"
						style="width: 120px;">
					</select> 市<select id="city" name="city.id" class="easyui-validatebox span2"
						style="width: 120px;">
					</select> 县(区)<select id="county" name="county.id"
						data-options="editable:false" class="easyui-validatebox span2"
						style="width: 120px;">
					</select>
					</td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>