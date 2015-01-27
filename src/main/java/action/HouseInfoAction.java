package action;

import java.io.File;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;
import model.HouseInfo;
import service.HouseInfoService;
import util.Upload;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class HouseInfoAction extends ActionSupport {

	private int id;// 主键id
	private String zone;// 所在区域
	private String address;// 房屋地址
	private String sort;// 种类
	private String location;// 地段
	private String area;// 房屋面积
	private String price;// 房屋价格
	private String type;// 房屋类型
	private String direction;// 房屋朝向
	private String floor;// 房屋楼层信息
	private String age;// 房屋使用年数
	private String decoration;// 房屋装修情况
	private String latitude;// 纬度
	private String longitude;// 经度
	private String mark;// 标签
	private String image_url;// 图片的url
	private String description;// 图片描述
	private String savePath;// 上传文件的保存路径
	private String sizeLimit;// 上传文件的大小限制
	private File upload;// 上传文件
	private String uploadContentType;// 上传文件类型
	private String uploadFileName;// 上传文件的文件名

	/**
	 * 添加房屋信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addHouseInfo() throws Exception {
		if (getUpload().length() > Long.parseLong(sizeLimit)) {
			return ERROR;
		} else {
			HouseInfo houseInfo = new HouseInfo();
			houseInfo.setZone(zone);
			houseInfo.setAddress(address);
			houseInfo.setSort(sort);
			houseInfo.setLocation(location);
			houseInfo.setArea(area);
			houseInfo.setPrice(price);
			houseInfo.setType(type);
			houseInfo.setDirection(direction);
			houseInfo.setFloor(floor);
			houseInfo.setAge(age);
			houseInfo.setDecoration(decoration);
			houseInfo.setLatitude(latitude);
			houseInfo.setLongitude(longitude);
			houseInfo.setMark(mark);
			houseInfo.setPublish_time(new Date());
			houseInfo.setImage_url(savePath + "/" + getUploadFileName());
			new HouseInfoService().addHouseInfo(houseInfo);
			Upload.upload(getSavePath(), getUploadFileName(), getUpload());

			if (houseInfo.getMark().equals("new")) {
				return "new";
			} else {
				return "hot";
			}
		}
	}

	/**
	 * 删除房屋信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String deleteHouseInfo() throws Exception {
		HouseInfo houseInfo = new HouseInfoService().findById(id);
		if (houseInfo != null) {
			new HouseInfoService().deleteHouseInfo(houseInfo);
			if (houseInfo.getMark().equals("new")) {
				return "new";
			} else {
				return "hot";
			}
		} else {
			return ERROR;
		}
	}

	/**
	 * 根据条件对房屋信息检索
	 * 
	 * @return
	 * @throws Exception
	 */
	public String search() throws Exception {
		String hql = "";
		boolean flag = false;// 用于标记条件语句hql中是否有"where"

		/* 添加种类检索条件 */
		if (sort != null && !sort.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (sort) {
			case "apartment":
				hql += " h.sort='公寓'";
				break;
			case "government_rent":
				hql += " h.sort='政府组屋'";
				break;
			case "residence_with_land":
				hql += " h.sort='有地住宅'";
				break;
			case "commercial_property":
				hql += " h.sort='商业楼盘'";
				break;
			default:
				break;
			}
		}

		/* 添加地段检索条件 */
		if (location != null && !location.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (location) {
			case "school":
				hql += " h.location='靠近学校'";
				break;
			case "metro":
				hql += " h.location='靠近地铁'";
				break;
			case "hospital":
				hql += " h.location='医院附近'";
				break;
			case "convenient":
				hql += " h.location='交通方便'";
				break;
			default:
				break;
			}
		}

		/* 添加房屋类型检索条件 */
		if (type != null && !type.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (type) {
			case "1":
				hql += " h.type='一室'";
				break;
			case "2":
				hql += " h.type='二室'";
				break;
			case "3":
				hql += " h.type='三室'";
				break;
			case "4":
				hql += " h.type='四室'";
				break;
			case "5":
				hql += " h.type='四室以上'";
				break;
			default:
				break;
			}

		}

		/* 添加房屋面积检索条件 */
		if (area != null && !area.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (area) {
			case "lower50":
				hql += " h.area<'50'";
				break;
			case "50to70":
				hql += " h.area between '50' and '70'";
				break;
			case "70to90":
				hql += " h.area between '70' and '90'";
				break;
			case "90to110":
				hql += " h.area between '90' and '110'";
				break;
			case "110to130":
				hql += " h.area between '110' and '130'";
				break;
			case "130to150":
				hql += " h.area between '130' and '150'";
				break;
			case "150to200":
				hql += " h.area between '150' and '200'";
				break;
			case "200to300":
				hql += " h.area between '200' and '300'";
				break;
			case "300to500":
				hql += " h.area between '300' and '500'";
				break;
			case "over500":
				hql += " h.area>'500'";
				break;
			default:
				break;
			}

		}

		/* 添加房屋使用年数检索条件 */
		if (age != null && !age.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (age) {
			case "lower5":
				hql += " h.age<'5'";
				break;
			case "5to10":
				hql += " h.age between '5' and '10'";
				break;
			case "10to20":
				hql += " h.age between '10' and '20'";
				break;
			case "over20":
				hql += " h.age>'20'";
				break;
			default:
				break;
			}
		}

		HttpServletRequest request = ServletActionContext.getRequest();
		List<HouseInfo> searchHouseInfoList;
		if (hql != null && !hql.equals("")) {
			searchHouseInfoList = new HouseInfoService().findByCriteria(hql);
		} else {
			// System.out.println("不带条件查询！");
			searchHouseInfoList = new HouseInfoService().findAll();
		}
		if (searchHouseInfoList != null) {
			JSONArray jsonArray = new JSONArray();
			for (HouseInfo houseInfo : searchHouseInfoList) {
				jsonArray.add(houseInfo.toJson());
			}
			request.setAttribute("searchHouseInfoList", jsonArray.toString());
			request.setAttribute("blankList", new JSONArray().toString());
			System.out.println("request属性设置成功！");
			System.out.println("检索结果个数为：" + searchHouseInfoList.size());
		}

		return SUCCESS;
	}

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

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String value) {
		this.savePath = value;
	}

	public String getSizeLimit() {
		return sizeLimit;
	}

	public void setSizeLimit(String value) {
		this.sizeLimit = value;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
}
