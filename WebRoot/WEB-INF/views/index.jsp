<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="imgPath" value="${ctx}/style/images" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="inc.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/jslib/index.js"
	charset="utf-8"></script>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<style type="text/css">
a {
	text-decoration: none;
}
.lines-no .datagrid-body td{
    border-right:0px dotted transparent;
    border-bottom:0px dotted transparent;
}
.datagrid-header{
border-color: white;
}
</style>
<style scoped="scoped">
.md {
	height: 16px;
	line-height: 16px;
	background-position: 2px center;
	text-align: right;
	font-weight: bold;
	padding: 0 2px;
	color: red;
}

td {
	font-size: 12px;
	line-height: 18px;
	font-family: arial;
	color: #525252;
}

.STYLE1 {
	width: 250px;
	float: left; /* 左对齐，不设置的话只在IE下好用 */
	overflow: hidden; /* 超出的部分隐藏起来 */
	white-space: nowrap; /* 不显示的地方用省略号...代替 */
	text-overflow: ellipsis; /* 支持 IE */
	-o-text-overflow: ellipsis;
	float: left; /* 支持 Opera */
}

a:link {
	font-size: 12px;
	color: #525252;
	text-decoration: none;
}

a:visited {
	font-size: 12px;
	color: #525252;
	text-decoration: none;
}

a:hover {
	font-size: 12px;
	color: #E13E00;
	text-decoration: underline;
}

/* #757575 */
</style>
<script type="text/javascript">
	$(function() {
		init();
	});
</script>
</head>
<body>
	<div id="loading"
		style="position: fixed; top: -50%; left: -50%; width: 200%; height: 200%; background: #fff; z-index: 100; overflow: hidden;">
		<img src="${ctx}/style/images/index/ajax-loader.gif"
			style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; margin: auto;" />
	</div>
	<div id="index_layout">
		<div data-options="region:'north'" style="overflow: hidden;"
			id="header">
			<img src="../style/images/6570.png"
				style="width: 40px; height: 40px; margin-left: 20px; margin-top: 12px; float: left;" />
			<span
				style="float: left; font-size: 20px; font-weight: bold; padding-left: 6px;">深圳市健康泉绿色农业科技有限公司</span>
			<span style="float: right; padding-right: 20px;">欢迎 <a
				id="index_edit_user" href="javascript:void(0)"
				onclick="editUser('${sessionInfo.id}')" style="color: #fff"><b>${sessionInfo.name}</b></a>&nbsp;&nbsp;

				<a href="javascript:void(0)" onclick="editUserPwd()"
				style="color: #fff">修改密码</a>&nbsp;&nbsp;<a href="javascript:void(0)"
				onclick="logout()" style="color: #fff">安全退出</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</span> <span class="header"></span>
		</div>
		<div data-options="region:'west',split:true" title="主导航"
			style="width: 200px; overflow: hidden; overflow-y: auto;">
			<div id='layout_west_tree' class="easyui-accordion" fit="true"
				border="false">
				<!--  导航内容 -->
			</div>
		</div>
		<div data-options="region:'center'" style="overflow: hidden;">
			<div id="index_tabs" style="overflow: hidden;">
				<div title="首页" data-options="border:false"
					style="overflow: auto; padding: 10px;">
					<div style="width: 1120px;">
						<div style="float: left; width: 855px;">
							<div class="easyui-panel" title="我的信息"
								style="height: 250px; width: 855px;">

								<div style="width: 300px; float: left;">
									<img src="../style/images/User_01.png"
										style="float: left; margin-right: 20px" />
									<ul style="margin-left: 100px; width: 240px;">
										<li>用户姓名：${sessionInfo.name}</li>
										<c:choose>
											<c:when
												test="${sessionInfo.mobilePhone == null || sessionInfo.mobilePhone == ''}">
												<li style="margin-top: 10px;">联系电话：暂无</li>
											</c:when>
											<c:otherwise>
												<li style="margin-top: 10px;">联系电话：${sessionInfo.mobilePhone}</li>
											</c:otherwise>
										</c:choose>
										<li style="margin-top: 10px;">用户类型：${sessionInfo.usertypeName}</li>
										<li style="margin-top: 10px;">单位：【${sessionInfo.organizationName}】</li>
										<li style="margin-top: 10px;">上次登录：${sessionInfo.lastLoginTimeStr}</li>
									</ul>
								</div>
								<div style="float: right;">
									<img src="../style/images/Other/13.png" />
								</div>

							</div>
							<div class="easyui-tabs" style="margin-top: 5px; height: 270px;">
								<div id="task_to_do" title="我的待办"
									data-options="iconCls:'icon_rms_todo'"
									style="padding: 10px; overflow: scroll;">
									<table id="myTaskGrid" style="border: 0px;width: 480px;" data-options="border:false"></table>
								</div>
								<div id="index_notice" title="通知公告"
									data-options="iconCls:'icon_rms_notice'"
									style="padding: 10px; background: #FCFCFD">
									<table id="notice">
										<c:forEach items="${notices}" var="d" varStatus="status">
											<tr>
												<td width="20px" class="icon_rms_notice_clos" />
												<c:choose>
													<c:when test="${status.first == true}">
														<td width="300px"><a class="STYLE1"
															style="color: red" href="#"
															onclick="detailArticle('${d.title}','notice','${d.id}')">${d.title}</a>
														</td>
													</c:when>

													<c:otherwise>
														<td width="300px"><a class="STYLE1" href="#"
															onclick="detailArticle('${d.title}','notice','${d.id}')">${d.title}</a>
														</td>
													</c:otherwise>

												</c:choose>
												<td width="120px">【${d.organizationName}】</td>
												<td width="60px" style="color: #cc0000">${d.publishDTText}</td>
												<td width="60px">阅<font color="#cc0000">${d.numberOfScan}</font>次
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
								<div id="index_knowledge" title="我的知识"
									data-options="iconCls:'icon_rms_manger_knowledge'"
									style="padding: 10px; background: #FCFCFD">
									<table id="knowledge">
										<c:forEach items="${knowledges}" var="d" varStatus="status">
											<tr>
												<td width="20px" class="icon_rms_notice_clos" />
												<c:choose>
													<c:when test="${status.first == true}">
														<td width="300px"><a class="STYLE1"
															style="color: red" href="#"
															onclick="detailArticle('${d.title}','knowledge','${d.id}')">${d.title}</a>
														</td>
													</c:when>

													<c:otherwise>
														<td width="300px"><a class="STYLE1" href="#"
															onclick="detailArticle('${d.title}','notice','${d.id}')">${d.title}</a>
														</td>
													</c:otherwise>

												</c:choose>
												<td width="120px">【${d.organizationName}】</td>
												<td width="60px" style="color: #cc0000">${d.createDTText}</td>
												<td width="60px">阅<font color="#cc0000">${d.numberOfScan}</font>次
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<div style="float: right; width: 260px; padding-left: 5px;">

							<div class="easyui-calendar" style="width: 260px; height: 250px;"
								data-options="formatter:formatDay"></div>


							<div class="easyui-tabs" style="padding-top: 5px; height: 270px;">
								<div title="快捷方式" style="padding: 10px;">
									<c:forEach items="${shotcuts}" var="d" varStatus="status">
											<div style="float: left; width: 60px; height: 70px; margin: 8px;">
											<a href="#" onclick="shotTab('${d.resourceUrl}','${d.resourceName}','${d.resourceIcon}')" >
												<img src="${imgPath}/shotcut/${d.iconUrl}" style="height: 55px; width: 55px;" /><br /> 
												<span>${d.resourceName}</span>
											</a>
											</div>
									</c:forEach>

									<!-- <div
										style="float: left; width: 60px; height: 70px; margin: 8px;">
										<img src="../style/images/6570.png"
											style="height: 55px; width: 55px;" /><br /> <a
											href="http://www.baidu.com">运维查询</a>
									</div>
									<div
										style="float: left; width: 60px; height: 70px; margin: 8px;">
										<img src="../style/images/Other/12.png"
											style="height: 55px; width: 55px;" /><br /> <a
											href="http://www.baidu.com">事件记录</a>
									</div>
									<div
										style="float: left; width: 60px; height: 70px; margin: 8px;">
										<img src="../style/images/Other/11.png"
											style="height: 55px; width: 55px;" /><br /> <a
											href="http://www.baidu.com">通知公告</a>
									</div>
									<div
										style="float: left; width: 60px; height: 70px; margin: 8px;">
										<img src="../style/images/Other/10.png"
											style="height: 55px; width: 55px;" /><br /> <a
											href="http://www.baidu.com">文档管理</a>
									</div> -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div data-options="region:'south',border:false"
			style="height: 25px; overflow: hidden; text-align: left; padding: 5px; background-color: #daeef5">
			<img src="../style/images/Other/logoa.png"
				style="height: 15px; width: 20px; margin-top: 3px;" />深圳市健康泉绿色农业科技有限公司
		</div>
	</div>

	<div id="mm" class="easyui-menu" style="width: 150px;">
		<div id="mm-tabclose" data-options="iconCls:'icon_del'">关闭</div>
		<div id="mm-tabcloseall" data-options="iconCls:'icon_del'">全部关闭</div>
		<div id="mm-tabcloseother" data-options="iconCls:'icon_del'">关闭其他</div>
		<div class="menu-sep"></div>
		<div id="mm-tabcloseright" data-options="iconCls:'icon_del'">关闭全部右侧</div>
		<div id="mm-tabcloseleft" data-options="iconCls:'icon_del'">关闭全部左侧</div>
		<div class="menu-sep"></div>
	</div>

	<div class="tipfloat">
		<h2 class="tiphead">
			<strong>任务提醒</strong><span title="关闭" class="close">关闭</span>
		</h2>
		你有${tasknum}个新任务<br>详情请查看任务派单
		<c:forEach var="task" items="${tasklist}">
			<a href="#">${task.name}</a>
			<br>
		</c:forEach>
	</div>
</body>
</html>