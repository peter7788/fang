package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Guest;

public class GuestDao {

	/**
	 * 添加用户
	 * 
	 * @param session
	 * @param guest
	 */
	public void addGuest(Session session, Guest guest) {
		Transaction tx = session.beginTransaction();
		session.save(guest);
		tx.commit();
	}

	/**
	 * 查询所有用户
	 * 
	 * @param session
	 * @return
	 */
	public List<Guest> findAll(Session session) {
		List<Guest> list = new ArrayList<Guest>();
		Transaction tx = session.beginTransaction();
		list = session.createQuery("from Guest").list();
		tx.commit();
		return list;
	}

	/**
	 * 根据用户名查找用户
	 * 
	 * @param session
	 * @param name
	 * @return
	 */
	public Guest findGuestByName(Session session, String name) {
		Transaction tx = session.beginTransaction();
		List<Guest> list = session.createQuery(
				"from Guest where user_name='" + name + "'").list();
		tx.commit();
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 修改用户信息
	 * 
	 * @param session
	 * @param guest
	 */
	public void changGuestInfo(Session session, Guest guest) {
		Transaction tx = session.beginTransaction();
		session.update(guest);
		tx.commit();
	}

	/**
	 * 删除用户信息
	 * 
	 * @param session
	 * @param guest
	 */
	public void deleteGuest(Session session, Guest guest) {
		Transaction tx = session.beginTransaction();
		session.delete(guest);
		tx.commit();
	}
}
