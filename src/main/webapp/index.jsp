<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%
	String jsonArray = (String) application.getAttribute("advertisementList");
%>
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>首页</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link href="css/camera.css" rel="stylesheet" type="text/css"  media="all" />
		  <script src="js/jquery.min.js"></script>
          <script src="js/jquery.mobile.customized.min.js"></script>
		  <script type="text/javascript" src="js/jquery.easing.1.3.js"></script> 
		  <script type="text/javascript" src="js/camera.min.js"></script>
		  <script type="text/javascript">
			$(document).ready(function(){
				var htmlString='';
				var advertisementList=eval('('+$('#jsonArray').val()+')');
				for(var i=0; i<advertisementList.length; i++){
					var tempHtmlString='<div data-src="' + advertisementList[i].img_src + '"></div>';
					htmlString += tempHtmlString;
				}
				$('.camera_wrap').html(htmlString);
				//设置滚动页面
				jQuery('#camera_wrap_1').camera({
					height: '400px',
					pagination: false,
					thumbnails: false,
					hover: false,
					opacityOnGrid: false,
					playPause: true,
					time: 1000,
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
						<li class="active"><a href="index.jsp">首页</a></li>
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
        <div class="language"><select name="language">
   					<option value ="zh_CN">简体中文</option>
					<option value ="zh_TW">繁體中文</option>
					<option value ="en">English</option>
					</select></div>
         <div class="language">
         	<input type="text" name="search_text" value="" /><input type="submit" value="搜索" />
         </div>
        <div class="clear"> </div>
		<!--start-second-block---->
        <div class="second_block">
        	<div class="wrap">
         	<div class="manager">
            	<div class="manager_introduction_block">
            		<div class="manager_image"><img src="images/xu.jpg" /></div>
                	<div class="manager_introduction"><br>
                	  <span class="manager_name">许卉菁</span>&nbsp;&nbsp;&nbsp;<span>销售总监</span><br>
                      <p><span class="manager_name">Xu Huijing</span>&nbsp;&nbsp;&nbsp;<span>Sale director</span></p><br>
                    	<p></p>
                        <p>手机：+65 8128 9908</p>
				   		<p>电话：+65 6725 3888</p>
                    	<p>传真：+65 6822 1128</p>
				 		<p>电子邮箱: huijing2014@yahoo.com</p>
                    </div>
                    <div class="clear"> </div>
                </div>
         	</div>
			<a href="join_us.html"><div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
            	<div data-src="images/image1.jpg"></div> 
				<div data-src="images/image2.jpg"></div>
				<div data-src="images/image3.jpg"></div>
			</div></a>
            <!--End-image-slider---->	
            <div class="clear"> </div>     
		</div>
		<!---start-content---->
		 <div class="content">
         	<div class="wrap">
            <div class="menu_div">
        		<ul>
					<li><a href="about.html" title="Our service">我们的服务</a></li>
               	 	<li><a href="http://baike.baidu.com/link?url=rZ3OSfZLrjH1guhgU-NAhFVQT3cUo2vBKu4ZtaCK06Srd22TwoFc-Ceh3Cu7xEfCVd47duHRcCjqAS8HIdojrK" title="Introduction">新加坡简介</a></li>
                	<li><a href="http://www.mfa.gov.sg/content/mfa/overseasmission/beijing/ch/visa_information/bizSocialPRC.html" title="Policy">购房政策</a></li>
					<li><a href="house_blank.jsp" title="Houses Infomation">房源信息</a></li>
               		<li><a href="downloadFile.html" title="Download">下载中心</a></li>
                	<li><a href="contact.html" title="Contact us">联系我们</a></li>
				</ul>
                <div class="clear"> </div>
        	</div>	
		 	<div class="search">
            <div class="search_block">
            	<form method="post" id="searchForm" action="search.action">
                	<table>
                    <tr><td>种类<label></label></td>
   					<td><select name="Species">
   					<option value ="">不限</option>
					<option value ="1">公寓</option>
					<option value ="2">政府组屋</option>
					<option value="3">有地住宅</option>
					<option value="4">商用楼盘</option>
					</select></td></tr>
                    <tr><td>地段<label></label></td>
   					<td><select name="type">
   					<option value ="">不限</option>
					<option value ="1">靠近学校</option>
					<option value ="2">靠近地铁</option>
					<option value="3">医院附近</option>
					<option value="4">交通方便</option>
					</select></td></tr>
					<tr><td>房型<label></label></td>
   					<td><select name="type">
                    <option value ="">不限</option>
   					<option value ="1">一室</option>
					<option value ="2">两室</option>
					<option value ="3">三室</option>
					<option value="4">四室</option>
					<option value="5">四室以上</option>
					</select></td></tr>
					<tr><td>面积<label></label></td>
   					<td><select name="area">
   					<option value ="">不限</option>
					<option value ="50平米以下">50平米以下</option>
					<option value ="50-70平米">50-70平米</option>
					<option value="70-90平米">70-90平米</option>
					<option value="90-110平米">90-110平米</option>
					<option value="110-130平米">110-130平米</option>
					<option value="130-150平米">130-150平米</option>
					<option value="150-200平米">150-200平米</option>
					<option value="200-300平米">200-300平米</option>
					<option value="300-500平米">300-500平米</option>
					<option value="500平米以上">500平米以上</option>
					</select></td></tr>
             		<tr><td>房龄<label></label></td>
   					<td><select name="age">
   					<option value ="">不限</option>
					<option value ="5年以下">5年以下</option>
					<option value ="5-10年">5-10年</option>
					<option value="10-20年">10-20年</option>
					<option value="20年以上">20年以上</option>
					</select></td></tr>
                <tr><td><input type="submit" id="comfirm" value="检索" /></td>
                <td><input type="reset" id="reset" value="重置" /></td>
                </tr>
				</table>
                </form>
            </div>
            <div class="message_block">
            	<p class="title">最新消息</h2>
                <ul>
  					<li><a href="">内环内二手豪宅市场成交大爆发</a></li>
  					<li><a href="">央行降息利好，100万房贷30年可节省9.43万</a></li>
  					<li><a href="">单价5万元以上的高端市场或将持续走高</a></li>
				</ul>
            </div>
             <div class="message_block">
            	<p class="title">邮箱登记</h2>
                <form method="post" id="registerGuest" action="registerGuest.action">
                	<table>
                		<tr><td>用户名称</td><td><input type="text" value="" /></td></tr>
                		<tr><td>用户邮箱</td><td><input type="text" value="" /></td></tr>
                		<tr><td><input type="submit" value="登记" /></td><td><input type="reset" value="重置" /></td></tr>
                	</table>
               	</form>
            </div>
            <div class="message_block">
            	<p class="title">友情链接</h2>
                <ul>
  					<li><a href="">总经理的网站</a></li>
  					<li><a href="">公司网站</a></li>
  					<li><a href="">其他网站</a></li>
				</ul>
            </div>
            </div>
            <div class="result">
            <div class="newest_project">
            	<div class="picture_specify">最新楼盘</div>
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
                <div class="clear"></div>
                <span><a href="">&nbsp;1&nbsp;</a></span><span><a href="">&nbsp;2&nbsp;</a></span><span><a href="">&nbsp;下一页&nbsp;</a></span>
            </div>
            <br><br>
            <div class="hotest_project">
            	<div class="picture_specify">热门推荐</div>
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
                <div class="clear"></div>
                <span><a href="">&nbsp;1&nbsp;</a></span><span><a href="">&nbsp;2&nbsp;</a></span><span><a href="">&nbsp;下一页&nbsp;</a></span>
            </div>
            </div>
            <div class="clear"></div>
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

