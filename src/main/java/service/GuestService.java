package service;

import java.util.List;
import model.Guest;
import org.hibernate.Session;
import dao.GuestDao;

public class GuestService extends TotalService {
	/**
	 * 添加用户
	 * 
	 * @param guest
	 */
	public void addGuest(Guest guest) {
		Session session = sessionFactory.openSession();
		Guest gst = new GuestDao().findGuestByName(session,
				guest.getUser_name());
		// 判断如果用户不存在则添加，否则什么也不做
		if (gst == null) {
			new GuestDao().addGuest(session, guest);
		}
		session.close();
	}

	/**
	 * 查询所有用户
	 * 
	 * @return
	 */
	public List<Guest> findAll() {
		Session session = sessionFactory.openSession();
		List<Guest> list = new GuestDao().findAll(session);
		session.close();
		return list;
	}

	/**
	 * 根据用户名查找用户
	 * 
	 * @param name
	 * @return
	 */
	public Guest findByName(String name) {
		Session session = sessionFactory.openSession();
		Guest guest = new GuestDao().findGuestByName(session, name);
		session.close();
		return guest;
	}

	/**
	 * 根据用户名和密码查找用户 判断用户是否存在
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	public boolean isExisted(String name, String password) {
		Guest guest = findByName(name);
		if (guest != null & guest.getUser_password().equals(password)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 修改个人信息
	 * 
	 * @param guest
	 */
	public void changeGuestInfo(Guest guest) {
		Session session = sessionFactory.openSession();
		// 判断用户修改信息时的用户名，避免与其他用户名冲突
		if (new GuestDao().findGuestByName(session, guest.getUser_name()) != null) {
			new GuestDao().changGuestInfo(session, guest);
		}
		session.close();
	}

	/**
	 * 删除用户信息
	 * 
	 * @param guest
	 */
	public void deleteGuest(Guest guest) {
		Session session = sessionFactory.openSession();
		new GuestDao().deleteGuest(session, guest);
		session.close();
	}
}
