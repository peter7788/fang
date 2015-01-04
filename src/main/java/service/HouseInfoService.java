package service;

import java.util.List;
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
		System.out.println("sevice中插入房屋信息测试！");
		session.close();
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
	}
}
