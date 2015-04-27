<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>任务响应分析</title>
<script type="text/javascript">

	$(function(){
		//load();
	});

	function load() {
		progressLoad();
		$.post('${ctx}/taskStatistics/showResponseAnalysisChart', function(
				result) {
			alert('${graphURL}');
			progressClose();
		}, 'html');
	}

	function searchFun() {
		var startDT = $('#startDT').val();
		var endDT = $('#endDT').val();
		$('#taskChart').src = '${ctx}/chart/showChart?startDT=' + startDT
				+ '&&endDT=' + endDT;
	}

	function clearFun() {
		$('#startDT').val('');
		$('#endDT').val('');
	}

	function startDTlimit() {
		var endDT = $dp.$('endDT');
		WdatePicker({
			onpicked : function() {
				endDT.focus();
			},
			maxDate : '#F{$dp.$D(\'endDT\')}',
			minDate : '%y-%M-%d',
			dateFmt : 'yyyy-MM-dd'
		});
	}

	function endDTlimit() {
		var minDT = $dp.$D('startDT');
		if (isEmpty(minDT)) {
			minDT = '%y-%M-%d';
		} else {
			minDT = '#F{$dp.$D(\'startDT\')}';
		}
		WdatePicker({
			minDate : minDT,
			dateFmt : 'yyyy-MM-dd'
		});
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<%-- <img src="${ctx}/taskStatistics/showResponseAnalysisChart"
			id="taskChart"
			style="float: left; margin-top: 6px; margin-left: 5px;" /> --%>
		<img src="${graphURL}" id="taskChart"
			style="float: left; margin-top: 6px; margin-left: 5px;"
			usemap="#imgMap">
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: false">
		<span>开始时间</span> <input class="Wdate" type="text" name="startDT"
			id="startDT" style="width: 120px; height: 98%"
			onfocus="startDTlimit()" /> <span>结束时间</span> <input class="Wdate"
			type="text" name="endDT" id="endDT" value=""
			style="width: 120p; height: 98%" onfocus="endDTlimit()" />

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/task/showResponseAnalysisChart')}">
			<a onclick="searchFun();" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_search'">查看图表</a>
			<a onclick="clearFun();" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_clear'">清空条件</a>
		</c:if>
	</div>
	<map id="imgMap" name="imgMap" />
</body>
</html>