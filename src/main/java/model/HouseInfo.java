package model;

import java.io.Serializable;
import java.util.Date;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class HouseInfo implements Serializable {

	// 主键id
	private int id;
	// 所在区域
	private String zone;
	// 房屋地址
	private String address;
	// 种类
	private String sort;
	// 地段
	private String location;
	// 面积
	private int area;
	// 价格
	private String price;
	// 房型
	private String type;
	// 朝向
	private String direction;
	// 楼层
	private int floor;
	// 楼龄
	private int age;
	// 装修类型
	private String decoration;
	// 纬度
	private String latitude;
	// 经度
	private String longitude;
	// 标签
	private String mark;
	// 发布时间
	private Date publish_time;
	// 展示图片的url
	private String display_images_url;
	// 展示图片缩略图的url
	private String display_thumbnail_images_url;
	// Location Map的url
	private String location_map_url;
	// Site Plan的url
	private String site_plan_url;
	// Floor Plan的url
	private String floor_plan_url;
	// E-Brochure的url
	private String e_brochure_url;
	// 优点
	private String advantage;
	// 简介
	private String introduction;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getZone() {
		return zone;
	}

	public void setZone(String zone) {
		this.zone = zone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDirection() {
		return direction;
	}

	public void setDirection(String direction) {
		this.direction = direction;
	}

	public int getFloor() {
		return floor;
	}

	public void setFloor(int floor) {
		this.floor = floor;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getDecoration() {
		return decoration;
	}

	public void setDecoration(String decoration) {
		this.decoration = decoration;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public Date getPublish_time() {
		return publish_time;
	}

	public void setPublish_time(Date publish_time) {
		this.publish_time = publish_time;
	}

	public String getDisplay_images_url() {
		return display_images_url;
	}

	public void setDisplay_images_url(String display_images_url) {
		this.display_images_url = display_images_url;
	}

	public String getDisplay_thumbnail_images_url() {
		return display_thumbnail_images_url;
	}

	public void setDisplay_thumbnail_images_url(
			String display_thumbnail_images_url) {
		this.display_thumbnail_images_url = display_thumbnail_images_url;
	}

	public String getLocation_map_url() {
		return location_map_url;
	}

	public void setLocation_map_url(String location_map_url) {
		this.location_map_url = location_map_url;
	}

	public String getSite_plan_url() {
		return site_plan_url;
	}

	public void setSite_plan_url(String site_plan_url) {
		this.site_plan_url = site_plan_url;
	}

	public String getFloor_plan_url() {
		return floor_plan_url;
	}

	public void setFloor_plan_url(String floor_plan_url) {
		this.floor_plan_url = floor_plan_url;
	}

	public String getE_brochure_url() {
		return e_brochure_url;
	}

	public void setE_brochure_url(String e_brochure_url) {
		this.e_brochure_url = e_brochure_url;
	}

	public String getAdvantage() {
		return advantage;
	}

	public void setAdvantage(String advantage) {
		this.advantage = advantage;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public JSONObject toJson() {
		JSONObject temp = new JSONObject();
		temp.put("id", id);
		temp.put("zone", zone);
		temp.put("address", address);
		temp.put("sort", sort);
		temp.put("location", location);
		temp.put("area", area);
		temp.put("price", price);
		temp.put("type", type);
		temp.put("direction", direction);
		temp.put("floor", floor);
		temp.put("age", age);
		temp.put("decoration", decoration);
		temp.put("latitude", latitude);
		temp.put("longitude", longitude);
		temp.put("mark", mark);
		temp.put("publish_time", publish_time.toString());
		temp.put("display_images_url", display_images_url);
		temp.put("display_thumbnail_images_url", display_thumbnail_images_url);
		temp.put("location_map_url", location_map_url);
		temp.put("site_plan_url", site_plan_url);
		temp.put("floor_plan_url", floor_plan_url);
		temp.put("e_brochure_url", e_brochure_url);
		temp.put("advantage", advantage);
		temp.put("introduction", introduction);
		return temp;
	}
}
