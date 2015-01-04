package action;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import service.GuestService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class ChangePasswordController extends ActionSupport {
	// 旧密码
	private String old_password;
	// 新密码
	private String new_password;

	/**
	 * 修改密码
	 * 
	 * @return
	 * @throws Exception
	 */
	public String changePassword() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		if (session.getAttribute("user_name") != null) {
			String userName = (String) session.getAttribute("user_name");
			if (new GuestService().changePassword(userName, old_password,
					new_password)) {
				return SUCCESS;
			} else {
				return ERROR;
			}
		} else {
			return ERROR;
		}
	}

	public String getOld_password() {
		return old_password;
	}

	public void setOld_password(String old_password) {
		this.old_password = old_password;
	}

	public String getNew_password() {
		return new_password;
	}

	public void setNew_password(String new_password) {
		this.new_password = new_password;
	}
}
