<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/jslib/checkLogin.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/login.css" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录首页</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:hidden;
}
.STYLE3 {color: #528311; font-size: 12px; float: left}
.STYLE4 {
	color: #42870a;
	font-size: 12px;
}	
-->
</style></head>

<script language="javascript">
	var sessionInfo_userId = '${sessionInfo.id}';
	if (sessionInfo_userId) {//如果登录,直接跳转到index页面
		window.location.href='${ctx}/admin/index';
	}
	
	//进入页面光标定位在用户名输入框处
	$(document).ready(function(){
    	$("#loginname").focus();
	});
	
	//按enter键直接登录
	document.onkeydown = function(e){
		var ev = window.event||e;
		if(ev.keyCode==13){
			validateLogin();
		}
	};	
</script>

<body>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td bgcolor="#e5f6cf">&nbsp;</td>
		</tr>
		<tr>
    <td height="608" background="${pageContext.request.contextPath}/style/images/login_03.gif"><table width="862" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="266" background="${pageContext.request.contextPath}/style/images/login_04.gif">&nbsp;</td>
      </tr>
      <tr>
        <td height="95"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="424" height="95" background="${pageContext.request.contextPath}/style/images/login_06.gif">&nbsp;</td>
            <td width="183" background="${pageContext.request.contextPath}/style/images/login_07.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="30%" height="30"><div align="center"><span class="STYLE3">用户名:</span></div></td>
                <td width="70%" height="30"><input type="text" id="loginname" name="loginname"  style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
                <td width="30%" height="30"><div align="center"><span class="STYLE3">密&nbsp;&nbsp;码:</span></div></td>
                <td width="70%" height="30"><input type="password" id="password" name="password"  style="height:18px; width:130px; border:solid 1px #cadcb2; font-size:12px; color:#81b432;"></td>
              </tr>
              <tr>
                <td height="20"><div id="errorimage"></div></td>
                <td height="20"><div id="error" style="color:red;font-size: 12px;font-weight:bold;"></div></td>
              </tr>
            </table></td>
            <td width="255" background="${pageContext.request.contextPath}/style/images/login_08.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="247" valign="top" background="${pageContext.request.contextPath}/style/images/login_09.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="22%" height="30">&nbsp;</td>
            <td width="24%"></td>
            <td width="8%">&nbsp;</td>
			<td width="24%"><img src="${pageContext.request.contextPath}/style/images/dl.gif" width="81" height="22" border="0" usemap="#Map"></td>
			<td width="22%"></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td height="30"><table width="92%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="85%" height="20"></td>
                <td width="15%" ><br><br></td>
              </tr>
            </table></td>
            <td colspan="2" class="STYLE4">&nbsp;版本 2014 author by 皖通科技</td>
			<td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#a2d962">&nbsp;</td>
  </tr>
</table>

<map name="Map"><area shape="rect" coords="3,3,36,19" href="#" onclick="validateLogin();"><area shape="rect" coords="40,3,78,18" href="#" onclick="formReset();"></map></body>
</html>