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
        <link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<link href="css/slider.css" rel="stylesheet" type="text/css"  media="all" />
        <link rel="stylesheet" type="text/css" href="css/leave_message.css">
        <link rel="stylesheet" type="text/css" href="css/jquery.ad-gallery.css">
        <link rel="stylesheet" type="text/css" href="css/self_gallery.css">
        <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="js/jquery.ad-gallery.min.js"></script>
        <script type="text/javascript" src="js/map.js"></script>
		<script type="text/javascript" src="http://ditu.google.cn/maps/api/js?key=AIzaSyAGKhXCq1rV8H3tualauLpwBr9-YPtw34Q&sensor=FALSE&language=zh-CN"></script>
        <script type="text/javascript" src="js/forbid_copy.js"></script>
        <script type="text/javascript" language="javascript" src="http://www.streetdirectory.com/js/map_api/m.php"></script>
        <script type="text/javascript" src="js/streetdirectory_map.js"></script>
        <script language="Javascript">
			$(document).ready(function(){
				//预处理界面
				$('#project_detail').css('position','static');
				$('#location_map').css('position','absolute');
				$('#location_map').css('left','-10000px');
				$('#site_plan').css('position','absolute');
				$('#site_plan').css('left','-10000px');
				$('#floor_plans').css('position','absolute');
				$('#floor_plans').css('left','-10000px');
				$('#contact_us').css('position','absolute');
				$('#contact_us').css('left','-10000px');
				//超链接点击的事件
				$('#project_detail_a').click(function(){
					$('#project_detail_a').attr('class', 'active');
					$('#location_map_a').removeAttr('class');
					$('#site_plan_a').removeAttr('class');
					$('#floor_plans_a').removeAttr('class');
					$('#contact_us_a').removeAttr('class');
					$('#project_detail').css('position','static');
					$('#location_map').css('position','absolute');
					$('#location_map').css('left','-10000px');
					$('#site_plan').css('position','absolute');
					$('#site_plan').css('left','-10000px');
					$('#floor_plans').css('position','absolute');
					$('#floor_plans').css('left','-10000px');
					$('#contact_us').css('position','absolute');
					$('#contact_us').css('left','-10000px');
				});
				$('#location_map_a').click(function(){
					$('#project_detail_a').removeAttr('class');
					$('#location_map_a').attr('class', 'active');
					$('#site_plan_a').removeAttr('class');
					$('#floor_plans_a').removeAttr('class');
					$('#contact_us_a').removeAttr('class');
					$('#project_detail').css('position','absolute');
					$('#project_detail').css('left','-10000px');
					$('#location_map').css('position','static');
					$('#site_plan').css('position','absolute');
					$('#site_plan').css('left','-10000px');
					$('#floor_plans').css('position','absolute');
					$('#floor_plans').css('left','-10000px');
					$('#contact_us').css('position','absolute');
					$('#contact_us').css('left','-10000px');
				});
				$('#site_plan_a').click(function(){
					$('#project_detail_a').removeAttr('class');
					$('#location_map_a').removeAttr('class');
					$('#site_plan_a').attr('class', 'active');
					$('#floor_plans_a').removeAttr('class');
					$('#contact_us_a').removeAttr('class');
					$('#project_detail').css('position','absolute');
					$('#project_detail').css('left','-10000px');
					$('#location_map').css('position','absolute');
					$('#location_map').css('left','-10000px');
					$('#site_plan').css('position','static');
					$('#floor_plans').css('position','absolute');
					$('#floor_plans').css('left','-10000px');
					$('#contact_us').css('position','absolute');
					$('#contact_us').css('left','-10000px');
				});
				$('#floor_plans_a').click(function(){
					$('#project_detail_a').removeAttr('class');
					$('#location_map_a').removeAttr('class');
					$('#site_plan_a').removeAttr('class');
					$('#floor_plans_a').attr('class', 'active');
					$('#contact_us_a').removeAttr('class');
					$('#project_detail').css('position','absolute');
					$('#project_detail').css('left','-10000px');
					$('#location_map').css('position','absolute');
					$('#location_map').css('left','-10000px');
					$('#site_plan').css('position','absolute');
					$('#site_plan').css('left','-10000px');
					$('#floor_plans').css('position','static');
					$('#contact_us').css('position','absolute');
					$('#contact_us').css('left','-10000px');
				});
				$('#contact_us_a').click(function(){
					$('#project_detail_a').removeAttr('class');
					$('#location_map_a').removeAttr('class');
					$('#site_plan_a').removeAttr('class');
					$('#floor_plans_a').removeAttr('class');
					$('#contact_us_a').attr('class', 'active');
					$('#project_detail').css('position','absolute');
					$('#project_detail').css('left','-10000px');
					$('#location_map').css('position','absolute');
					$('#location_map').css('left','-10000px');
					$('#site_plan').css('position','absolute');
					$('#site_plan').css('left','-10000px');
					$('#floor_plans').css('position','absolute');
					$('#floor_plans').css('left','-10000px');
					$('#contact_us').css('position','static');
				});
				//处理打开表格的操作
				//打开窗口
				$('[id=open_windows]').click(function(){
					$('.hide_div').css("display","block");
					$('.hide_mask').css("display","block");
				});
				//关闭窗口
				$('#close_button,.hide_submit_button').click(function(){
					$('.hide_div').css("display","none");
					$('.hide_mask').css("display","none");
				});
				//显示协议
				$('#open_agreement').click(function(){
					$('.hide_agreement').css("display","block");
				});
				//提交按钮的disable
				$('#hide_name,#hide_email,#hide_phone,#hide_checkbox').change(function(){
					if($('#hide_name').val()!=""&&$('#hide_email').val()!=""&&$('#hide_phone').val()!=""&&$('#hide_checkbox').is(":checked")){
						$('.hide_submit_button').removeAttr("disabled");
					}else{
						$('.hide_submit_button').attr("disabled","disabled");
					}
				});
				//填充项目信息
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
							var array_display_images_url=houseInfoList[i].display_images_url.split(";");
							var array_display_thumbnail_images_url=houseInfoList[i].display_thumbnail_images_url.split(";");
							var array_location_map_url=houseInfoList[i].location_map_url.split(";");
							var array_site_plan_url=houseInfoList[i].site_plan_url.split(";");
							var array_floor_plan_url=houseInfoList[i].floor_plan_url.split(";");
							var array_e_brochure_url=houseInfoList[i].e_brochure_url.split(";");
							var array_advantage=houseInfoList[i].advantage.split(";");
							var introduction=houseInfoList[i].introduction;
							//设置展示图片
							htmlString='';
							for (var j=0;j<array_display_images_url.length-1;j++){
								htmlString += '<li><a href="' + array_display_images_url[j] + '"><img src="' + array_display_thumbnail_images_url[j] + '" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg"></a></li>';
							}
							$('.ad-thumb-list').html(htmlString);
							//设置简介
							$('#add_pre').html(introduction);
							//设置location map
							htmlString='';
							htmlString += '<img src="' + array_location_map_url[0] + '" />';
							$('#location_map_div').html(htmlString);
							//设置site plan
							htmlString='';
							htmlString += '<img src="' + array_site_plan_url[0] + '" />';
							$('#site_plan_div').html(htmlString);
							//设置floor plan
							//htmlString='';
							//htmlString += '';
							//$('').html(htmlString);
							//设置E-Brochure
							//htmlString='';
							//htmlString += '';
							//$('').html(htmlString);
							//设置优点
							htmlString='';
							for (var j=0;j<array_advantage.length-1;j++){
								htmlString += '<li>' + array_advantage[j] + '</li>';
							}
							$('#advantage_ul').html(htmlString);
							
							mark=2;
							break;
						}
					}
				}
				//显示slider gallery
				var galleries = $('.ad-gallery').adGallery();
			});
		</script>
		<title>新版房屋信息</title>
	</head>
	<body onLoad="initialize();map_initialize(<%=latitude%>, <%=longitude%>, 'here');">
    	<input type="hidden" id="jsonArrayNew" value='<%=jsonArrayNew%>' />
        <input type="hidden" id="jsonArrayHot" value='<%=jsonArrayHot%>' />
        <input type="hidden" id="id" value='<%=id%>' />
    	<!--start-需要填写的表格-->
    	<div class="hide_mask"></div>
        <div class="hide_div">
            <div class="hide_head">
                <div class="hide_title">Fill up form correctly to download file</div>
                <div class="hide_close_button"><a href="#" id="close_button" title="关闭">×</a></div>
                <div class="clear"></div>
                <div class="hide_simple_agreement">
                    <p>1.Remember to enable popup to allow the PDF file download.</p>
                    <p>2.By submiting this form, you are deemed to have <a href="#" id="open_agreement">agreed to this agreement</a>.</p>
                </div>
            </div>
            <div class="hide_body">
                <hr /><br />
                 <div class="hide_agreement">
                  <p>DTZ个人信息收集及使用同意书</p>
                  <P>DTZ, Co., Ltd（戴德梁行，以下简称“公司”)为了提供房屋项目下载服务(以下简称“服务”)，收集以下信息。公司只收集用于提供服务的最少信息，并不会收集用户的敏感信息或唯一识别信息。</p>
                  <p>(1) 收集项目 </p>
                  <p>① 在服务的过程中收集的个人信息：姓名、电子邮件地址、电话号码</p>
                  <p>(2) 收集及使用目的</p>
                  <p>- 提供服务，并管理用户</p>
                  <p>- 用户改善服务、营销及广告</p>
                  <p>- 服务中VOC及CS应对</p>
                  <p>- 发送主要公告等通知邮件(例如：给新注册会员发送欢迎邮件等)</p> 
                  <p>(3) 保存及使用期限 </p>
                  <p>至达成个人信息收集及使用目的为止(但根据相关法律法规规定有必要保存个人信息时，则遵守该规定</p>
                  <p>※ 您有权拒绝同意个人信息收集及使用条款。拒绝时，使用本服务将受到限制。</p>
                  <p>※ 有关个人信息处理的详细内容请参照隐私保护政策。如隐私保护政策与本同意书的内容有冲突时，以本同意书的内容为准。</p>
               </div>
                <form method="post" action="">
                    <div class="hide_input_title">Your Name(required)</div>
                    <div class="hide_input_text"><input type="text" id="hide_name" value="" /></div>
                    <div class="hide_input_title">Your Email(required)</div>
                    <div class="hide_input_text"><input type="text" id="hide_email" value="" /></div>
                    <div class="hide_input_title">Your Phone(required)</div>
                    <div class="hide_input_text"><input type="text" id="hide_phone" value="" /></div>
                    <div class="hide_input_title">Your Message</div>
                    <div class="hide_input_text"><textarea class="hide_textarea"></textarea></div>
                    <div><input type="checkbox" class="hide_checkbox" id="hide_checkbox" />I agree the licence.</div>
                    <div><input type="submit" class="hide_submit_button" value="提交" disabled="disabled" /></div>
                </form>
            </div>
        </div>
        <!--end-需要填写的表格-->
    	<div class="main">
		<!---start-header---->
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
		<!---End-header---->
        </div>
        <div class="project_wrap">
            <a name="point"></a>
            <div class="project_menu_div">
                <ul>
                    <li><a href="#" id="project_detail_a" class="active">Project Details</a></li>
                    <li><a href="#" id="location_map_a">Location Map</a></li>
                    <li><a href="#" id="site_plan_a">Site Plan</a></li>
                    <li><a href="#" id="floor_plans_a">Floor Plans</a></li>
                    <li><a href="#" id="contact_us_a">Contact us</a></li>
                </ul>
                <div class="clear"> </div>
            </div>
            <!---start-content---->
            <div id="project_detail" class="content">
                <div class="project_title">Photos, Videos and Virtual Tours</div>
                <div class="e_brochure"><a href="#" id="open_windows" title="下载"><img src="images/e_brochure.jpg"></a></div>
                <div class="clear"></div>
                <!---start-gallery---->
                <div id="gallery" class="ad-gallery">
                    <div class="ad-image-wrapper">
                    </div>
                    <div class="ad-controls">
                    </div>
                    <div class="ad-nav">
                        <div class="ad-thumbs">
                          <ul class="ad-thumb-list">
                            <li>
                              <a href="uploadFiles/V1.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V1.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V2.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V2.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V3.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V3.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V4.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V4.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V5.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V5.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V6.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V6.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V7.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V7.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V8.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V8.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V9.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V9.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V10.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V10.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V11.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V11.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                            <li>
                              <a href="uploadFiles/V12.jpg">
                                <img src="uploadFiles/thumbs/thumbnail_V12.jpg" title="A title for 1.jpg" alt="This is a nice, and incredibly descriptive, description of the image v1.jpg">
                              </a>
                            </li>
                          </ul>
                        </div>
                    </div>
                </div>
                <!---end-gallery---->
                <div class="project_properties">
                    <table>
                        <tr>
                            <td width="30%">区域</td>
                            <td width="70%">北京海淀区</td>
                        </tr>
                        <tr>
                            <td>地址</td>
                            <td>外环东路381号</td>
                        </tr>
                        <tr>
                            <td>种类</td>
                            <td>政府组屋</td>
                        </tr>
                        <tr>
                            <td>地段</td>
                            <td>靠近学校</td>
                        </tr>
                        <tr>
                            <td>面积</td>
                            <td>420平方米</td>
                        </tr>
                        <tr>
                            <td>价格</td>
                            <td>1316万</td>
                        </tr>
                        <tr>
                            <td>房型</td>
                            <td>六室</td>
                        </tr>
                        <tr>
                            <td>朝向</td>
                            <td>坐北向南</td>
                        </tr>
                        <tr>
                            <td>楼层</td>
                            <td>5</td>
                        </tr>
                        <tr>
                            <td>楼龄</td>
                            <td>6年</td>
                        </tr>
                        <tr>
                            <td>装修类型</td>
                            <td>豪装</td>
                        </tr>
                        <tr>
                            <td>发布时间</td>
                            <td>Sat Jan 24 14:34:52 CST 2015</td>
                        </tr>
                    </table>
                </div>
                <div class="project_introduction">
                    <pre id="add_pre">
Lakeville @ Lakeside is a 99-years leasehold condominium development located at Jurong West Street 41, Singapore in District 22. A highly anticipated development, it is comprised of 6-storey buildings with a total of 696 residential units, well-furnished with a comprehensive selection of communal facilities for exclusive use. TOP is estimated to be obtained in 2018.

Situated in a highly convenient and accessible location, residents have ease of access to various locations across Singapore. Being just a short distance away from Chinese Garden and Lakeside MRT stations, with bus stops right at your doorstep and access to major expressways including Ayer Rajah Expressway (AYE), Pan-Island Expressway (PIE) and Marina coastal Expressway (MCE), travelling cannot get any more convenient. Commuting to school is easy as various reputable schools and institutions such as Rulang Primary School, Canadian International School, Fuhua Secondary School and National University of Singapore, are located in close proximity to the residence.

A choice location, with a whole kaleidoscope of activties and amenities available residents are presented with a wide range of choice. Residents can shop till they drop at JCube, GEM, Jurong Point and IMM, found right within the vicinity of their apartments, or simply head over to Jurong Swimming Complex, Jurong East stadium or Jurong Green Community Club, where they can engage in various recreational activities. 
                    </pre>
                </div>
                <div class="project_subtitle">Unique Feature of 城市绿地</div>
                <div>
                    <ul id="advantage_ul">
                      <li>Development by renowned Guoco Land</li>
                      <li>Only 5 min walk to Aljunied Mrt</li>
                      <li>1 Mrt station away from Paya Lebar Mrt/Interchange, Commercial Hub</li>
                      <li>Walk to nearby Sims Vista Market, Food Centre, schools and library</li>
                      <li>Ten minutes drive to CBD, Marina Bay</li>
                      <li>Two Olympic size swimming pool, tennis court, extensive gym for all ages, large lawn, Barbeque pavillions, jogging track and poolside cabanas</li>
                      <li>Units designed with SOHO, Dual key concept, with premium fittings</li>
                  </ul>
                </div>
                <div class="project_subtitle">Related Projects</div>
                <!---start-related-project---->
                <div class="related_project">
                    <div class="related_project_img"><img src="uploadFiles/V9.jpg"></div>
                    <div class="related_project_word">
                        <div class="related_project_word_title">Sims Urban Oasis | 盛世名园</div>
                        <div class="related_project_word_introduction">Developed by one of Singapore's renowned luxury developer, GuocoLanc aims to transform the sleepy, quiet Sims Drive area with an iconic first-of-its-kind prime...</div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!---end-related-project---->
                <!---start-related-project---->
                <div class="related_project">
                    <div class="related_project_img"><img src="uploadFiles/V9.jpg"></div>
                    <div class="related_project_word">
                        <div class="related_project_word_title">Rezi 3Two - Geylang Freehold Condo</div>
                        <div class="related_project_word_introduction">Developed by one of Singapore's renowned luxury developer, GuocoLanc aims to transform the sleepy, quiet Sims Drive area with an iconic first-of-its-kind prime...</div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!---end-related-project---->
            </div>
            <!---end-content---->
            <!---start-content---->
            <div id="location_map" class="content">
                <div class="project_title">The Location Map</div>
                <div class="e_brochure"><a href="#" id="open_windows" title="下载"><img src="images/e_brochure.jpg"></a></div>
                <div class="clear"></div>
                <div class="project_content">Interested to be the first few to unravel the secret plus point of this property location? Let us share our expertise & knowledge with you. Contact us today!</div>
                <div id="location_map_div"><img src="uploadFiles/CW_location map.jpg" /></div>
                <div id="map_div" class="Gmap"></div>
                <div id="streetdirectory_div" style="width:600px; height:600px"></div>
            </div>
            <!---end-content---->
            <!---start-content---->
            <div id="site_plan" class="content">
                <div class="project_title">The Site Plan</div>
                <div class="e_brochure"><a href="#" id="open_windows" title="下载"><img src="images/e_brochure.jpg"></a></div>
                <div class="clear"></div>
                <div class="project_content">Below site plan shows the architectural representation of the development project. If you require detailed information and presentation, contact us today!</div>
                <div id="site_plan_div"><img src="uploadFiles/Site plan FINAL.jpg" /></div>
            </div>
            <!---end-content---->
            <!---start-content---->
            <div id="floor_plans" class="content">
                <div class="project_title">The Floor Plan</div>
                <div class="e_brochure"><a href="#" id="open_windows" title="下载"><img src="images/e_brochure.jpg"></a></div>
                <div class="clear"></div>
                <div class="project_content">Choosing the right floor plan to suit your needs is essential and can be stressful. If you need help to discuss on its layouts, facing and direction, contact us today!</div>
                <div><img src="uploadFiles/Site plan FINAL.jpg" /></div>
            </div>
            <!---end-content---->
            <!---start-content---->
            <div id="contact_us" class="content">
                <div class="project_title">Contact us</div>
                <div class="e_brochure"><a href="#" id="open_windows" title="下载"><img src="images/e_brochure.jpg"></a></div>
                <div class="clear"></div>
                <div class="project_content"></div>
            </div>
            <!---end-content---->
        </div>
        <div class="gotop"><a href="javascript:scroll(0,0)"><img src="images/gotop.png" /></a></div>
        <!---start-copy-right----->
        <jsp:include page="copyright.html" />
		<!---End-copy-right---->
	</body>
</html>