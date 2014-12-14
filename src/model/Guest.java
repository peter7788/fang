package model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Guest implements Serializable {

	// 用户名称
	private String user_name;
	// 电子邮箱
	private String user_email;
	// 用户密码
	private String user_password;
	// 用户等级（0为管理员，1为客户）
	private int user_level;

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public int getUser_level() {
		return user_level;
	}

	public void setUser_level(int user_level) {
		this.user_level = user_level;
	}
}
