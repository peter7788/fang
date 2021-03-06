<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>联系我们</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<script type="text/javascript" src="js/map.js"></script>
		<script type="text/javascript" src="http://ditu.google.cn/maps/api/js?key=AIzaSyAGKhXCq1rV8H3tualauLpwBr9-YPtw34Q&sensor=FALSE&language=zh-CN"></script>
	</head>
	<body onLoad="map_initialize(1.3318916, 103.8493879, 'DTZ 戴德梁行\n480 大巴窖6巷\n#14-08 建屋发展局(东侧)\n新加坡')">
    	<div class="main">
		<!---start-header---->
		<div class="header">
			<div class="wrap">
			<div class="logo">
				<a href="index.jsp"><img src="images/logo.png" title="logo" /></a>
			</div>
            <div class="top-nav">
				<ul>
					<li><a href="index.jsp">首页</a></li>
                        <li><a href="message.jsp">留言板</a></li>
                        <li><a href="join_us.jsp">加入我们</a></li>
						<li><a href="about.jsp">关于我们</a></li>
						<li class="active"><a href="contact.jsp">联系我们</a></li>
					<div class="clear"> </div>
				</ul>
			</div>
			<div class="clear"> </div>
		</div>
		<!---End-header---->
		</div>
		 <!---start-content---->
		 <div class="contact_content">
		 	<!----start-contact---->
		 	<div class="contact">
		 		<div class="wrap">
				<div class="section group">				
				<div class="col span_1_of_3">
					<div class="contact_info">
			    	 	<h3>找到我们</h3>
                        <div id="map_div" class="company_map"></div>
      				</div>
      				<div class="company_address">
				     	<h3>公司信息 :</h3>
						    	<p>DTZ 戴德梁行</p>
						   		<p>480 大巴窖6巷</p>
						   		<p>#14-08 建屋发展局（东侧）</p>
                                <p>新加坡</p>
				   		<p>手机：+65 8128 9908</p>
				   		<p>电话：+65 6725 3888</p>
                        <p>传真：+65 6822 1128</p>
				 	 	<p>电子邮箱: <span>huijing99@gmail.com</span></p>
                        <p><span>www.dtz.com/sg</span></p>
				   </div>
				</div>				
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h3>联系我们</h3>
					    <form method="post" action="addMessage.action">
					    	<div>
						    	<span><label>姓名</label></span>
						    	<span><input name="userName" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>电子邮箱</label></span>
						    	<span><input name="userEmail" type="text" class="textbox"></span>
						    </div>
						    <div>
						     	<span><label>移动电话</label></span>
						    	<span><input name="userPhone" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>主题</label></span>
						    	<span><textarea name="userMsg"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" class="active" value="确 认"></span>
						  </div>
					    </form>
				    </div>
  				</div>
                <div class="clear"> </div>		
			  </div>
			</div>
			</div><br><br>
		 	<!----End-contact---->
		 </div>
		 <!---End-content---->
         </div>
		 <!---start-copy-right----->
         <jsp:include page="copyright.html" />
		 <!---End-copy-right---->
	</body>
</html>

