package model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Message implements Serializable {

	// 主键id
	private int id;
	// 用户名称
	private String username;
	// 留言时间
	private String message_time;
	// 联系方式
	private String contact;
	// 电话
	private String phone;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getMessage_time() {
		return message_time;
	}

	public void setMessage_time(String message_time) {
		this.message_time = message_time;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
}
