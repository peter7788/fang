package service;

import java.util.List;
import model.Advertisement;
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
	}
}
