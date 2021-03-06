<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArrayNew = (String) application.getAttribute("newHouseInfoList");
	String jsonArrayHot = (String) application.getAttribute("hotHouseInfoList");
	String id;
	String latitude;
	String longitude;
	if(request.getParameter("id") != null){
		id = (String) request.getParameter("id");
	}else{
		id = "1";
	}
	if(request.getParameter("latitude") != null && request.getParameter("longitude") != null){
		latitude = (String) request.getParameter("latitude");
		longitude = (String) request.getParameter("longitude");
	}else{
		latitude = "0";
		longitude = "0";
	}
%>
<!--<%@taglib prefix="s" uri="/struts-tags"%>-->
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>房屋信息</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link rel="stylesheet" type="text/css" href="css/lightbox.css" media="screen">
        <script src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
        <script type="text/javascript" src="js/jquery.lightbox.js"></script>
        <script type="text/javascript" src="js/map.js"></script>
		<script type="text/javascript" src="http://ditu.google.cn/maps/api/js?key=AIzaSyAGKhXCq1rV8H3tualauLpwBr9-YPtw34Q&sensor=FALSE&language=zh-CN"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				var hotHouseInfoList=eval('('+$('#jsonArrayHot').val()+')');
				var newHouseInfoList=eval('('+$('#jsonArrayNew').val()+')');
				var houseInfoList;
				var id=eval('('+$('#id').val()+')');
				var mark=0;
				var htmlString='';
				while(true){
					if(mark==0){
						houseInfoList=hotHouseInfoList;
						mark++;
					}else if(mark==1){
						houseInfoList=newHouseInfoList;
						mark++;
					}else{
						break;
					}
					for(var i=0; i<houseInfoList.length; i++){
						if(houseInfoList[i].id==id){
							var tempHtmlString='<div class="single_image light"><a href="'+ houseInfoList[i].image_url + '"><img src="'+ houseInfoList[i].image_url + '" /></a></div> <div class="house_properties"><table><tr><td>区域</td><td>'+ houseInfoList[i].zone + '</td><td>地址</td><td>'+ houseInfoList[i].address + '</td></tr><tr><td>种类</td><td>'+ houseInfoList[i].sort + '</td><td>地段</td><td>'+ houseInfoList[i].location + '</td></tr><tr><td>面积</td><td>'+ houseInfoList[i].area + '</td><td>价格</td><td>'+ houseInfoList[i].price + '</td></tr><tr><td>房型</td><td>'+ houseInfoList[i].type + '</td><td>朝向</td><td>'+ houseInfoList[i].direction + '</td></tr><tr><td>楼层</td><td>'+ houseInfoList[i].floor + '</td><td>楼龄</td><td>'+ houseInfoList[i].age + '</td></tr><tr><td>装修类型</td><td>'+ houseInfoList[i].decoration + '</td><td>发布时间</td><td>'+ houseInfoList[i].publish_time + '</td></tr></table></div><div class="clear"></div>';
							htmlString += tempHtmlString;
							mark=2;
							break;
						}
					}
				}
				$('.level1').html(htmlString);
			});
		</script>
		</script>
        <script type="text/javascript">
			$(function() {
				$('.light a').lightBox();
			});
		</script>
	</head>
	<body onLoad="map_initialize(<%=latitude%>, <%=longitude%>, 'here')">
    	<input type="hidden" id="jsonArrayNew" value='<%=jsonArrayNew%>' />
        <input type="hidden" id="jsonArrayHot" value='<%=jsonArrayHot%>' />
        <input type="hidden" id="id" value='<%=id%>' />
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
		<!--start-second-block---->
        <div class="second_block">
        	<div class="wrap">
         	<div class="level1">
            	<div class="single_image light"><a href="images/example2.jpg"><img src="images/example2.jpg" /></a></div>
                <div class="house_properties">
                <table>
                	<tr>
                    	<td>区域</td>
                        <td>北京海淀区</td>
                        <td>地址</td>
                        <td>外环东路381号</td>
                    </tr>
                    <tr>
                    	<td>种类</td>
                        <td>政府组屋</td>
                        <td>地段</td>
                        <td>靠近学校</td>
                    </tr>
                    <tr>
                    	<td>面积</td>
                        <td>420平方米</td>
                        <td>价格</td>
                        <td>1316万</td>
                    </tr>
                    <tr>
                    	<td>房型</td>
                        <td>六室</td>
                        <td>朝向</td>
                        <td>坐北向南</td>
                    </tr>
                    <tr>
                    	<td>楼层</td>
                        <td>5</td>
                        <td>楼龄</td>
                        <td>6年</td>
                    </tr>
                    <tr>
                    	<td>装修类型</td>
                        <td>豪装</td>
                        <td>发布时间</td>
                        <td>Sat Jan 24 14:34:52 CST 2015</td>
                    </tr>
                </table>
                </div>
                <div class="clear"></div>
            </div>
            <div class="level2">
				<div id="map_div" class="Gmap"></div>
            </div>
            </div>
		</div>
        </div>
        <!---start-copy-right----->
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>