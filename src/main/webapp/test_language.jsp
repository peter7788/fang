<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<script src="js/jquery.min.js"></script>
        <script type="text/javascript">
        	$(document).ready(function(){
				var return_url = window.location.href;//获取当前页面的url
				$('#language_select').change(function(){
					var url = 'changeLanguage.action?request_locale=' + $(this).val();
					location.href = url;
				});
			});
		</script>
		<title>语言切换</title>
	</head>
    <body>
        <div class="language">
        	<select id="language_select" name="language">
            	<option value ="zh_CN">简体中文</option>
                <option value ="zh_TW">繁體中文</option>
                <option value ="en_US">English</option>
                </select>
        </div>
        
        <a href="changeLanguage.action">英文界面</a>
        <a href="changeLanguage.action?request_locale=en_US">英文界面</a>
        
        <p><s:text name="language"/></p>
        <p><s:text name="firstname"/></p>
        <p><s:text name="lastname"/></p>
        <p><s:text name="age"/></p>
    </body>
</html>
