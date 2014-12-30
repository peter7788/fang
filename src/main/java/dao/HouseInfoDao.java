package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.HouseInfo;

public class HouseInfoDao {
	/**
	 * 添加房产信息
	 * 
	 * @param session
	 * @param houseInfo
	 */
	public void addHouseInfo(Session session, HouseInfo houseInfo) {
		Transaction tx = session.beginTransaction();
		session.save(houseInfo);
		System.out.println("Dao插入房屋信息测试！");
		tx.commit();
	}

	/**
	 * 查看所有房产信息
	 * 
	 * @param session
	 * @return
	 */
	public List<HouseInfo> findAll(Session session) {
		// List<HouseInfo> list=new ArrayList<HouseInfo>();
		Transaction tx = session.beginTransaction();
		List<HouseInfo> list = (List<HouseInfo>) session.createQuery(
				"from HouseInfo").list();
		tx.commit();
		return list;
	}

	/**
	 * 查看某个房产信息
	 * 
	 * @param session
	 * @return
	 */
	public List<HouseInfo> findById(Session session, int id) {
		Transaction tx = session.beginTransaction();
		List<HouseInfo> list = (List<HouseInfo>) session.createQuery(
				"from HouseInfo where id=" + id).list();
		tx.commit();
		return list;
	}

	/**
	 * 根据条件查询
	 * 
	 * @param session
	 * @param parameter
	 * @return
	 */
	public List<HouseInfo> findByCriteria(Session session, String hql) {
		Transaction tx = session.beginTransaction();
		List<HouseInfo> list = (List<HouseInfo>) session.createQuery(
				"from HouseInfo h" + hql).list();
		System.out.println("输出hql语句:" + "from HouseInfo h" + hql);
		tx.commit();
		return list;
	}

	/**
	 * 修改已发布的房产信息
	 * 
	 * @param session
	 * @param houseInfo
	 */
	public void updateHouseInfo(Session session, HouseInfo houseInfo) {
		Transaction tx = session.beginTransaction();
		session.update(houseInfo);
		tx.commit();
	}

	/**
	 * 删除已发布的房产信息
	 * 
	 * @param session
	 * @param houseInfo
	 */
	public void deleteHouseInfo(Session session, HouseInfo houseInfo) {
		Transaction tx = session.beginTransaction();
		session.delete(houseInfo);
		tx.commit();
	}
}
