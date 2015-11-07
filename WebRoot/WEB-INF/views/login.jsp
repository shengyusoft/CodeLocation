<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="${ctx}/jslib/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${ctx}/jslib/checkLogin.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/login.css" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录首页</title>
</head>

<script language="javascript">
	var sessionInfo_userId = '${sessionInfo.id}';
	if (sessionInfo_userId) {//如果登录,直接跳转到index页面
		window.location.href = '${ctx}/admin/index';
	}

	//进入页面光标定位在用户名输入框处
	$(document).ready(function() {
		//记住密码checkbox,初始化
		var cookiePwd = '${cookie_passward}';
		if(cookiePwd != null && cookiePwd != ''){
			$('#rpwd').attr('checked','checked');
		}else{
			$('#rpwd').removeAttr('checked');
			$("#password").focus();
		}
	});

	//按enter键直接登录
	document.onkeydown = function(e) {
		var ev = window.event || e;
		if (ev.keyCode == 13) {
			validateLogin();
		}
	};
	
	function changeValidateCode(obj) {
		var currentTime = new Date().getTime();
		obj.src="${ctx}/rand/service?time="+currentTime;
	}
</script>
<body>
	<div class="loginMain">
		<dl>
				<dt>
					<strong>用户名：</strong><input name="loginname" style="width: 120px;"
						class="inputText" type="text"
						onfocus="this.className='inputClick'" value="admin"
						id="loginname" />
				</dt>
				<dt>
					<strong>密　码：</strong><input name="password" style="width: 120px;"
						class="inputText" type="password"
						onfocus="this.className='inputClick'" value="admin"
						id="password" />
				</dt>
				<dt>
					<span style="font-weight: bold; float: left;">验证码：</span> 
					<input name="vercode" id="vercode" style="width: 55px; float: left; margin-top: 5px;"
						class="inputText" type="text" onfocus="this.className='inputClick'"
						onblur="this.className='inputText'" /> 
					<img src="${ctx}/rand/service" onclick="changeValidateCode(this)"
						style="float: left; margin-top: 6px; margin-left: 5px;" />
				</dt>
				<dd style="height: 18px; margin-top:5px; vertical-align: middle; padding: 0 0 0 0;">
				<input type="checkbox" style="margin-left: 0px" id="rpwd" value="1" /><span style="font-size: 7px">记住密码</span>
					<button style="height: 25px; width:92px; margin-left:8px; vertical-align: middle;" onclick="validateLogin()">确认登录</button>
				</dd>
				<tr>
	                <td height="20"><div id="errorimage"></div></td>
	                <td height="20"><div id="error" class="error" style="float: left;"></div></td>
              	</tr>
		</dl>
	</div>
</body>

</html>