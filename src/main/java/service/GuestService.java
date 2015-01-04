package service;

import java.util.List;
import model.Guest;
import org.hibernate.Session;
import util.MD5;
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
			// MD5加密
			guest.setUser_password(MD5.getMD5Code(guest.getUser_password()));
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
		// MD5加密
		password = MD5.getMD5Code(password);
		if (guest != null && guest.getUser_password().equals(password)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 修改个人密码
	 * 
	 * @param name
	 * @param old_password
	 * @param new_password
	 * @return
	 */
	public boolean changePassword(String name, String old_password,
			String new_password) {
		if (isExisted(name, old_password)) {
			Session session = sessionFactory.openSession();
			Guest guest = findByName(name);
			if (guest != null) {
				// MD5加密
				guest.setUser_password(MD5.getMD5Code(new_password));
				new GuestDao().update(session, guest);
			}
			session.close();
			return true;
		} else {
			return false;
		}
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
