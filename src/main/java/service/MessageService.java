package service;

import java.util.List;
import model.Message;
import org.hibernate.Session;
import dao.MessageDao;

public class MessageService extends TotalService {

	/**
	 * 添加留言信息
	 * 
	 * @param message
	 */
	public void addMessage(Message message) {
		Session session = sessionFactory.openSession();
		new MessageDao().addMessage(session, message);
		session.close();
	}

	/**
	 * 查看所有留言信息
	 * 
	 * @return
	 */
	public List<Message> findAll() {
		Session session = sessionFactory.openSession();
		List<Message> list = new MessageDao().findAll(session);
		session.close();
		return list;
	}

	/**
	 * 删除留言信息
	 * 
	 * @param message
	 */
	public void deleteMessage(Message message) {
		Session session = sessionFactory.openSession();
		new MessageDao().deleteMessage(session, message);
		session.close();
	}
}