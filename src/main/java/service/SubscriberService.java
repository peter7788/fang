package service;

import java.util.List;
import javax.servlet.ServletContext;
import model.Subscriber;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import dao.SubscriberDao;

public class SubscriberService extends TotalService {

	/**
	 * 添加订阅邮箱
	 * 
	 * @param subscriber
	 */
	public void addSubscriber(Subscriber subscriber) {
		Session session = sessionFactory.openSession();
		Subscriber sub = new SubscriberDao().findSubscriberByEmail(session,
				subscriber.getEmail());
		// 判断如果订阅邮件不存在则添加，否则什么也不做
		if (sub == null) {
			new SubscriberDao().addSubscriber(session, subscriber);
			addToServletContext(subscriber);
		}
		session.close();
	}

	/**
	 * 查询所有订阅邮件
	 * 
	 * @return
	 */
	public List<Subscriber> findAll() {
		Session session = sessionFactory.openSession();
		List<Subscriber> list = new SubscriberDao().findAll(session);
		session.close();
		return list;
	}

	/**
	 * 根据电子邮箱查找订阅邮件
	 * 
	 * @param email
	 * @return
	 */
	public Subscriber findByEmail(String email) {
		Session session = sessionFactory.openSession();
		Subscriber subscriber = new SubscriberDao().findSubscriberByEmail(
				session, email);
		session.close();
		return subscriber;
	}

	/**
	 * 删除订阅邮箱信息
	 * 
	 * @param subscriber
	 */
	public void deleteSubscriber(Subscriber subscriber) {
		Session session = sessionFactory.openSession();
		new SubscriberDao().deleteSubscriber(session, subscriber);
		session.close();
		deleteFromServletContext(subscriber);
	}

	/**
	 * 更新缓存中的数据
	 * 
	 * @param subscriber
	 */
	public void addToServletContext(Subscriber subscriber) {
		ServletContext context = ServletActionContext.getServletContext();
		String subscriberListString = (String) context
				.getAttribute("subscriberList");
		JSONArray jsonArray;
		if (subscriberListString != null) {
			jsonArray = (JSONArray) JSONSerializer.toJSON(subscriberListString);
		} else {
			jsonArray = new JSONArray();
		}
		jsonArray.add(subscriber.toJson());
		context.setAttribute("subscriberList", jsonArray.toString());
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param subscriber
	 */
	public void deleteFromServletContext(Subscriber subscriber) {
		ServletContext context = ServletActionContext.getServletContext();
		String subscriberListString = (String) context
				.getAttribute("subscriberList");
		JSONArray jsonArray = (JSONArray) JSONSerializer
				.toJSON(subscriberListString);
		jsonArray.remove(subscriber.toJson());
		context.setAttribute("subscriberList", jsonArray.toString());
	}
}
