<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArray = (String) application.getAttribute("downloadFileList");
%>
<!--<%@taglib prefix="s" uri="/struts-tags"%>-->
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>管理（下载文件）</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				var htmlString='';
				var downloadFileList=eval('('+$('#jsonArray').val()+')');
				htmlString+="<table id='hotest_project_table'><tr><th>URL</th><th>文件名</th><th>操作</th></tr>";
				for(var i=0; i<downloadFileList.length; i++){
					var tempHtmlString='<tr><td>' + downloadFileList[i].file_url + '</td> <td>' + downloadFileList[i].title + '</td><td><form method="post" id="deleteForm" action="deleteDownloadFile.action"><span><input type="submit" class="submitClass" value="删除" /></span><input type="hidden" name="id" value="' + downloadFileList[i].id + '" /></form></td></tr>';
					htmlString += tempHtmlString;
				}
				htmlString+="</table>";
				$('.ad_management_properties').html(htmlString);
				//验证表单
				$('#uploadForm').validate({
					rules:{
						upload:{
							required:true
						}
					},
					messages:{
						upload:{
							required:"请选择一个文件"
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
						<li><a href="manage_scroll.jsp">滚动页面</a></li>
               	 		<li><a href="manage_newest_project.jsp">最新楼盘</a></li>
                		<li><a href="manage_hotest_project.jsp">热门楼盘</a></li>
						<li><a href="manage_news.jsp">最新消息</a></li>
						<li><a href="manage_downloadFile.jsp" class="active">下载文件</a></li>
               			<li></li>
					</ul>
                	<div class="clear"> </div>
        		</div>	
                <div class="ad_management_properties light">
                <table id='hotest_project_table'>
                	<tr>
                    	<th>URL</th>
                        <th>文件名</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                    	<td>例子一属性一</td>
                        <td>例子一属性二</td>
                        <td>
                        	<input type="button" value="删除" />
                        </td>
                    </tr>
                </table>
                </div>
                <div class="add">
                <form method="post" id="uploadForm" action="addDownloadFile.action" enctype="multipart/form-data">
               		<table>
                    	<tr><td>选择文件</td><td><input type="file" id="upload" name="upload" class="tableCss" value="" /></td></tr>
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

