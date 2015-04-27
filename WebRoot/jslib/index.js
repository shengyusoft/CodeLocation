var index_layout;
var index_tabs;
var index_tabsMenu;
var layout_west_tree;
var sessionInfo_userId = '${sessionInfo.id}';
function init() {
	if (sessionInfo_userId) {// 如果没有登录,直接跳转到登录页面
		layout_west_tree_url = ctxPath + '/resource/tree';
	} else {
		window.location.href = ctxPath + '/admin/index';
	}

	loadindex();
	loadMenu();
	editTip();
	taskRemind();// 任务提醒
    loadToDo();//加载我的待办
}

function loadindex() {
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
}

// 加载menu
function loadMenu() {
	// 导航菜单绑定初始化
	$("#layout_west_tree").accordion({
		animate : false
	});

	$.ajax({
		type : 'POST',
		dataType : "json",
		url : layout_west_tree_url,
		success : function(data) {
			var parentmenu = [];// 第一级菜单
			var index = 0;
			for ( var i = 0; i < data.length; i++) {
				var rs = data[i];
				if (rs.pid == undefined || rs.pid == 'undefined'
						|| rs.pid == null) {
					parentmenu[index++] = rs;
				}

			}

			// 第二级菜单
			var pc = [];
			var childrens = [];
			index = 0;
			for ( var i = 0; i < parentmenu.length; i++) {
				var pt = parentmenu[i];
				var parentid = pt.id;
				for ( var j = 0; j < data.length; j++) {
					if (parentid == data[j].pid) {
						childrens[index++] = data[j];
					}
				}
				pc[i] = childrens;
				childrens = [];
				index = 0;

			}

			for ( var i = 0; i < pc.length; i++) {
				var menu = pc[i];
				var menulist = "";
				menulist += '<ul>';

				for ( var j = 0; j < menu.length; j++) {
					var o = menu[j];
					menulist += '<li><div><a ref="' + o.id + '" href="#" rel="'
							+ o.attributes.url + '" ><span class="icon '
							+ o.iconCls + '" >&nbsp;</span><span class="nav">'
							+ o.text + '</span></a></div></li> ';
				}

				$('#layout_west_tree').accordion('add', {
					title : parentmenu[i].text,
					content : menulist,
					iconCls : 'icon ' + parentmenu[i].iconCls
				});
			}

			hoverMenuItem();

			$('#layout_west_tree li a').live('click', function() {
				var tabTitle = $(this).children('.nav').text();
				var url = $(this).attr("rel");
				var icon = $(this).children('.icon').attr("class");
				icon = icon.substring(icon.lastIndexOf('icon'));
				addTab({
					url : ctxPath + '' + url,
					title : tabTitle,
					iconCls : icon
				});
				$('#layout_west_tree li div').removeClass("selected");
				$(this).parent().addClass("selected");
			});

		}
	});

}

function shotTab(url,title,icon){
	addTab({
		url : ctxPath + '' + url,
		title : title,
		iconCls : icon
	});
}

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

	tabClose();
	tabCloseEven();
}

/**
 * 菜单项鼠标Hover
 */
function hoverMenuItem() {
	$(".easyui-accordion").find('a').hover(function() {
		$(this).parent().addClass("hover");
	}, function() {
		$(this).parent().removeClass("hover");
	});
}

function tabClose() {
	/* 双击关闭TAB选项卡 */
	$(".tabs-inner").dblclick(function() {
		var subtitle = $(this).children(".tabs-closable").text();
		$('#tabs').tabs('close', subtitle);
	});
	/* 为选项卡绑定右键 */
	$(".tabs-inner").bind('contextmenu', function(e) {
		$('#mm').menu('show', {
			left : e.pageX,
			top : e.pageY
		});

		var subtitle = $(this).children(".tabs-closable").text();

		$('#mm').data("currtab", subtitle);
		$('#tabs').tabs('select', subtitle);
		return false;
	});
}
// 绑定右键菜单事件
function tabCloseEven() {
	// 关闭当前
	$('#mm-tabclose').click(function() {
		var currtab_title = $('#mm').data("currtab");
		$('#index_tabs').tabs('close', currtab_title);
	});
	// 全部关闭
	$('#mm-tabcloseall').click(function() {
		$('.tabs-inner span').each(function(i, n) {
			var t = $(n).text();
			if (t != '首页') {
				$('#index_tabs').tabs('close', t);
			}
		});
	});
	// 关闭除当前之外的TAB
	$('#mm-tabcloseother').click(function() {
		$('#mm-tabcloseright').click();
		$('#mm-tabcloseleft').click();
	});
	// 关闭当前右侧的TAB
	$('#mm-tabcloseright').click(function() {
		var nextall = $('.tabs-selected').nextAll();
		if (nextall.length == 0) {
			// msgShow('系统提示','后边没有啦~~','error');
			$.messager.alert('系统提示', '后边没有啦~~', 'error');
			return false;
		}
		nextall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			$('#index_tabs').tabs('close', t);
		});
		return false;
	});
	// 关闭当前左侧的TAB
	$('#mm-tabcloseleft').click(function() {
		var prevall = $('.tabs-selected').prevAll();
		if (prevall.length == 0) {
			return false;
		}
		prevall.each(function(i, n) {
			var t = $('a:eq(0) span', $(n)).text();
			if (t != '首页') {
				$('#index_tabs').tabs('close', t);
			}
		});
		return false;
	});

	// 退出
	$("#mm-exit").click(function() {
		$('#mm').menu('hide');
	});
}

function logout() {
	$.messager.confirm('提示', '确定要退出?', function(r) {
		if (r) {
			progressLoad();
			$.post(ctxPath + '/admin/logout', function(result) {
				if (result.success) {
					progressClose();
					window.location.href = ctxPath + '/admin/index';
				}
			}, 'json');
		}
	});
}

function editUser(userid) {
	if(isEmpty(userid)){
		$.messager.alert("登录过期,请重新登录!");
		return;
	}
	parent.$.modalDialog({
		title : '修改个人信息',
		width : 560,
		height : 400,
		href : ctxPath + '/user/editPersonalPage?id=' + userid,
		buttons : [ {
			text : '编辑',
			handler : function() {
				var f = parent.$.modalDialog.handler.find('#personalEditForm');
				f.submit();
			}
		} ]
	});
}

function editTip() {
	$('#index_edit_user').tooltip({
		position : 'bottom',
		content : '<span style="color:#fff">点我修改个人信息!</span>',
		onShow : function() {
			$(this).tooltip('tip').css({
				backgroundColor : '#666',
				borderColor : '#666'
			});
		}
	});
}

function editUserPwd() {
	parent.$.modalDialog({
		title : '修改密码',
		width : 300,
		height : 250,
		href : ctxPath + '/user/editPwdPage',
		buttons : [ {
			text : '修改',
			handler : function() {
				var f = parent.$.modalDialog.handler.find('#editUserPwdForm');
				f.submit();
			}
		} ]
	});
}


// 文章详情
function detailArticle(title, type, id) {
	var url = ctxPath + '/' + type + '/detailPage?id=' + id;
	if (title.length > 4) {
		title = title.substring(0, 4) + '...';
	}
	addTab({
		url : url,
		title : title + '详情',
		background : '#F0F5FB'
	});
}

var toDoGrid;
function loadToDo(){
	toDoGrid = $('#myTaskGrid').datagrid({
		url : ctxPath + '/admin/toDoGrid',
		striped : true,
		showHeader : false,
		fit: true,
		nowrap : true,
		idField : 'id',
		frozenColumns : [ [

				{
					id:'img_tag',
					width : '80',
					align : 'center',
					formatter : function(value, row, index) {
						return "<img style='vertical-align: middle;' src='"+ctxPath+"/style/images/rms/clos.png'";
					}
				},
				{
					width : '80',
					title : '待办类型',
					align : 'center',
					field : 'type',
					formatter : function(value, row, index) {
						var str = '【'+value+'】';
						return str;
					}
				},
				{
					width : '300',
					title : '待办名称',
					align : 'center',
					sortable : true,
					field : 'name',
					formatter : function(value, row, index) {
						var str = '<span class="STYLE1">'+value+'</span>';
						if(index == 0){
							str = '<span class="STYLE1" style="color:red">'+value+'</span>';
						}
						return str;
					}

				},
				{
					width : '80',
					title : '重要等级',
					align : 'center',
					field : 'levelText'
				}, {
					width : 90,
					field : 'action',
					title : '操作',
					formatter : function(value, row, index) {
						var str = $.formatString('<a href="javascript:void(0)" style="text-decoration: underline;color:blue" onclick="handlerToDo(\'{0}\',\'{1}\',\'{2}\');" >去处理</a>', 
								row.id,row.tag,row.state);
						return str;
					}
				} ] ],
		toolbar : '#toolbar'		
	});
	
	 $('#myTaskGrid').datagrid('getPanel').addClass('lines-no');
}

// 任务处理
function handlerToDo(id,tag,state) {
	var buttonText = '';
	var buttonIcon = '';
	if(state == 1){//接受
		buttonText = '接受';
		buttonIcon = 'icon_toolbar_task_accept';
	}else{//处理
		buttonText = '处理';
		buttonIcon = 'icon_toolbar_task_handler';
	}
	var url = ctxPath + '/'+tag+'/todoPage?id=' + id;
	
	parent.$.modalDialog({
		title : '待办处理',
		width : '870',
		height : '560',
		href : url,
		buttons : [ {
			text : buttonText,
			iconCls:buttonIcon,
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = toDoGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
				if(state > 1){
					var f = parent.$.modalDialog.handler
					.find('#handlerForm');
					f.submit();
				}else{
					parent.$.messager.confirm('确认', '确认接受所选的任务吗?', function(ok) {
						if(ok){
							$.ajax({
								type : "post",
								url : ctxPath + "/task/acceptBatch",
								cache : false,
								data : {
									ids : id
								},
								dataType : "json",
								success : function(result) {
									if (result.success) {
										parent.$.modalDialog.handler.dialog('close');
										parent.$.messager.alert('提示', result.msg, 'success',
												'icon_remind');
										toDoGrid.datagrid('reload');
									}
								},
								error : function(error) {
									alert(error);
								}
					
							});
						}
					});
				}
			}
		},{
			text : '退出',
			handler : function() {
				// 因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				parent.$.modalDialog.handler.dialog('close');
			}
		} ]
	});
	
}

// 任务提醒
function taskRemind() {
	$.ajax({
		type : "post",
		url : ctxPath + "/task/findTask",
		cache : false,
		dataType : "json",
		success : function(result) {
			if (result.success) {
				showRemind();
			}
		},
		error : function(error) {
			alert(error);
		}

	});
}

function showRemind() {
	var titHeight = $(".tiphead").height();
	$(".tipfloat").animate({
		height : "show"
	}, 400);
	$(".close").click(function() {
		$(".tipfloat").animate({
			height : titHeight - 50
		}, 1000, function() {
			$(".tipfloat").hide();
		});
	});

	// 10秒后自动退出
	setTimeout(function() {
		$(".tipfloat").animate({
			height : titHeight - 50
		}, 1000, function() {
			$(".tipfloat").hide();
		});
	}, 10000);
}

function formatDay(date) {
	var d1 = Math.floor((Math.random() * 30) + 1);
	var d2 = Math.floor((Math.random() * 30) + 1);
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