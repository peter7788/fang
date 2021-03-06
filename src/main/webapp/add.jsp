<%@ page contentType="text/html; charset=utf-8" %>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
	<head>
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>添加</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.validate.min.js"></script>
         <script language="Javascript">
			$(document).ready(function(){
				//添加图片
				$('.add_picture').on('click','#add_image_button',function(){
					if($(this).parent().prev().prev().prev().children().val() != "" && $(this).parent().prev().children().val() != ""){
						var val=$(this).parent().prev().children().val();
						$(this).parent().parent().parent().append('<div class="add_single_image"><div class="choose">(293*200)</div><div class="choose_image"><input type="file" id="temp" name="temp" class="tableCss" value="" /></div><div class="choose">(65*65)</div><div class="choose_image"><input type="file" id="temp" name="temp" class="tableCss" value="" /></div><div class="add_image_button"><input type="button" id="add_image_button" value="添加"></div><div class="clear"></div></div>');
						$(this).parent().prev().prev().prev().children().attr("id","uploadDisplay");
						$(this).parent().prev().prev().prev().children().attr("name","uploadDisplay");
						$(this).parent().prev().children().attr("id","uploadDisplayThumbnail");
						$(this).parent().prev().children().attr("name","uploadDisplayThumbnail");
						$(this).parent().html('<input type="button" id="delete_image_button" value="删除">');
					}
				});
				//若图片发生变更之后没有选中，则自动删除
				$('.add_picture').on('change','#upload,#uploadThumb',function(){
					if($(this).val()==""){
						$(this).parent().parent().remove();
					}
				});
				//删除图片
				$('.add_picture').on('click','#delete_image_button',function(){
					$(this).parent().parent().remove();
				});
				//增加优点
				$('.add_advantage').on('click','#add_advantage_button',function(){
					var val=$(this).parent().prev().children().val();
					if(val != ""){
						$(this).parent().prev().children().val("");
						$(this).parent().parent().before('<div class="add_single_advantage"><div class="add_advantage_text"><input type="text" id="advantage" name="advantage" class="tableCss" value="' + val + '"></div><div class="add_advantage_button"><input type="button" id="delete_advantage_button" value="删除"></div><div class="clear"></div></div>');
					}
				});
				//若文本发生变更之后值为空，则自动删除
				$('.add_advantage').on('change','#advantage',function(){
					if($(this).val()==""){
						$(this).parent().parent().remove();
					}
				});
				//删除优点
				$('.add_advantage').on('click','#delete_advantage_button',function(){
					$(this).parent().parent().remove();
				});
				//重置
				$('#reset').click(function(){
					$('#uploadDisplay').each(function() {
                        $(this).parent().parent().remove();
                    });
				});
				//文本区域失去焦点
				$('#introduction').blur(function(){
					$('#add_pre').html($(this).val());
				});
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
						uploadDisplay:{
							required:true
						},
						description:{
							required:true
						},
						advantage:{
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
							required:"请输入房龄",
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
						uploadDisplay:{
							required:"请选择一幅图片"
						},
						description:{
							required:"请输入房屋描述"
						},
						advantage:{
							required:"请输入文本"
						}
					}
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
                        <a href="index.jsp"><img src="images/logo.jpg" title="logo" /></a>
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
            <div class="language"><select name="language">
                        <option value ="zh_CN">简体中文</option>
                        <option value ="zh_TW">繁體中文</option>
                        <option value ="en">English</option>
                        </select></div>
             <div class="language">
                <input type="text" name="search_text" value="" /><input type="submit" value="搜索" />
             </div>
            <div class="clear"> </div>
            <div class="add">
                <div class="add_title">新增项目</div>
                <form method="post" id="uploadForm" action="addHouseInfo.action" enctype="multipart/form-data">
                    <div class="basic_properties add_project">
                        <div class="add_project_title">基本属性</div>
                        <div class="project_properties_title">请选择</div><div class="project_properties_text"><select name="mark"><option value ="new">最新楼盘</option><option value ="hot">热门推荐</option></select></div><div class="clear"></div>
                        <div class="project_properties_title">区域</div><div class="project_properties_text"><input type="text" id="zone" name="zone" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">地址</div><div class="project_properties_text"><input type="text" id="address" name="address" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">种类</div><div class="project_properties_text"><input type="text" id="sort" name="sort" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">地段</div><div class="project_properties_text"><input type="text" id="location" name="location" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">面积</div><div class="project_properties_text"><input type="text" id="area" name="area" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">价格</div><div class="project_properties_text"><input type="text" id="price" name="price" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">房型</div><div class="project_properties_text"><input type="text" id="type" name="type" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">朝向</div><div class="project_properties_text"><input type="text" id="direction" name="direction" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">楼层</div><div class="project_properties_text"><input type="text" id="floor" name="floor" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">楼龄</div><div class="project_properties_text"><input type="text" id="age" name="age" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">装修类型</div><div class="project_properties_text"><input type="text" id="decoration" name="decoration" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">纬度</div><div class="project_properties_text"><input type="text" id="latitude" name="latitude" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">经度</div><div class="project_properties_text"><input type="text" id="longitude" name="longitude" class="tableCss" value="" /></div><div class="clear"></div>
                        <div class="project_properties_title">房屋描述</div><div class="project_properties_text"><input type="text" id="description" name="description" class="tableCss" value="" /></div><div class="clear"></div>
                    </div>
                    <div class="add_picture add_project">
                        <div class="add_project_title">布局图片</div>
                        <div class="add_single_image">
                            <div class="choose">(293*200)</div>
                            <div class="choose_image"><input type="file" id="temp" name="temp" class="tableCss" value="" /></div>
                            <div class="choose">(100*80)</div>
                            <div class="choose_image"><input type="file" id="temp" name="temp" class="tableCss" value="" /></div>
                            <div class="add_image_button"><input type="button" id="add_image_button" value="添加"></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="add_location_map add_project">
                        <div class="add_project_title">Location Map</div>
                        <div class="add_single_image">
                            <div class="choose">(293*200)</div>
                            <div class="choose_image"><input type="file" id="uploadLocationMap" name="uploadLocationMap" class="tableCss" value="" /></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="add_site_plan add_project">
                        <div class="add_project_title">Site Plan</div>
                        <div class="add_single_image">
                            <div class="choose">(293*200)</div>
                            <div class="choose_image"><input type="file" id="uploadSitePlan" name="uploadSitePlan" class="tableCss" value="" /></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="add_floor_plan add_project">
                        <div class="add_project_title">Floor Plan</div>
                        <div class="add_single_image">
                            <div class="choose">(293*200)</div>
                            <div class="choose_image"><input type="file" id="uploadFloorPlan" name="uploadFloorPlan" class="tableCss" value="" /></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="add_e_brochure add_project">
                        <div class="add_project_title">E-brochure</div>
                        <div class="add_single_image">
                            <div class="choose">(293*200)</div>
                            <div class="choose_image"><input type="file" id="uploadEBrochure" name="uploadEBrochure" class="tableCss" value="" /></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="add_advantage add_project">
                        <div class="add_project_title">优点</div>
                        <div class="add_single_advantage">
                            <div class="add_advantage_text"><input type="text" id="temp_advantage" name="temp_advantage" class="tableCss" value=""></div>
                            <div class="add_advantage_button"><input type="button" id="add_advantage_button" value="添加"></div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="add_other_textarea add_project">
                        <div class="add_project_title">文档文本</div>
                        <div class="add_textarea_title">输入</div>
                        <div class="add_single_textarea"><textarea id="introduction" name="introduction"></textarea></div>
                        <div class="add_textarea_title">预览</div>
                        <div class="pre_div">
                            <pre id="add_pre"></pre>
                        </div>
                    </div>
                    <div class="add_button"><input type="submit" id="comfirm" value="确定" /></div>
                    <div class="add_button"><input type="reset" id="reset" value="重置" /></div>
                    <div class="clear"></div>
                </form>
            </div>
    	</div>
        <!---start-copy-right----->
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>