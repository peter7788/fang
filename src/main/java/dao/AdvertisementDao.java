package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Advertisement;

public class AdvertisementDao {

	/**
	 * 添加广告
	 * 
	 * @param session
	 * @param ad
	 */
	public void addAdvertisement(Session session, Advertisement ad) {
		Transaction tx = session.beginTransaction();
		session.save(ad);
		tx.commit();
	}

	/**
	 * 查询所有广告
	 * 
	 * @param session
	 * @return
	 */
	public List<Advertisement> findAll(Session session) {
		Transaction tx = session.beginTransaction();
		List<Advertisement> list = (List<Advertisement>) session.createQuery(
				"from Advertisement").list();
		tx.commit();
		return list;
	}

	/**
	 * 查看某个广告信息
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	public Advertisement findById(Session session, int id) {
		Transaction tx = session.beginTransaction();
		List<Advertisement> advertisementList = (List<Advertisement>) session
				.createQuery("from Advertisement where id=" + id).list();
		tx.commit();
		if (advertisementList != null) {
			return advertisementList.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 更新广告
	 * 
	 * @param session
	 * @param ad
	 */
	public void updateAdvertisement(Session session, Advertisement ad) {
		Transaction tx = session.beginTransaction();
		session.update(ad);
		tx.commit();
	}

	/**
	 * 删除广告
	 * 
	 * @param session
	 * @param ad
	 */
	public void deleteAdvertisement(Session session, Advertisement ad) {
		Transaction tx = session.beginTransaction();
		session.delete(ad);
		tx.commit();
	}
}
