/**
 * 用户登陆系统相关验证
 * 
 * @author sunsi
 * @Create Date：2011-05-14
 */

// 用户名验证
function validateUserName() {
	var un = $("#loginname");
	if (un.val() === "") {
		$("#errorimage").addClass("errorFontStyle");
		$("#error").html("用户名不能为空！");
		un.focus();
		return false;
	}
	return true;
}

// 密码验证
function validatePassWord() {
	var pw = $("#password");
	if (pw.val() === "") {
		$("#errorimage").addClass("errorFontStyle");
		$("#error").html("密码不能为空！");
		pw.focus();
		return false;
	}
	return true;
}

// 用户登录验证
function validateLogin() {
	var loginname = $("#loginname").val();
	var password = $("#password").val();
	var vercode = $("#vercode").val();
	var rememberPwd = $("#rpwd").attr('checked');
	if (rememberPwd == null) {
		rememberPwd = false;
	} else if (rememberPwd == "checked") {
		rememberPwd = true;
	}
	if (!validateUserName()) {
		return false;
	}
	if (!validatePassWord()) {
		return false;
	}
	$.ajax({
		type : "post",
		url : "login",
		cache : false,
		data : {
			loginname : loginname,
			password : password,
			vercode : vercode,
			rememberPwd : rememberPwd
		},
		dataType : "json",
		success : function(response) {
			if (response.success == 'false' || response.success == false) {
				$("#errorimage").addClass("errorFontStyle");
				$("#error").html(response.msg);
			} else {
				document.location.href = "index";
			}
		},

		failure : function() {
			$("#errorimage").addClass("errorFontStyle");
			$("#error").html(response.msg);
		}
	});
}

// 登录表单重置功能
function formReset() {
	var un = $("#userName").val("");
	var pw = $("#passWord").val("");
	un.focus();
}
