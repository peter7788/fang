<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>加入我们</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link href="css/camera.css" rel="stylesheet" type="text/css"  media="all" />
          <script src="js/jquery.min.js"></script>
          <script src="js/jquery.mobile.customized.min.js"></script>
		  <script type="text/javascript" src="js/jquery.easing.1.3.js"></script> 
		  <script type="text/javascript" src="js/camera.min.js"></script>
		  <script type="text/javascript">
			$(document).ready(function(){
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
                        <li class="active"><a href="join_us.jsp">加入我们</a></li>
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
            <div class="join_us_introduction">
            <div class="join_us_title">加入我们</div>
            <div class="join_us_content"> 自1993年起，DTZ戴德梁行积极开拓中国房地产业务，于北京、长沙、成都、重庆、大连、广州、杭州、南京、南宁、青岛、上海、沈阳、深圳、天津、武汉、厦门、西安及郑州设有正式领有牌照的分公司，为中国首家最具规模的国际房。</div>
            <div class="join_us_content">于2004年成为中国大陆首家获得“全国一级房地产评估资质”的国际房地产公司，在2013年1月至2014年3月期间，本行在大中华区评估的物业总值超过人民币2万亿元
投资及顾问服务：在2013年1月至2014年6月期间，共促成人民币310亿元的成交，当中包括中国最大的成交个案
物业及设施管理：在大中华区130个城市负责物业项目面积超过1.2亿平方米
策略发展顾问：过去5年为中国超过350个地铁站提供策划建议</div>
            <div class="join_us_content">如果你对我们的团队感到兴趣，扫一扫以下二维码，马上加入我们吧！</div>
            <div>
            	<div class="QRCode">
                	<div><img src="images/qq.jpg" title="Helen Xu" /></div>
                    <div>QQ号: 3190688349</div>
                </div>
                <div class="QRCode">
                	<div><img src="images/weixin.png" title="Helen Xu" /></div>
                    <div>微信号: Helen_Xu_Huijing-DTZ</div>
                </div>
                <div class="clear"></div>
            </div>
         	</div>
			<div class="camera_wrap camera_azure_skin" id="camera_wrap_1">
            	<div data-src="images/team001.jpg"></div>
                <div data-src="images/team002.jpg"></div>
                <div data-src="images/team003.jpg"></div>
                <div data-src="images/team004.jpg"></div>
                <div data-src="images/team005.jpg"></div>
                <div data-src="images/team006.jpg"></div>
                <div data-src="images/team007.jpg"></div>
                <div data-src="images/team008.jpg"></div>
                <div data-src="images/team009.jpg"></div>
                <div data-src="images/team010.jpg"></div>
			</div>
            <!--End-image-slider---->	
            <div class="clear"> </div>     
			</div>
        </div>
        </div>
        <!---start-copy-right----->
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>