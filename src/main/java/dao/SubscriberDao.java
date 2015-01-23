package dao;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Subscriber;

public class SubscriberDao {

	/**
	 * 添加订阅邮箱
	 * 
	 * @param session
	 * @param subscriber
	 */
	public void addSubscriber(Session session, Subscriber subscriber) {
		Transaction tx = session.beginTransaction();
		session.save(subscriber);
		tx.commit();
	}

	/**
	 * 查询所有订阅邮箱
	 * 
	 * @param session
	 * @return
	 */
	public List<Subscriber> findAll(Session session) {
		List<Subscriber> list = new ArrayList<Subscriber>();
		Transaction tx = session.beginTransaction();
		list = session.createQuery("from Subscriber").list();
		tx.commit();
		return list;
	}

	/**
	 * 根据电子邮箱查找订阅用户
	 * 
	 * @param session
	 * @param email
	 * @return
	 */
	public Subscriber findSubscriberByEmail(Session session, String email) {
		Transaction tx = session.beginTransaction();
		List<Subscriber> list = session.createQuery(
				"from Subscriber where email='" + email + "'").list();
		tx.commit();
		if (list != null && list.size() > 0) {
			return list.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 修改订阅邮箱信息
	 * 
	 * @param session
	 * @param subscriber
	 */
	public void update(Session session, Subscriber subscriber) {
		Transaction tx = session.beginTransaction();
		session.update(subscriber);
		tx.commit();
	}

	/**
	 * 删除订阅邮箱
	 * 
	 * @param session
	 * @param subscriber
	 */
	public void deleteSubscriber(Session session, Subscriber subscriber) {
		Transaction tx = session.beginTransaction();
		session.delete(subscriber);
		tx.commit();
	}
}
