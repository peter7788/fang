<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArrayNew;
	String jsonArrayHot;
	if(request.getAttribute("searchHouseInfoList") == null){
		jsonArrayNew = (String) application.getAttribute("newHouseInfoList");
		jsonArrayHot = (String) application.getAttribute("hotHouseInfoList");
	}else{
		jsonArrayNew = (String) request.getAttribute("searchHouseInfoList");
		jsonArrayHot = (String) request.getAttribute("blankList");
	}
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
				var newHouseInfoList=eval('('+$('#jsonArrayNew').val()+')');
				var hotHouseInfoList=eval('('+$('#jsonArrayHot').val()+')');
				var total=Math.ceil((newHouseInfoList.length+hotHouseInfoList.length)/8);
				show(pageNum, newHouseInfoList, hotHouseInfoList);
				page(pageNum, total);
				$('#page').on('change','select',function(){
					pageNum=parseInt($('select :selected').val());
					window.location.href = 'house_blank.jsp?pageNum=' + pageNum;
					return false;
				});
			});
			function show(pageNum, newHouseInfoList, hotHouseInfoList){
				var count=8;
				var htmlString='';
				for(var i=(pageNum-1)*8; i<newHouseInfoList.length; i++){
					if(count == 0){
						break;
					}
					var tempHtmlString="<div class='mid-grid'><a href='house.jsp?id=" + newHouseInfoList[i].id + '&latitude=' + newHouseInfoList[i].latitude + '&longitude=' + newHouseInfoList[i].longitude + "'><img src='" + newHouseInfoList[i].image_url +"' title='" + newHouseInfoList[i].type + "' /></a><h3>" + newHouseInfoList[i].zone + " " + newHouseInfoList[i].type + "</h3><p>" + newHouseInfoList[i].area + " " + newHouseInfoList[i].price + "</p><a class='mid-button' href='house.jsp?id=" + newHouseInfoList[i].id + '&latitude=' + newHouseInfoList[i].latitude + '&longitude=' + newHouseInfoList[i].longitude + "'>更多</a></div>";
					htmlString += tempHtmlString;
					count--;
				}
				var j=0;
				if(count==8){
					j=(pageNum-1)*8-newHouseInfoList.length;
				}
				for(var i=j; i<hotHouseInfoList.length; i++){
					if(count == 0){
						break;
					}
					var tempHtmlString="<div class='mid-grid'><a href='house.jsp?id=" + hotHouseInfoList[i].id + '&latitude=' + hotHouseInfoList[i].latitude + '&longitude=' + hotHouseInfoList[i].longitude + "'><img src='" + hotHouseInfoList[i].image_url +"' title='" + hotHouseInfoList[i].type + "' /></a><h3>" + hotHouseInfoList[i].zone + " " + hotHouseInfoList[i].type + "</h3><p>" + hotHouseInfoList[i].area + " " + hotHouseInfoList[i].price + "</p><a class='mid-button' href='house.jsp?id=" + hotHouseInfoList[i].id + '&latitude=' + hotHouseInfoList[i].latitude + '&longitude=' + hotHouseInfoList[i].longitude + "'>更多</a></div>";
					htmlString += tempHtmlString;
					count--;
						
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
    	<input type="hidden" id="jsonArrayNew" value='<%=jsonArrayNew%>' />
        <input type="hidden" id="jsonArrayHot" value='<%=jsonArrayHot%>' />
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
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>