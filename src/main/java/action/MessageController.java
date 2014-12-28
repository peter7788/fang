package action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import model.Message;
import service.MessageService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class MessageController extends ActionSupport {
	private String userName;// 留言者姓名
	private String userEmail;// 留言者邮箱
	private String userPhone;// 留言者移动电话
	private String userMsg;// 留言者留言内容
	private List<Message> message_list;// 留言信息集合

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}

	/* 添加留言信息方法 */
	public String addMessage() {
		// System.out.println("进入留言添加页面！");
		Message message = new Message();
		message.setUser_name(userName);
		message.setUser_email(userEmail);
		message.setUser_phone(userPhone);
		message.setContent(userMsg);
		message.setMessage_time(new Date(System.currentTimeMillis()));
		new MessageService().addMessage(message);

		// 更新application中的messageList
		ServletContext context = ServletActionContext.getServletContext();
		List<Message> messageList = (List<Message>) context
				.getAttribute("messageList");
		if (messageList == null) {
			messageList = new ArrayList<Message>();
		}
		messageList.add(message);
		context.setAttribute("messageList", messageList);

		return SUCCESS;
	}

	/* 查看留言信息 */
	public String searchMessage() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		message_list = new MessageService().findAll();
		session.setAttribute("message_list", message_list);
		System.out.println("测试留言条数：" + message_list.size());
		return SUCCESS;
	}

	/* 留言相关信息的setXXX()、getXXX()方法 */
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
