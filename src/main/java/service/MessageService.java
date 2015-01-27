package service;

import java.util.List;
import javax.servlet.ServletContext;
import model.Message;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
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
		addToServletContext(message);
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
	 * 根据id查找留言信息
	 * 
	 * @return
	 */
	public Message findById(int id) {
		Session session = sessionFactory.openSession();
		Message message = new MessageDao().findById(session, id);
		session.close();
		return message;
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
		deleteFromServletContext(message);
	}

	/**
	 * 更新缓存中的数据
	 * 
	 * @param message
	 */
	public void addToServletContext(Message message) {
		ServletContext context = ServletActionContext.getServletContext();
		String messageListString = (String) context.getAttribute("messageList");
		JSONArray jsonArray;
		if (messageListString != null) {
			jsonArray = (JSONArray) JSONSerializer.toJSON(messageListString);
		} else {
			jsonArray = new JSONArray();
		}
		jsonArray.add(message.toJson());
		context.setAttribute("messageList", jsonArray.toString());
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param message
	 */
	public void deleteFromServletContext(Message message) {
		ServletContext context = ServletActionContext.getServletContext();
		String messageListString = (String) context.getAttribute("messageList");
		JSONArray jsonArray = (JSONArray) JSONSerializer
				.toJSON(messageListString);
		for (int i = 0; i < jsonArray.size(); i++) {
			Message temp = (Message) JSONObject.toBean(
					(JSONObject) jsonArray.get(i), Message.class);
			if (temp.getId() == message.getId()) {
				jsonArray.remove(i);
				break;
			}
		}
		context.setAttribute("messageList", jsonArray.toString());
	}
}