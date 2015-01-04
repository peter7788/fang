<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArray = (String) application.getAttribute("houseInfoList");
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
        <script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.lightbox.js"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				$('.light a').lightBox();
				var htmlString='';
				var houseInfoList=eval('('+$('#jsonArray').val()+')');
				htmlString+='<table id="hotest_project_table"><tr><th>序号</th><th>区域</th><th>面积</th><th>价格</th><th>发布时间</th><th>操作</th></tr>';
				for(var i=0; i<houseInfoList.length; i++){
					if(houseInfoList[i].mark=="new"){
						var tempHtmlString='<tr><td>'+houseInfoList[i].id+'</td><td>'+houseInfoList[i].zone+'</td><td>'+houseInfoList[i].area+'</td><td>'+houseInfoList[i].price+'</td><td>'+houseInfoList[i].publish_time+'</td><td><form method="post" id="deleteForm" action="deleteHouseInfo.action"><span>&nbsp;<a href="'+houseInfoList[i].image_url+'"><input type="button" value="预览图片" /></a>&nbsp;</span><span><input type="submit" class="submitClass" value="删除" /></span><input type="hidden" name="id" value="' + houseInfoList[i].id + '" /></form></td></tr>';
						htmlString += tempHtmlString;
					}
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
                        <li><a href="house.html">房屋信息</a></li>
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
        <div class="clear"> </div>
		<!--start-second-block---->
        <div class="second_block">
       		<div class="wrap">
            	<div class="menu_div">
        			<ul>
						<li><a href="manage_scroll.jsp">滚动页面</a></li>
               	 		<li><a href="manage_newest_project.jsp" class="active">最新楼盘</a></li>
                		<li><a href="manage_hotest_project.jsp">热门楼盘</a></li>
						<li><a href="manage_news.jsp">最新消息</a></li>
						<li></li>
               			<li></li>
                		<li></li>
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
                <div class="add">
                <form method="post" id="uploadForm" action="addHouseInfo.action" enctype="multipart/form-data">
               		<table>
                    	<tr><td>区域</td><td><input type="text" name="zone" class="tableCss" value="" /></td></tr>
                        <tr><td>地址</td><td><input type="text" name="address" class="tableCss" value="" /></td></tr>
                        <tr><td>面积</td><td><input type="text" name="area" class="tableCss" value="" /></td></tr>
                        <tr><td>价格</td><td><input type="text" name="price" class="tableCss" value="" /></td></tr>
                        <tr><td>房型</td><td><input type="text" name="type" class="tableCss" value="" /></td></tr>
                        <tr><td>朝向</td><td><input type="text" name="direction" class="tableCss" value="" /></td></tr>
                        <tr><td>楼层</td><td><input type="text" name="floor" class="tableCss" value="" /></td></tr>
                        <tr><td>楼龄</td><td><input type="text" name="age" class="tableCss" value="" /></td></tr>
                        <tr><td>装修类型</td><td><input type="text" name="decoration" class="tableCss" value="" /><input type="hidden" name="mark" value="new" /></td></tr>
                    	<tr><td>选择图片</td><td><input type="file" name="upload" class="tableCss" value="" /></td></tr>
                        <tr><td>描述</td><td><input type="text" name="description" class="tableCss" value="" /></td></tr>
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