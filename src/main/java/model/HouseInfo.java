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
	private String area;
	// 价格
	private String price;
	// 房型
	private String type;
	// 朝向
	private String direction;
	// 楼层
	private String floor;
	// 楼龄
	private String age;
	// 装修类型
	private String decoration;
	// 标签
	private String mark;
	// 发布时间
	private Date publish_time;
	// 图片的url
	private String image_url;

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

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
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

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getDecoration() {
		return decoration;
	}

	public void setDecoration(String decoration) {
		this.decoration = decoration;
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

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
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
		temp.put("mark", mark);
		temp.put("publish_time", publish_time.toString());
		temp.put("image_url", image_url);
		return temp;
	}
}
