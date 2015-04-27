/*******************************************************************************
 * @author Sunhb
 * 
 * @requires jQuery
 * 
 * 当页面加载完毕关闭加载进度
 ******************************************************************************/
$(window).load(function() {
	$("#loading").fadeOut();
});

/**
 * @author Sunhb
 * 
 * @requires jQuery
 * 
 * 防止退格键导致页面回退
 */
$(document).keydown(
		function(e) {
			var doPrevent;
			if (e.keyCode == 8) {
				var d = e.srcElement || e.target;
				if (d.tagName.toUpperCase() == 'INPUT'
						|| d.tagName.toUpperCase() == 'TEXTAREA') {
					doPrevent = d.readOnly || d.disabled;
				} else {
					doPrevent = true;
				}
			} else {
				doPrevent = false;
			}
			if (doPrevent)
				e.preventDefault();
		});

// 获取所有选中的行
function getSelected() {
	var rows = $("#dataGrid").datagrid("getSelections");
	var str = '';
	for ( var i = 0; rows && i < rows.length; i++) {
		var row = rows[i];
		str += (i == 0) ? row.id : ',' + row.id;
	}
	return str;
}

//获取所有选中的行
function getSelecteds(dataGrid) {
	if(dataGrid){
		var rows = dataGrid.datagrid("getSelections");
		var str = '';
		for ( var i = 0; rows && i < rows.length; i++) {
			var row = rows[i];
			str += (i == 0) ? row.id : ',' + row.id;
		}
		return str;
	}
}

function isEmpty(param) {
	if (param == null || param == '') {
		return true;
	}
	return false;
}

function formatterdate(value) {
	var date = new Date('2014-12-26 00:00:00', 'yyyy-mm-dd HH:mm:ss');
	alert('date' + date);
	var year = date.getFullYear();
	var month = date.getMonth() + 1;
	month = month > 9 ? month : '0' + month;
	var day = date.getDate();
	day = day > 9 ? day : '0' + day;
	var str = year + '-' + month + '-' + day;
	return str;
}

/**
 * 
 * @param str
 * @returns {Date} 解决IE下不支持 new Date() 的问题
 */
function parseISO8601(dateStringInRange) {
	var isoExp = /^\s*(\d{4})-(\d\d)-(\d\d)\s*$/, date = new Date(NaN), month, parts = isoExp
			.exec(dateStringInRange);

	if (parts) {
		month = +parts[2];
		date.setFullYear(parts[1], month - 1, parts[3]);
		if (month != date.getMonth() + 1) {
			date.setTime(NaN);
		}
	}
	return date;
}

function showDate(format) {
	if (isEmpty(format)) {
		WdatePicker({
			dateFmt : 'yyyy/MM/dd HH:mm:ss'
		});
	} else {
		WdatePicker({
			dateFmt : format
		});
	}
}

function addTab(params) {
	var background = "";
	if (!isEmpty(params.background)) {
		background = params.background;
	}
	var iframe = '<iframe src="'
			+ params.url
			+ '" frameborder="0" style="border:0;width:100%;height:98%;background:'
			+ background + '">' + '</iframe>';
	var t = parent.$('#index_tabs');
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

function showAttachments(ids) {
	if (isEmpty(ids)) {
		return;
	}

	$.ajax({
		type : "post",
		url : ctxPath + "/fileup/findByIds",
		cache : false,
		data : {
			ids : ids
		},
		dataType : "json",
		success : function(result) {
			var attachs = result.obj;
			var ids = '';
			for ( var i = 0; i < attachs.length; i++) {
				var attach = attachs[i];
				var path = ctxPath + "/fileup/download?id=" + attach.id;
				var href = "<div id='" + attach.id + "'>"
						+ "<a style=\"margin:5px;\" href=" + path + "><u>"
						+ attach.uiName + "</u></a>";
				$("#downloadDiv").append(href);
				ids += attach.id + ',';
			}
		},
		error : function(error) {
			alert(error);
		}

	});
}

function removeSelectedRow(dataGrid) {
	var rows = dataGrid.datagrid("getSelections");
	var copyRows = [];
	for ( var j = 0; j < rows.length; j++) {
		copyRows.push(rows[j]);
	}
	for ( var i = 0; i < copyRows.length; i++) {
		var index = dataGrid.datagrid('getRowIndex', copyRows[i]);
		dataGrid.datagrid('deleteRow', index);
	}
}

function getTextByTaskState(state) {
	if (state == 0) {
		return '未启动';
	} else if (state == 1) {
		return '已分配';
	} else if (state == 2) {
		return '已接受';
	} else if (state == 3) {
		return '处理中..';
	} else if (state == 4) {
		return '已完成';
	} else if (state == 5) {
		return '已过期';
	}

}

// html编辑器,fix bug,第二次进入编辑器时,必须全屏然后才可以获取焦点
function initKingEditor(editor) {
	editor = KindEditor.create('#html', {
		resizeType : 1,
		allowPreviewEmoticons : false,
		allowImageUpload : true,// 允许上传图片
		allowFileUpload : true,// 允许上传文件
		syncType : 'form',// 提交时自动同步到textarea,然后提交到form
		urlType : 'absolute',
		shadowMode : false,
		items : [ 'source', 'fullscreen', '|', 'undo', 'redo', '|', 'cut',
				'copy', 'paste', 'plainpaste', '|', 'justifyleft',
				'justifycenter', 'justifyright', 'justifyfull',
				'insertorderedlist', 'insertunorderedlist', 'indent',
				'outdent', '|', 'formatblock', 'fontname', 'fontsize', '|',
				'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'image', 'multiimage', 'flash', 'media',
				'insertfile', 'table', 'hr', 'emoticons', 'baidumap',
				'pagebreak', 'anchor', 'link', 'unlink', '|', 'about' ],
		afterChange : function() {
			this.sync();
		}
	});
}
