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
		<script type="text/javascript" src="js/jquery.validate.min.js"></script>
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
				//验证表单
				$('#uploadForm').validate({
					rules:{
						zone:{
							required:true
						},
						address:{
							required:true
						},
						sort:{
							required:true
						},
						location:{
							required:true
						},
						area:{
							required:true,
							number:true
						},
						price:{
							required:true
						},
						type:{
							required:true
						},
						direction:{
							required:true
						},
						floor:{
							required:true,
							number:true
						},
						age:{
							required:true,
							number:true
						},
						decoration:{
							required:true
						},
						latitude:{
							required:true
						},
						longitude:{
							required:true
						},
						upload:{
							required:true
						},
						description:{
							required:true
						}
					},
					messages:{
						zone:{
							required:"请输入区域"
						},
						address:{
							required:"请输入地址"
						},
						sort:{
							required:"请输入种类"
						},
						location:{
							required:"请输入地段"
						},
						area:{
							required:"请输入面积",
							number:"仅限输入数字"
						},
						price:{
							required:"请输入价格"
						},
						type:{
							required:"请输入房屋类型"
						},
						direction:{
							required:"请输入房屋朝向"
						},
						floor:{
							required:"请输入楼层",
							number:"仅限输入数字"
						},
						age:{
							required:"请输入楼龄",
							number:"仅限输入数字"
						},
						decoration:{
							required:"请输入装修类型"
						},
						latitude:{
							required:"请输入纬度"
						},
						longitude:{
							required:"请输入经度"
						},
						upload:{
							required:"请选择一幅图片"
						},
						description:{
							required:"请输入房屋描述"
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
                <div class="add">
                <form method="post" id="uploadForm" action="addHouseInfo.action" enctype="multipart/form-data">
               		<table>
                    	<tr><td>区域</td><td><input type="text" id="zone" name="zone" class="tableCss" value="" /></td></tr>
                        <tr><td>地址</td><td><input type="text" id="address" name="address" class="tableCss" value="" /></td></tr>
                        <tr><td>种类</td><td><input type="text" id="sort" name="sort" class="tableCss" value="" /></td></tr>
                        <tr><td>地段</td><td><input type="text" id="location" name="location" class="tableCss" value="" /></td></tr>
                        <tr><td>面积</td><td><input type="text" id="area" name="area" class="tableCss" value="" /></td></tr>
                        <tr><td>价格</td><td><input type="text" id="price" name="price" class="tableCss" value="" /></td></tr>
                        <tr><td>房型</td><td><input type="text" id="type" name="type" class="tableCss" value="" /></td></tr>
                        <tr><td>朝向</td><td><input type="text" id="direction" name="direction" class="tableCss" value="" /></td></tr>
                        <tr><td>楼层</td><td><input type="text" id="floor" name="floor" class="tableCss" value="" /></td></tr>
                        <tr><td>楼龄</td><td><input type="text" id="age" name="age" class="tableCss" value="" /></td></tr>
                        <tr><td>装修类型</td><td><input type="text" id="decoration" name="decoration" class="tableCss" value="" /><input type="hidden" name="mark" value="new" /></td></tr>
                        <tr><td>纬度</td><td><input type="text" id="latitude" name="latitude" class="tableCss" value="" /></td></tr>
                        <tr><td>经度</td><td><input type="text" id="longitude" name="longitude" class="tableCss" value="" /></td></tr>
                    	<tr><td>选择图片（293*200）</td><td><input type="file" id="upload" name="upload" class="tableCss" value="" /></td></tr>
                        <tr><td>房屋描述</td><td><input type="text" id="description" name="description" class="tableCss" value="" /></td></tr>
                        <tr><td><input type="submit" id="comfirm" value="添加" /></td><td><input type="reset" value="重置" /></td></tr>
                	</table>
                </form>
                </div>
        	</div>
		</div>				
		</div>
        <!---start-copy-right----->
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>