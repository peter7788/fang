package model;

import java.io.Serializable;
import java.util.Date;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class Message implements Serializable {

	// 主键id
	private int id;
	// 用户名称
	private String user_name;
	// 留言时间
	private Date message_time;
	// 电子邮箱
	private String user_email;
	// 移动电话
	private String user_phone;
	// 用户留言信息
	private String content;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getMessage_time() {
		return message_time;
	}

	public void setMessage_time(Date message_time) {
		this.message_time = message_time;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public JSONObject toJson() {
		JSONObject temp = new JSONObject();
		temp.put("user_name", user_name);
		temp.put("message_time", message_time.toString());
		temp.put("user_email", user_email);
		temp.put("user_phone", user_phone);
		temp.put("content", content);
		return temp;
	}
}
