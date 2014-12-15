package action;

import java.sql.Date;

import model.Message;
import service.MessageService;

import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class MessageController extends ActionSupport {
	private String userName;//留言者姓名
	private String userEmail;//留言者邮箱
	private String userPhone;//留言者移动电话
	private String userMsg;//留言者留言内容
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	
	/*添加留言信息方法*/
	public String addMessage(){
		//System.out.println("进入留言添加页面！");
		Message msg=new Message();
		msg.setUser_name(userName);
		msg.setUser_email(userEmail);
		msg.setUser_phone(userPhone);
		msg.setContent(userMsg);
		msg.setMessage_time(new Date(System.currentTimeMillis()));
		new MessageService().addMessage(msg);
		return SUCCESS;
	}
	
	/*留言相关信息的setXXX()、getXXX()方法*/
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
}
