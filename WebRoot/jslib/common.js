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

// 获取所有选中的行
function getSelecteds(dataGrid) {
	if (dataGrid) {
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
	if ((param == null || param == '')) {
		return true;
	}
	return false;
}

function formatDate(value) {
	if (isEmpty(value)) {
		return '';
	} else {
		return value.substring(0, value.indexOf(' '));
	}
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
			dateFmt : 'yyyy-MM-dd HH:mm'
		});
	} else {
		WdatePicker({
			dateFmt : format
		});
	}
}

//只选择月份日期
function showMonth() {  
    WdatePicker({ dateFmt: 'yyyy-MM', isShowToday: false, isShowClear: false });  
}  

//日期起止时间控制
function showStart(format) {
	if (isEmpty(format)) {
		WdatePicker({
			dateFmt : 'yyyy-MM-dd',
			maxDate : '#F{$dp.$D(\'endDT\')||\'%y-%M-%d\'}'
		});
	} else {
		WdatePicker({
			dateFmt : format,
			maxDate : '#F{$dp.$D(\'endDT\')||\'%y-%M-%d\'}'
		});
	}
}

function showEnd(format) {
	if (isEmpty(format)) {
		WdatePicker({
			dateFmt : 'yyyy-MM-dd',
			minDate : '#F{$dp.$D(\'startDT\')}',
			maxDate : '%y-%M-%d'
		});
	} else {
		WdatePicker({
			dateFmt : format,
			minDate : '#F{$dp.$D(\'startDT\')}',
			maxDate : '%y-%M-%d'
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

var Common = {
	formatter : function(value, row, index) {
		if (!isEmpty(value)) {
			// var date = new Date(value);
			var date = newDate(value);
			return date.format('yyyy-MM-dd');
		}
		return '';
	},

	formatterTime : function(value, row, index) {
		if (!isEmpty(value)) {
			var date = newDate(value);
			return date.format('yyyy-MM-dd hh:mm');
		}
		return '';
	},
	
	formatterMonth : function(value, row, index) {
		if (!isEmpty(value)) {
			var date = newDate(value);
			return date.format('yyyy-MM');
		}
		return '';
	},

	// 强制保留两位小数
	formatterDecimal2 : function(x) {
		var f = parseFloat(x);
		if (isNaN(f)) {
			return '';
		}
		var f = Math.round(x * 100) / 100;
		var s = f.toString();
		var rs = s.indexOf('.');
		if (rs < 0) {
			rs = s.length;
			s += '.';
		}
		while (s.length <= rs + 2) {
			s += '0';
		}
		return s;
	}
};

//支持IE的日期处理
function newDate(dateStr) {
	if(!isEmpty(dateStr)){
		var date = new Date();
		if(dateStr.indexOf(':') >= 0){
			var ds = dateStr.split(" ")[0].split("-");
			var ts = dateStr.split(" ")[1].split(":");
			date.setFullYear(ds[0], ds[1] - 1, ds[2]);
			date.setHours(ts[0], ts[1], ts[2], 0);
		}else{
			var ds2 = dateStr.split("-");
			date.setUTCFullYear(ds2[0], ds2[1] - 1, ds2[2]);
			date.setUTCHours(0, 0, 0, 0);
		}
		return date;
	}
}

//获取选中月的第一天和最后一天
function getLastDayOfMonth(year, month) {
	var day = new Date(year, month, 0);
	var lastdate = year + '-' + month + '-' + day.getDate();// 获取当月最后一天日期
	return lastdate;
}

function disableForm(formId,isDisabled) {
  var attr="disable";
	if(!isDisabled){
	   attr="enable";
	}
	$("form[id='"+formId+"'] :text").attr("disabled",isDisabled);
	$("form[id='"+formId+"'] textarea").attr("disabled",isDisabled);
	$("form[id='"+formId+"'] select").attr("disabled",isDisabled);
	$("form[id='"+formId+"'] :radio").attr("disabled",isDisabled);
	$("form[id='"+formId+"'] :checkbox").attr("disabled",isDisabled);

	$("#" + formId + " input[class='combobox-f combo-f']").each(function () {
		if (this.id) {alert("input"+this.id);
			$("#" + this.id).combobox(attr);
		}
	});

	$("#" + formId + " select[class='combobox-f combo-f']").each(function () {
		if (this.id) {
		alert(this.id);
			$("#" + this.id).combobox(attr);
		}
	});

	$("#" + formId + " input[class='datebox-f combo-f']").each(function () {
		if (this.id) {
		alert(this.id);
			$("#" + this.id).datebox(attr);
		}
	});
}

function newDateAndTime(dateStr) {
	var ds = dateStr.split(" ")[0].split("-");
	var ts = dateStr.split(" ")[1].split(":");
	var r = new Date();
	r.setFullYear(ds[0], ds[1] - 1, ds[2]);
	r.setHours(ts[0], ts[1], ts[2], 0);
	return r;
}


//设置默认显示第一页
function setFirstPage(dataGrid) {
	var opts = dataGrid.datagrid('options');
	var pager = dataGrid.datagrid('getPager');
	opts.pageNumber = 1;
	opts.pageSize = opts.pageSize;
	pager.pagination('refresh', {
		pageNumber : 1,
		pageSize : opts.pageSize
	});
}

function reloadGrid(dg){
	setFirstPage(dg);
	dg.datagrid('reload');
}

//每页默认显示条数
//优化：做成可配置的，从后台读取，在系统管理中增加一个系统基本配置：页面配置（每页默认显示条数等，页面弹出框模式等）
function getDefaultPageSize(){
	return 50;
}

function toCap(n) {
	if (!/^(0|[1-9]\d*)(\.\d+)?$/.test(n)){
		return "数据非法";
	}
	var unit = "仟佰拾亿仟佰拾万仟佰拾元角分", str = "";
	n += "00";
	var p = n.indexOf('.');
	if (p >= 0){
		n = n.substring(0, p) + n.substr(p + 1, 2);
	}
	unit = unit.substr(unit.length - n.length);
	for ( var i = 0; i < n.length; i++){
		str += '零壹贰叁肆伍陆柒捌玖'.charAt(n.charAt(i)) + unit.charAt(i);
	}
	return str.replace(/零(仟|佰|拾|角)/g, "零").replace(/(零)+/g, "零")
		.replace(/零(万|亿|元)/g, "$1").replace(/(亿)万|壹(拾)/g, "$1$2")
		.replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
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
