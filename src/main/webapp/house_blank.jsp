<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArray = (String) application.getAttribute("houseInfoList");
	String pageNum;
	if(request.getParameter("pageNum") != null){
		pageNum = (String) request.getParameter("pageNum");
	}else{
		pageNum = "1";
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
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				var pageNum = $('#pageNum').val();
				var houseInfoList=eval('('+$('#jsonArray').val()+')');
				var total=Math.ceil(houseInfoList.length/8);
				show(pageNum, houseInfoList);
				page(pageNum, total);
				$('#page').on('change','select',function(){
					pageNum=parseInt($('select :selected').val());
					window.location.href = 'house_blank.jsp?pageNum=' + pageNum;
					return false;
				});
			});
			function show(pageNum, houseInfoList){
				var count=8;
				var htmlString='';
				for(var i=(pageNum-1)*8; i<houseInfoList.length; i++){
						var tempHtmlString="<div class='mid-grid'><a href='house.jsp?id=" + houseInfoList[i].id + "'><img src='" + houseInfoList[i].image_url +"' title='" + houseInfoList[i].type + "' /></a><h3>" + houseInfoList[i].zone + " " + houseInfoList[i].type + "</h3><p>" + houseInfoList[i].area + " " + houseInfoList[i].price + "</p><a class='mid-button' href='house.html'>更多</a></div>";
						htmlString += tempHtmlString;
						count--;
						if(count == 0){
							break;
						}
				}
				$('#all_projects').html(htmlString);
			}
			function page(pageNum, total){
				var htmlString='';
				if(pageNum!=1){
					htmlString+='<span><a href="house_blank.jsp?pageNum=' + (parseInt(pageNum)-1) + '">&nbsp;上一页&nbsp;</a></span><span><select name="pageNum">';
				}else{
					htmlString+='<span>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><select name="pageNum">';
				}
				for(var i=1; i<=total; i++){
					var tempHtmlString='<option value="' + i + '"';
					if(i==pageNum){
						tempHtmlString+='selected';
					}
					tempHtmlString+='>' + i + '</option>';
					htmlString+=tempHtmlString;
				}
				if(pageNum!=total){
					htmlString+='</select></span><span><a href="house_blank.jsp?pageNum=' + (parseInt(pageNum)+1) + '">&nbsp;下一页&nbsp;</a></span>';
				}else{
					htmlString+='</select></span><span>&nbsp;&nbsp;&nbsp;&nbsp;</span>';
				}
				$('#page').html(htmlString);
			}
		 </script>
	</head>
	<body>
    	<input type="hidden" id="jsonArray" value='<%=jsonArray%>' />
        <input type="hidden" id="pageNum" value='<%=pageNum%>' />
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
		<!--start-second-block---->
        <div class="second_block">
        	<div class="wrap">
            	<div class="all_project">
            	<div class="picture_specify">全部楼盘</div>
                <div id="all_projects">
            	<div class="mid-grid"><a href="house.html"><img src="images/example1.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                <div class="mid-grid"><a href="house.html"><img src="images/example2.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                <div class="mid-grid"><a href="house.html"><img src="images/example3.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                <div class="mid-grid"><a href="house.html"><img src="images/example4.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                <div class="mid-grid"><a href="house.html"><img src="images/example5.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                <div class="mid-grid"><a href="house.html"><img src="images/example6.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                <div class="mid-grid"><a href="house.html"><img src="images/example7.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                <div class="mid-grid"><a href="house.html"><img src="images/example8.jpg" title="image-name" /></a>
			 		<h3>北京市 海淀区 三房一厅</h3>
			 		<p>66.15平米 170万元</p>
			 		<a class="mid-button" href="house.html">更多</a>
			 	</div>
                </div>
                <div class="clear"></div>
                <div id="page">
                 <span><a href="">&nbsp;上一页&nbsp;</a></span><span><select name="pageNum">
   					<option value="1" selected>1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					</select></span><span><a href="">&nbsp;下一页&nbsp;</a></span>
                </div>
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