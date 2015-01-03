package action;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import service.GuestService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class GuestController extends ActionSupport {

	// 用户名称
	private String user_name;
	// 用户密码
	private String user_password;

	/**
	 * 登录
	 * 
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {

		if (new GuestService().isExisted(user_name, user_password)) {
			HttpSession session = ServletActionContext.getRequest()
					.getSession();
			session.setAttribute("user_name", user_name);
			return SUCCESS;
		} else {
			return ERROR;
		}
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
}
