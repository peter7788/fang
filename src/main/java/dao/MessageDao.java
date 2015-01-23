package dao;

import java.util.List;
import model.Message;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class MessageDao {
	/**
	 * 添加留言信息
	 * 
	 * @param session
	 * @param message
	 */
	public void addMessage(Session session, Message message) {
		Transaction tx = session.beginTransaction();
		session.save(message);
		tx.commit();
	}

	/**
	 * 查看留言信息
	 * 
	 * @param session
	 * @return
	 */
	public List<Message> findAll(Session session) {
		Transaction tx = session.beginTransaction();
		List<Message> list = session.createQuery("from Message").list();
		tx.commit();
		return list;
	}

	/**
	 * 查看某个留言信息
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	public Message findById(Session session, int id) {
		Transaction tx = session.beginTransaction();
		List<Message> messageList = (List<Message>) session.createQuery(
				"from Message where id=" + id).list();
		tx.commit();
		if (messageList != null) {
			return messageList.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 删除留言
	 * 
	 * @param session
	 * @param message
	 */
	public void deleteMessage(Session session, Message message) {
		Transaction tx = session.beginTransaction();
		session.delete(message);
		tx.commit();
	}
}
