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
		<title>文件下载</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript">
			$(document).ready(function(){
				var htmlString='';
				var downloadFileList=eval('('+$('#jsonArray').val()+')');
				htmlString+="<ul>";
				for(var i=0; i<downloadFileList.length; i++){
					var tempHtmlString='<li><a href="downloadFile.action?id=' + downloadFileList[i].id + '">' + downloadFileList[i].title + '</a></li>';
					htmlString += tempHtmlString;
				}
				htmlString+="</ul>";
				$('.download_detail').html(htmlString);
			});
		</script>
	</head>
	<body>
    	<input type="hidden" id="jsonArray" value='<%=jsonArray%>' />
    	<div class="main">
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
		 <!---start-content---->
		 <div class="content">
			<!---start-about---->
			<div class="downloadFile">
				<div class="wrap">
                	<div class="download_title">下载专区</div>
                    <div class="download_detail">
                    	<ul>
                        	<li><a href="downloadFile.action?id=3">合作建议框架</a></li>
                            <li><a href="downloadFile.action?id=3">合作建议框架</a></li>
                            <li><a href="downloadFile.action?id=3">合作建议框架</a></li>
                            <li><a href="downloadFile.action?id=4">合作建议框架</a></li>
                            <li><a href="downloadFile.action?id=4">合作建议框架</a></li>
                        </ul>
                    </div>
		 		</div>
		 	</div>
		 	<!---start-articals------>
		 </div>
		 <!---End-content---->
         </div>
		 <!---start-copy-right----->
         <jsp:include page="copyright.html" />
		 <!---End-copy-right---->
	</body>
</html>

