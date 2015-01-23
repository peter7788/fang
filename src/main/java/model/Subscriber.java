package model;

import java.io.Serializable;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class Subscriber implements Serializable {

	// 名称
	private String name;
	// 电子邮箱
	private String email;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public JSONObject toJson() {
		JSONObject temp = new JSONObject();
		temp.put("name", name);
		temp.put("email", email);
		return temp;
	}
}
