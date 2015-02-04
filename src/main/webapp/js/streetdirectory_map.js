//初始化地图
function initialize() {
	var latlng = new GeoPoint(103.00, 1.28);
	var myOptions = {
		zoom: 13,
		center: latlng,
		showCopyright: false
	};
	var map = new SD.genmap.Map(
		document.getElementById("streetdirectory_div"),
		myOptions
	);
}