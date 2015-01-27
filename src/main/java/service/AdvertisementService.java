package service;

import java.util.List;
import javax.servlet.ServletContext;
import model.Advertisement;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import dao.AdvertisementDao;

public class AdvertisementService extends TotalService {

	/**
	 * 添加广告
	 * 
	 * @param ad
	 */
	public void addAdvertisement(Advertisement ad) {
		Session session = sessionFactory.openSession();
		new AdvertisementDao().addAdvertisement(session, ad);
		session.close();
		// addToServletContext(ad);
	}

	/**
	 * 查询所有广告
	 * 
	 * @return
	 */
	public List<Advertisement> findAll() {
		Session session = sessionFactory.openSession();
		List<Advertisement> list = new AdvertisementDao().findAll(session);
		session.close();
		return list;
	}

	/**
	 * 根据id查找广告信息
	 * 
	 * @return
	 */
	public Advertisement findById(int id) {
		Session session = sessionFactory.openSession();
		Advertisement advertisement = new AdvertisementDao().findById(session,
				id);
		session.close();
		return advertisement;
	}

	/**
	 * 更新广告
	 * 
	 * @param ad
	 */
	public void updateAdvertisement(Advertisement ad) {
		Session session = sessionFactory.openSession();
		Advertisement advertisement = new AdvertisementDao().findById(session,
				ad.getId());
		// 判断，如果更新后的广告原先不存在，则更新
		if (advertisement != null) {
			new AdvertisementDao().updateAdvertisement(session, ad);
		}
		session.close();
	}

	/**
	 * 删除广告
	 * 
	 * @param ad
	 */
	public void deleteAdvertisement(Advertisement ad) {
		Session session = sessionFactory.openSession();
		new AdvertisementDao().deleteAdvertisement(session, ad);
		session.close();
		deleteFromServletContext(ad);
	}

	/**
	 * 更新缓存中的数据
	 * 
	 * @param advertisement
	 */
	public void addToServletContext(Advertisement advertisement) {
		ServletContext context = ServletActionContext.getServletContext();
		String advertisementListString = (String) context
				.getAttribute("advertisementList");
		JSONArray jsonArray;
		if (advertisementListString != null) {
			jsonArray = (JSONArray) JSONSerializer
					.toJSON(advertisementListString);
		} else {
			jsonArray = new JSONArray();
		}
		jsonArray.add(advertisement.toJson());
		context.setAttribute("advertisementList", jsonArray.toString());
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param advertisement
	 */
	public void deleteFromServletContext(Advertisement advertisement) {
		ServletContext context = ServletActionContext.getServletContext();
		String advertisementListString = (String) context
				.getAttribute("advertisementList");
		JSONArray jsonArray = (JSONArray) JSONSerializer
				.toJSON(advertisementListString);
		for (int i = 0; i < jsonArray.size(); i++) {
			Advertisement temp = (Advertisement) JSONObject.toBean(
					(JSONObject) jsonArray.get(i), Advertisement.class);
			if (temp.getId() == advertisement.getId()) {
				jsonArray.remove(i);
				break;
			}
		}
		context.setAttribute("advertisementList", jsonArray.toString());
	}
}
