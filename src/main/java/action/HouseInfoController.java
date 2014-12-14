package action;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import model.HouseInfo;
import service.HouseInfoService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class HouseInfoController extends ActionSupport {
	private String direction;// 房屋方位信息
	private String floor;// 房屋楼层信息
	private String type;// 房屋类型
	private String area;// 房屋面积
	private String price;// 房屋价格
	private String age;// 房屋使用年数
	private String decoration;// 房屋装修情况
	private List<HouseInfo> houseInfo_list;// 房屋信息集合
	private HouseInfo houseInfo;//房屋信息Bean

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub

		return SUCCESS;
	}

	// 根据条件对房屋信息检索
	public String search() throws Exception {
		String hql = "";
		boolean flag = false;// 用于标记条件语句hql中是否有"where"

		/* 添加房屋方位检索条件 */
		if (direction != null && !direction.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (direction) {
			case "E":
				hql += " h.direction='E'";
				break;
			case "W":
				hql += " h.direction='W'";
				break;
			case "S":
				hql += " h.direction='S'";
				break;
			case "N":
				hql += " h.direction='N'";
				break;
			default:
				break;
			}
		}

		/* 添加楼层层数检索条件 */
		if (floor != null && !floor.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (floor) {
			case "3楼以下":
				hql += " h.floor between '0' and '3'";
				break;
			case "3-5楼":
				hql += " h.floor between '3' and '5'";
				break;
			case "5-7楼":
				hql += " h.floor between '5' and '7'";
				break;
			case "7楼以上":
				hql += " h.floor>'7'";
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
			case "单间":
				hql += " h.type='单间'";
				break;
			case "一厅一房":
				hql += " h.type='一厅一房'";
				break;
			case "一厅两房":
				hql += " h.type='一厅两房'";
				break;
			case "一厅三房":
				hql += " h.type='一厅三房'";
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
			case "50平米以下":
				hql += " h.area<'50'";
				break;
			case "50-70平米":
				hql += " h.area between '50' and '70'";
				break;
			case "70-90平米":
				hql += " h.area between '70' and '90'";
				break;
			case "90-110平米":
				hql += " h.area between '90' and '110'";
				break;
			case "110-130平米":
				hql += " h.area between '110' and '130'";
				break;
			case "130-150平米":
				hql += " h.area between '130' and '150'";
				break;
			case "150-200平米":
				hql += " h.area between '150' and '200'";
				break;
			case "200-300平米":
				hql += " h.area between '200' and '300'";
				break;
			case "300-500平米":
				hql += " h.area between '300' and '500'";
				break;
			case "500平米以上":
				hql += " h.area>'500'";
				break;
			default:
				break;
			}

		}

		/* 添加房屋价格检索条件 */
		if (price != null && !price.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}

			switch (price) {
			case "50万以下":
				hql += " h.price<'50'";
				break;
			case "50-100万":
				hql += " h.price between '50' and '100'";
				break;
			case "100-150万":
				hql += " h.price between '100' and '150'";
				break;
			case "150-200万":
				hql += " h.price between '150' and '200'";
				break;
			case "200-250万":
				hql += " h.price between '200' and '250'";
				break;
			case "250-300万":
				hql += " h.price between '250' and '300'";
				break;
			case "300-500万":
				hql += " h.price between '300' and '500'";
				break;
			case "500-1000万":
				hql += " h.price between '500' and '1000'";
				break;
			case "1000万以上":
				hql += " h.price>'1000'";
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
			case "5年以下":
				hql += " h.age<'5'";
				break;
			case "5-10年":
				hql += " h.age between '5' and '10'";
				break;
			case "10-20年":
				hql += " h.age between '10' and '20'";
				break;
			case "20年以上":
				hql += " h.age>'20'";
				break;
			default:
				break;
			}
		}

		/* 添加房屋装修年数检索条件 */
		if (decoration != null && !decoration.equals("")) {
			if (!flag) {
				flag = true;
				hql += " where";
			} else {
				hql += " and";
			}
			switch (decoration) {
			case "毛坯":
				hql += " h.decoration='毛坯'";
				break;
			case "普通装修":
				hql += " h.decoration='普通装修'";
				break;
			case "精装修":
				hql += " h.decoration='精装修'";
				break;
			case "豪华装修":
				hql += " h.decoration='豪华装修'";
				break;
			default:
				break;
			}
		}

		HttpSession session = ServletActionContext.getRequest().getSession();
		if (hql != null && !hql.equals("")) {
			houseInfo_list = new HouseInfoService().findByCriteria(hql);
		} else {
			// System.out.println("不带条件查询！");
			houseInfo_list = new HouseInfoService().findAll();
		}
		session.setAttribute("houseInfo_list", houseInfo_list);
		System.out.println("session属性设置成功！");
		System.out.println(houseInfo_list.size());
		return SUCCESS;
	}

	/* 相关属性的setXXX()、getXXX()方法 */
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public List<HouseInfo> getHouseInfo_list() {
		return houseInfo_list;
	}

	public void setHouseInfo_list(List<HouseInfo> houseInfo_list) {
		this.houseInfo_list = houseInfo_list;
	}
}
