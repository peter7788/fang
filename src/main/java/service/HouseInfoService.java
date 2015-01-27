package service;

import java.util.List;
import javax.servlet.ServletContext;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import dao.HouseInfoDao;
import model.HouseInfo;

public class HouseInfoService extends TotalService {
	/**
	 * 添加房产信息
	 * 
	 * @param houseInfo
	 */
	public void addHouseInfo(HouseInfo houseInfo) {
		Session session = sessionFactory.openSession();
		new HouseInfoDao().addHouseInfo(session, houseInfo);
		session.close();
		addToServletContext(houseInfo);
	}

	/**
	 * 查找所有房产信息
	 * 
	 * @return
	 */
	public List<HouseInfo> findAll() {
		Session session = sessionFactory.openSession();
		List<HouseInfo> list = new HouseInfoDao().findAll(session);
		session.close();
		return list;
	}

	/**
	 * 根据id查找房产信息
	 * 
	 * @return
	 */
	public HouseInfo findById(int id) {
		Session session = sessionFactory.openSession();
		HouseInfo houseInfo = new HouseInfoDao().findById(session, id);
		session.close();
		return houseInfo;
	}

	/**
	 * 根据条件查询房产信息
	 * 
	 * @param str
	 * @return
	 */
	public List<HouseInfo> findByCriteria(String hql) {
		Session session = sessionFactory.openSession();
		System.out.println("Service查询测试！");
		List<HouseInfo> list = new HouseInfoDao().findByCriteria(session, hql);
		session.close();
		return list;
	}

	/**
	 * 更新房产信息
	 * 
	 * @param houseInfo
	 */
	public void updateHouseInfo(HouseInfo houseInfo) {
		Session session = sessionFactory.openSession();
		// 原则上使用条件查找更优，有待改进
		if (findById(houseInfo.getId()) != null) {
			new HouseInfoDao().updateHouseInfo(session, houseInfo);
		}
		session.close();
	}

	/**
	 * 删除房产信息
	 * 
	 * @param houseInfo
	 */
	public void deleteHouseInfo(HouseInfo houseInfo) {
		Session session = sessionFactory.openSession();
		new HouseInfoDao().deleteHouseInfo(session, houseInfo);
		session.close();
		deleteFromServletContext(houseInfo);
	}

	/**
	 * 更新缓存中的数据
	 * 
	 * @param houseInfo
	 */
	public void addToServletContext(HouseInfo houseInfo) {
		ServletContext context = ServletActionContext.getServletContext();
		if (houseInfo.getMark().equals("new")) {
			String newHouseInfoListString = (String) context
					.getAttribute("newHouseInfoList");
			JSONArray jsonArray;
			if (newHouseInfoListString != null) {
				jsonArray = (JSONArray) JSONSerializer
						.toJSON(newHouseInfoListString);
			} else {
				jsonArray = new JSONArray();
			}
			jsonArray.add(houseInfo.toJson());
			context.setAttribute("newHouseInfoList", jsonArray.toString());
		} else {
			String hotHouseInfoListString = (String) context
					.getAttribute("hotHouseInfoList");
			JSONArray jsonArray;
			if (hotHouseInfoListString != null) {
				jsonArray = (JSONArray) JSONSerializer
						.toJSON(hotHouseInfoListString);
			} else {
				jsonArray = new JSONArray();
			}
			jsonArray.add(houseInfo.toJson());
			context.setAttribute("hotHouseInfoList", jsonArray.toString());
		}
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param houseInfo
	 */
	public void deleteFromServletContext(HouseInfo houseInfo) {
		ServletContext context = ServletActionContext.getServletContext();
		if (houseInfo.getMark().equals("new")) {
			String newHouseInfoListString = (String) context
					.getAttribute("newHouseInfoList");
			JSONArray jsonArray = (JSONArray) JSONSerializer
					.toJSON(newHouseInfoListString);
			for (int i = 0; i < jsonArray.size(); i++) {
				HouseInfo temp = (HouseInfo) JSONObject.toBean(
						(JSONObject) jsonArray.get(i), HouseInfo.class);
				if (temp.getId() == houseInfo.getId()) {
					jsonArray.remove(i);
					break;
				}
			}
			context.setAttribute("newHouseInfoList", jsonArray.toString());
		} else {
			String hotHouseInfoListString = (String) context
					.getAttribute("hotHouseInfoList");
			JSONArray jsonArray = (JSONArray) JSONSerializer
					.toJSON(hotHouseInfoListString);
			for (int i = 0; i < jsonArray.size(); i++) {
				HouseInfo temp = (HouseInfo) JSONObject.toBean(
						(JSONObject) jsonArray.get(i), HouseInfo.class);
				if (temp.getId() == houseInfo.getId()) {
					jsonArray.remove(i);
					break;
				}
			}
			context.setAttribute("hotHouseInfoList", jsonArray.toString());
		}
	}
}
