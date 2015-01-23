<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArray = (String) application.getAttribute("advertisementList");
%>
<!--<%@taglib prefix="s" uri="/struts-tags"%>-->
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>管理（滚动页面）</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen">
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.lightbox.js"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				$('.light a').lightBox();
				var htmlString='';
				var advertisementList=eval('('+$('#jsonArray').val()+')');
				htmlString+="<table id='hotest_project_table'><tr><th>URL</th><th>图片标题</th><th>操作</th></tr>";
				for(var i=0; i<advertisementList.length; i++){
					var tempHtmlString='<tr><td>' + advertisementList[i].img_src + '</td> <td>' + advertisementList[i].title + '</td><td><form method="post" id="deleteForm" action="deleteAdvertisement.action"><span>&nbsp;<a href="'+advertisementList[i].img_src+'"><input type="button" value="预览图片" /></a>&nbsp;</span><span><input type="submit" class="submitClass" value="删除" /></span><input type="hidden" name="id" value="' + advertisementList[i].id + '" /></form></td></tr>';
					htmlString += tempHtmlString;
				}
				htmlString+="</table>";
				$('.ad_management_properties').html(htmlString);
				//验证表单
				$('#uploadForm').validate({
					rules:{
						upload:{
							required:true
						},
						title:{
							required:true
						}
					},
					messages:{
						upload:{
							required:"请选择一张图片"
						},
						title:{
							required:"请输入广告标题"
						}
					}
				});
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
						<li><a href="manage_scroll.jsp" class="active">滚动页面</a></li>
               	 		<li><a href="manage_newest_project.jsp">最新楼盘</a></li>
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
                    	<th>URL</th>
                        <th>图片描述</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                    	<td>例子一属性一</td>
                        <td>例子一属性二</td>
                        <td>
                        	<a href="images/example1.jpg"><input type="button" value="预览图片" /></a>
                        	<input type="button" value="删除" />
                        </td>
                    </tr>
                </table>
                </div>
                <div class="add">
                <form method="post" id="uploadForm" action="addAdvertisement.action" enctype="multipart/form-data">
               		<table>
                    	<tr><td>选择图片（960*640）</td><td><input type="file" id="upload" name="upload" class="tableCss" value="" /></td></tr>
                        <tr><td>广告标题</td><td><input type="text" id="title" name="title" class="tableCss" value="" /></td></tr>
                        <tr><td><input type="submit" id="comfirm" value="添加" /></td><td><input type="reset" value="重置" /></td></tr>
                	</table>
                </form>
                </div>
        	</div>
		</div>				
		</div>
        <!---start-copy-right----->
		<div class="copy-right">
			<p>2014 © 华南理工大学 版权所有</p>
            <p>地址：广州市天河区五山路381号/广州市番禺区广州大学城邮政编码：510641/510006</p>
		</div>
		 <!---End-copy-right---->
	</body>
</html>

