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
	public void addAd(Advertisement ad) {
		Session session = sessionFactory.openSession();
		new AdvertisementDao().addAd(session, ad);
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
		if (list != null && list.size() > 0) {
			return list;
		} else {
			return null;
		}
	}

	/**
	 * 更新广告
	 * 
	 * @param ad
	 */
	public void updateAdvertisement(Advertisement ad) {
		Session session = sessionFactory.openSession();
		List<Advertisement> list = new AdvertisementDao().findById(session,
				ad.getId());
		// 判断，如果更新后的广告原先不存在，则更新
		if (list != null && list.size() > 0) {
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
