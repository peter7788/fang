<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>登录</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link href="css/camera.css" rel="stylesheet" type="text/css"  media="all" />
		  <script src="js/jquery-1.11.1.min.js"></script>
          <script type="text/javascript" src="js/jquery.cookie.js"></script>
		  <script type="text/javascript">
			$(document).ready(function() {
    			//判断"用户名或密码错误"应该展示还是隐藏
    			//if($('#visibility').val()=='hide'){
    			//	$('#loginErrorLabel').hide();
    			//}else{
    			//	$('#loginErrorLabel').show();
    			//}
				$('#loginErrorLabel').hide();
				//设置载入后用cookie自动填充用户名和密码
				fillCookie();
				//用于密码输入时input类型的转换
				$('#loginPassword').focus(function(){
					$(this).attr('type','password');
				}).blur(function(){
					if(this.value == ''){
						$(this).attr('type','text');
					}
				});
				//用于文本框内的提示字体被点击后自动消除和还原
				$('.tableCss').focus(function(){
					if(this.value == this.defaultValue){
						this.value = '';
						$(this).css('color','#000')
					}
				}).blur(function(){
					if(this.value == ''){
						this.value = this.defaultValue;
						$(this).css('color','#CCC')
					}
				});
				//设置登录表单提交时的事件
				$('#loginForm').submit(function(evt){
					if($('#rememberUserName').prop('checked')){
						$.cookie('username',$('#loginAccount').val(),{path:'/',expires:1000});
					}else{
						$.cookie("username",null,{path:'/',expires:0});
					}
					if($('#rememberPassword').prop('checked')){
						$.cookie('password',$('#loginPassword').val(),{path:'/',expires:1000});
					}else{
						$.cookie('password',null,{path:'/',expires:0});
					}
				});
			});
			function fillCookie(){
				var cookie_username = $.cookie('username');
				var cookie_password = $.cookie('password');
				if(typeof(cookie_username) != 'undefined'){
					$('#loginAccount').val(cookie_username);
					$('#loginAccount').css('color','#000');
					$('#rememberUserName').prop('checked',true);
				}
				if(typeof(cookie_password) != 'undefined'){
					$('#loginPassword').val(cookie_password);
					$('#loginPassword').css('color','#000');
					$('#loginPassword').attr('type','password');
					$('#rememberPassword').prop('checked',true);
				}
			}
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
                    	<li class="active"><a href="login.jsp">登录页面</a></li>
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
			<form method="post" id="loginForm" action="login.action">
			<table>
			<tr><td colspan="2"><input type="text" id="loginAccount" name="user_name" class="tableCss" value="账户" /></td></tr>
			<tr><td colspan="2"><input type="text" id="loginPassword" name="user_password" class="tableCss" value="密码" /></td></tr>
			<tr><td></td><td><label id="loginErrorLabel">用户名或者密码不正确</label></td></tr>
			<tr><td><input type="checkbox" id="rememberUserName" /><label>记住用户名</label></td><td><input type="checkbox" id="rememberPassword" /><label>记住密码</label></td>
</tr>
			<tr><td><input type="submit" class="submitClass" value="登录" /></td><td><input type="reset" class="submitClass" value="重置" /></td></tr>
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

