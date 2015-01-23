<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArray = (String) application.getAttribute("messageList");
%>
<!--<%@taglib prefix="s" uri="/struts-tags"%>-->
<!DOCTYPE HTML>
<html>
	<head>
    	 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		 <title>管理（留言信息）</title>
		 <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		 <link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
         <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
         <script type="text/javascript">
			$(document).ready(function(){
				var htmlString='';
				var messageList=eval('('+$('#jsonArray').val()+')');
				for(var i=0; i<messageList.length; i++){
					var tempHtmlString="<div class='message'><div class='sub_message'><div class='message_span_1'><div class='message_name'><span>" + messageList[i].user_name + "</span></div><div class='message_contact'><div class='email_phone'><span>电子邮箱: </span><span>" + messageList[i].user_email + "</span></div><div class='email_phone'><span>移动电话: </span><span>" + messageList[i].user_phone + "</span></div></div><div class='clear'></div></div><div class='message_span_2'><div class='message_content'>" + messageList[i].content + "</div></div><div class='message_span_3'><div class='message_time'><span><form method='post' id='addNewsForm' action='deleteMessage.action?id=" + messageList[i].id + "' enctype='multipart/form-data'><input type='submit' id='comfirm' value='删除' /></form></span></div><div class='message_time'><span>" + messageList[i].message_time + "</span></div><div class='clear'> </div></div></div></div>";
					htmlString += tempHtmlString;
				}
				$('#message_wrap').html(htmlString);
			});
		 </script>
	</head>
	<body>
    <input type="hidden" id="jsonArray" value='<%=jsonArray%>' />
    	<div class="main">
		<!----start-header---->
			<div class="header">
				<div class="wrap">
				<div class="logo">
					<a href="index.jsp"><img src="images/logo.png" title="logo" /></a>
				</div>
				<div class="top-nav">
					<ul>
						<li><a href="index.jsp">首页</a></li>
                        <li><a href="message.jsp">留言板</a></li>
                        <li><a href="join_us.html">加入我们</a></li>
						<li><a href="about.html">关于我们</a></li>
						<li><a href="contact.html">联系我们</a></li>
						<div class="clear"> </div>
					</ul>
				</div>
				<div class="clear"> </div>
			</div>
		</div>
        <!---End-header---->
		<div class="language">
        <form method="post" id="logoutForm" action="logout.action"><span>&nbsp;<a href="changePassword.html">修改密码</a>&nbsp;</span><span><input type="submit" class="submitClass" value="退出" /></span></form></div>
        <!--start-second-block---->
        <div class="second_block">
        	<div class="wrap">
            	<div class="menu_div">
        			<ul>
						<li><a href="manage_scroll.jsp">滚动页面</a></li>
               	 		<li><a href="manage_newest_project.jsp">最新楼盘</a></li>
                		<li><a href="manage_hotest_project.jsp">热门楼盘</a></li>
						<li><a href="manage_news.jsp">最新消息</a></li>
						<li><a href="manage_downloadFile.jsp">下载文件</a></li>
               			<li><a href="manage_message.jsp" class="active">留言信息</a></li>
                        <li><a href="manage_subscriber.jsp">订阅邮箱</a></li>
					</ul>
                	<div class="clear"> </div>
        		</div>
            </div>
        	<div class="message_wrap" id="message_wrap">
                <!--start-message-->
                <div class="message">
            	<div class="sub_message">
                	<div class="message_span_1">
                    	<div class="message_name">
                        	<span>司马春秋</span>
                        </div>
                        <div class="message_contact">
                        	<div class="email_phone">
                        		<span>电子邮箱: </span><span>simachunqiu@gmail.com</span>
                        	</div>
                       		 <div class="email_phone">
                        		<span>移动电话: </span><span>+86 13698745102</span>
                        	</div>
                        </div>
                        <div class="clear"> </div>
                    </div>
                    <div class="message_span_2">
                    	<div class="message_content">
                        	如果有20万我想买离市区远一点的2室一厅的每天挤公交车上班，如果有50万我就买市内的三室两厅的，如果迟到我可以打的上班，如果有一百万我就再买一个临街小门面。请问....
                        </div>
                    </div>
                    <div class="message_span_3">
                    	 <div class="message_time">
                        	<span><form method="post" id="addNewsForm" action="deleteMessage.action" enctype="multipart/form-data"><input type="submit" id="comfirm" value="删除" /></form></span>
                        </div>
                    	 <div class="message_time">
                        	<span>2014-12-13 23:56</span>
                        </div>
                        <div class="clear"> </div>
                    </div>
              	</div>
                </div>
                <!--end-message-->
            </div>
       	</div>
        <!--end-second-block---->
        </div>
        <!---start-copy-right----->
		 <div class="copy-right">
			<p>2014 © 华南理工大学 版权所有</p>
            <p>地址：广州市天河区五山路381号/广州市番禺区广州大学城邮政编码：510641/510006</p>
		</div>
		<!---End-copy-right---->
	</body>
</html>

