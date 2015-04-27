<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="inc.jsp"></jsp:include>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<style type="text/css">
a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	var index_layout;
	var index_tabs;
	var index_tabsMenu;
	var layout_west_tree;
	var layout_west_tree_url = '';

	var sessionInfo_userId = '${sessionInfo.id}';
	if (sessionInfo_userId) {//如果没有登录,直接跳转到登录页面
		layout_west_tree_url = '${ctx}/resource/tree';
	} else {
		window.location.href = '${ctx}/admin/index';
	}
	$(function() {
		index_layout = $('#index_layout').layout({
			fit : true
		});

		index_tabs = $('#index_tabs').tabs(
				{
					fit : true,
					border : false,
					tools : [
							{
								iconCls : 'icon_home',
								handler : function() {
									index_tabs.tabs('select', 0);
								}
							},
							{
								iconCls : 'icon_refresh',
								handler : function() {
									var index = index_tabs.tabs('getTabIndex',
											index_tabs.tabs('getSelected'));
									index_tabs.tabs('getTab', index).panel(
											'refresh');
								}
							},
							{
								iconCls : 'icon_del',
								handler : function() {
									var index = index_tabs.tabs('getTabIndex',
											index_tabs.tabs('getSelected'));
									var tab = index_tabs.tabs('getTab', index);
									if (tab.panel('options').closable) {
										index_tabs.tabs('close', index);
									}
								}
							} ]
				});

		layout_west_tree = $('#layout_west_tree').tree({
			url : layout_west_tree_url,
			parentField : 'pid',
			lines : false,
			onClick : function(node) {
				if (node.attributes && node.attributes.url) {
					var url = '${ctx}' + node.attributes.url;
					addTab({
						url : url,
						title : node.text,
						iconCls : node.iconCls
					});
				}
			}
		});
	});

	function addTab(params) {
		var iframe = '<iframe src="'
				+ params.url
				+ '" frameborder="0" style="border:0;width:100%;height:98%;"></iframe>';
		var t = $('#index_tabs');
		var opts = {
			title : params.title,
			closable : true,
			iconCls : params.iconCls,
			content : iframe,
			border : false,
			fit : true
		};
		if (t.tabs('exists', opts.title)) {
			t.tabs('select', opts.title);
		} else {
			t.tabs('add', opts);
		}
	}

	function logout() {
		$.messager.confirm('提示', '确定要退出?', function(r) {
			if (r) {
				progressLoad();
				$.post('${ctx}/admin/logout', function(result) {
					if (result.success) {
						progressClose();
						window.location.href = '${ctx}/admin/index';
					}
				}, 'json');
			}
		});
	}

	function editUserPwd() {
		parent.$.modalDialog({
			title : '修改密码',
			width : 300,
			height : 250,
			href : '${ctx}/user/editPwdPage',
			buttons : [ {
				text : '修改',
				handler : function() {
					var f = parent.$.modalDialog.handler
							.find('#editUserPwdForm');
					f.submit();
				}
			} ]
		});
	}
</script>
<script>
	var d1 = Math.floor((Math.random() * 30) + 1);
	var d2 = Math.floor((Math.random() * 30) + 1);
	function formatDay(date) {
		var m = date.getMonth() + 1;
		var d = date.getDate();
		var opts = $(this).calendar('options');
		if (opts.month == m && d == d1) {
			return '<div class="icon-ok md">' + d + '</div>';
		} else if (opts.month == m && d == d2) {
			return '<div class="icon-search md">' + d + '</div>';
		}
		return d;
	}
</script>
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
</style>
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
				style="float: left; font-size: 20px; font-weight: bold; padding-left: 6px;">皖通科技信息系统运维监管平台</span>
			<span style="float: right; padding-right: 20px;">欢迎 <b>${sessionInfo.name}</b>&nbsp;&nbsp;
				<a href="javascript:void(0)" onclick="editUserPwd()"
				style="color: #fff">修改密码</a>&nbsp;&nbsp;<a href="javascript:void(0)"
				onclick="logout()" style="color: #fff">安全退出</a>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</span> <span class="header"></span>
		</div>
		<div data-options="region:'west',split:true" title="主导航"
			style="width: 200px; overflow: hidden; overflow-y: auto;">
			<div class="well well-small" style="padding: 10px 5px 5px 5px;">
				<ul id="layout_west_tree"></ul>
			</div>
		</div>
		<div data-options="region:'center'" style="overflow: hidden;">
			<div id="index_tabs" style="overflow: hidden;">
				<div title="首页" data-options="border:false"
					style="overflow: auto; padding: 10px;">
					<div style="width: 1120px;">


						<div style="float: left; width: 855px;">
							<div class="easyui-panel"  title="我的信息" style="height: 250px;width: 855px;">
								
									<div style="width: 300px; float: left;">
										<img src="../style/images/User_01.png"
											style="float: left; margin-right: 20px" />
										<ul>
											<li>用户姓名：胡艺峰</li>
											<li>电话：13965003367</li>
											<li>用户类型：系统管理员</li>
											<li>单位：皖通科技</li>
										</ul>
									</div>
									<div style="float: right;">
										<img src="../style/images/Other/13.png" />
									</div>
								
							</div>
							<div class="easyui-tabs" style="margin-top: 5px; height: 270px;">
								<div title="我的待办" style="padding: 10px"></div>
								<div title="通知公告" style="padding: 10px"></div>
								<div title="我的知识" style="padding: 10px"></div>
							</div>
						</div>
						<div style="float: right; width: 260px; padding-left: 5px;">

							<div class="easyui-calendar" style="width: 260px; height: 250px;"
								data-options="formatter:formatDay"></div>


							<div class="easyui-tabs" style="padding-top: 5px;height: 270px;">
								<div title="快捷方式" style="padding: 10px;">

									<div
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
									</div>
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
				style="height: 15px; width: 20px;margin-top:3px;" />安徽皖通科技股份有限公司
		</div>
	</div>
</body>
</html>