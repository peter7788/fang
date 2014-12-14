//初始化地图
function map_initialize(latitude, longitude, title) {
				//var latitude = 1.3318916;
				//var longitude = 103.8493879;
				//var title = "Hello World!";
				var myLatlng = new google.maps.LatLng(latitude, longitude);
        		var mapOptions = {
          			center: myLatlng,//中心点
          			zoom: 16,//缩放比例
					scale: 1,//返回图像的像素
					//size: 500*300,//返回图片的大小
					//format: png,//采用PNG的格式
          			mapTypeId: google.maps.MapTypeId.ROADMAP,
					panControl: true,//左上角移动控件
  					zoomControl: true,//显示缩放控件
					zoomControlOptions: {
    					style: google.maps.ZoomControlStyle.LARGE
  					},
  					mapTypeControl: true,//右上角地图类型的切换
  					scaleControl: true,//右下角比例尺
        		};
        		var map = new google.maps.Map(document.getElementById("map_div"), mapOptions);
				var marker = new google.maps.Marker({
					position: myLatlng,
					map: map,
					animation: google.maps.Animation.BOUNCE,//弹跳的效果
					title: title//鼠标指向时的提示
				});
}

//异步加载
function loadMapScript() {
  var script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyASlIihgkxQwX1KCbGcuUJzAn2cuZtdkW8&sensor=FALSE&language=zh-CN&callback=map_initialize(1.3318916, 103.8493879, 'Hello World!')";
  document.body.appendChild(script);
}