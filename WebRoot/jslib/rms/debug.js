function initAdd() {
	$('#noticeAddForm').form({
		url : ctxPath + '/notice/add',
		onSubmit : function() {
			var ids = $('#attachmentIds').val();
			if (!isEmpty(ids) && ids.length > 1) {
				ids = ids.substring(0, ids.lastIndexOf(','));
			}
			$('#attachmentIds').val(ids);
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
				if (editor != null) {
					editor.remove();
				}
				// 之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');
				parent.$.modalDialog.handler.dialog('close');
			} else {
				parent.$.messager.alert('错误', result.msg, 'error');
			}
		}
	});

	$('#fileAddForm').form(
			{
				url : ctxPath + '/fileup/add',
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
						var path = ctxPath + "/fileup/download?id="
								+ result.obj.id;
						var ids = $('#attachmentIds').val();
						if (isEmpty(ids)) {
							ids = '';
						}
						ids += result.obj.id + ',';
						$('#attachmentIds').val(ids);
						var href = "<div id='" + result.obj.id + "'>"
								+ "<a style=\"margin:5px;\" href=" + path
								+ "><u>" + result.obj.uiName
								+ "</u></a><a href=\"#\" onClick=\"delAttach('"
								+ result.obj.id + "')\">删除</a></div>";
						$("#downloadDiv").append(href);
						parent.$.messager.alert('恭喜', result.msg, 'success');
					} else {
						parent.$.messager.alert('错误', result.msg, 'error');
					}
				}
			});

	initKingEditor();
}

function delAttach(id) {
	$.ajax({
		type : "post",
		url : ctxPath + "/fileup/delete",
		cache : false,
		data : {
			ids : id
		},
		dataType : "json",
		success : function(response) {
			alert(response.msg);
			var ids = $('#attachmentIds').val();
			ids = ids.replace(id + ',', '');
			$('#attachmentIds').val(ids);
			var childNode = document.getElementById(id);
			$('#downloadDiv')[0].removeChild(childNode);
		},
		error : function(error) {
			alert(error);
		}

	});
}

function initKingEditor() {
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
	
	KindEditor.util.focus('#html');
	
//	return editor.remove().create();
//	fullscreen(false);
}

function fullscreen(a) {
	editor.isCreated = a;
	return editor.remove().create();
}