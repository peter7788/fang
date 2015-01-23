package action;

import java.util.Date;
import java.util.List;
import model.Message;
import service.MessageService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class MessageAction extends ActionSupport {
	private int id;// 主键id
	private String userName;// 留言者姓名
	private String userEmail;// 留言者邮箱
	private String userPhone;// 留言者移动电话
	private String userMsg;// 留言者留言内容
	private List<Message> message_list;// 留言信息集合

	/**
	 * 添加留言信息
	 * 
	 * @return
	 */
	public String addMessage() throws Exception {
		// System.out.println("进入留言添加页面！");
		Message message = new Message();
		message.setUser_name(userName);
		message.setUser_email(userEmail);
		message.setUser_phone(userPhone);
		message.setContent(userMsg);
		message.setMessage_time(new Date());
		new MessageService().addMessage(message);

		return SUCCESS;
	}

	/**
	 * 删除留言信息
	 * 
	 * @return
	 */
	public String deleteMessage() throws Exception {
		Message message = new MessageService().findById(id);
		if (message != null) {
			new MessageService().deleteMessage(message);
		}

		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserMsg() {
		return userMsg;
	}

	public void setUserMsg(String userMsg) {
		this.userMsg = userMsg;
	}

	public List<Message> getMessage_list() {
		return message_list;
	}

	public void setMessage_list(List<Message> message_list) {
		this.message_list = message_list;
	}
}
