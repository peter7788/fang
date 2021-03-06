<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>修改密码</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link href="css/camera.css" rel="stylesheet" type="text/css"  media="all" />
		  <script src="js/jquery-1.11.1.min.js"></script>
          <script type="text/javascript" src="js/jquery.validate.min.js"></script>
		  <script type="text/javascript">
			$(document).ready(function() {
				//验证表单
				$('#changePasswordForm').validate({
					rules:{
						newPassword:{
							onlyLetterNumber:true,
							rangelength:[8,16]
						},
						confirmPassword:{
							equalTo:'#newPassword'
						}
					},
					messages:{
						newPassword:{
							onlyLetterNumber:"密码只能包含数字和英文字母",
							rangelength:"请输入8-16位密码"
						},
						confirmPassword:{
							equalTo:"与上述填写的密码不匹配"
						}
					}
				});
			});
		  </script>
	</head>
	<body>
    	<div class="main">
		<!----start-header---->
			<div class="header">
				<div class="wrap">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" title="logo" /></a>
				</div>
				<div class="top-nav">
					<ul>
                    	<li class="active"><a href="changePassword.html">修改密码</a></li>
						<li><a href="index.jsp">首页</a></li>
                        <li><a href="message.jsp">留言板</a></li>
                        <li><a href="join_us.jsp">加入我们</a></li>
						<li><a href="about.jsp">关于我们</a></li>
						<li><a href="contact.jsp">联系我们</a></li>
						<div class="clear"> </div>
					</ul>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
        <!---End-header---->
        <div class="language"><select name="language">
   					<option value ="zh_CN">简体中文</option>
					<option value ="zh_TW">繁體中文</option>
					<option value ="en">English</option>
					</select></div>
        <div class="clear"> </div>
		<!--start-second-block---->
        <div class="login_div">
        <div id="login">
			<form method="post" id="changePasswordForm" action="changePassword.action">
			<table>
			<tr><td><label>当前密码</label></td><td><input type="password" id="oldPassword" name="old_password" class="tableCss" value="" /></td></tr>
			<tr><td><label>新密码</label></td><td><input type="password" id="newPassword" name="new_password" class="tableCss" value="" /></td></tr>
            <tr><td><label>再次输入新密码</label></td><td><input type="password" id="confirmPassword" name="confirmPassword" class="tableCss" value="" /></td></tr>
			<tr><td><input type="submit" class="submitClass" value="确认" /></td><td><input type="reset" class="submitClass" value="重置" /></td></tr>
			</table>
			</form>
		</div>
        </div>
  	</div>
        <!---start-copy-right----->
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>

