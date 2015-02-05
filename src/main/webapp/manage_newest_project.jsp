<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArray = (String) application.getAttribute("newHouseInfoList");
%>
<!--<%@taglib prefix="s" uri="/struts-tags"%>-->
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>管理（最新楼盘）</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen">
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.lightbox.js"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				$('.light a').lightBox();
				var htmlString='';
				var houseInfoList=eval('('+$('#jsonArray').val()+')');
				htmlString+='<table id="hotest_project_table"><tr><th>序号</th><th>区域</th><th>面积</th><th>价格</th><th>发布时间</th><th>操作</th></tr>';
				for(var i=0; i<houseInfoList.length; i++){
					var tempHtmlString='<tr><td>'+houseInfoList[i].id+'</td><td>'+houseInfoList[i].zone+'</td><td>'+houseInfoList[i].area+'</td><td>'+houseInfoList[i].price+'</td><td>'+houseInfoList[i].publish_time+'</td><td><form method="post" id="deleteForm" action="deleteHouseInfo.action"><span>&nbsp;<a href="'+houseInfoList[i].image_url+'"><input type="button" value="预览图片" /></a>&nbsp;</span><span><input type="submit" class="submitClass" value="删除" /></span><input type="hidden" name="id" value="' + houseInfoList[i].id + '" /></form></td></tr>';
					htmlString += tempHtmlString;
				}
				htmlString+='</table>';
				$('.ad_management_properties').html(htmlString);
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
        <div class="language">
        <form method="post" id="logoutForm" action="logout.action"><span>&nbsp;<a href="changePassword.jsp">修改密码</a>&nbsp;</span><span><input type="submit" class="submitClass" value="退出" /></span></form></div>
		<!--start-second-block---->
        <div class="second_block">
       		<div class="wrap">
            	<div class="menu_div">
        			<ul>
						<li><a href="manage_scroll.jsp">滚动页面</a></li>
               	 		<li><a href="manage_newest_project.jsp" class="active">最新楼盘</a></li>
                		<li><a href="manage_hotest_project.jsp">热门楼盘</a></li>
						<li><a href="manage_news.jsp">最新消息</a></li>
						<li><a href="manage_downloadFile.jsp">下载文件</a></li>
               			<li><a href="manage_message.jsp">留言信息</a></li>
                        <li><a href="manage_subscriber.jsp">订阅邮箱</a></li>
					</ul>
                	<div class="clear"> </div>
        		</div>	
                <div class="ad_management_properties light">
                <table id='hotest_project_table'>
                	<tr>
                    	<th>序号</th>
                        <th>区域</th>
                        <th>面积</th>
                        <th>价格</th>
                        <th>发布时间</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                    	<td>23</td>
                        <td>北京东城区</td>
                        <td>2658</td>
                        <td>135000000</td>
                        <td>2014.369874221</td>
                        <td>
                        	<a href="images/example1.jpg"><input type="button" value="预览图片" /></a>
                        	<input type="button" value="删除" />
                        </td>
                    </tr>
                </table>
                </div>
                <div><a href="add.jsp"><input type="button" value="新建项目"></a></div>
        	</div>
		</div>				
		</div>
        <!---start-copy-right----->
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>