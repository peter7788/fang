package action;

import java.util.Locale;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class LanguageAction extends ActionSupport {

	/**
	 * 语言转换
	 * 
	 * @return
	 */
	public String changeLanguage() {
		Locale locale=new Locale("en","US");
		//System.out.println(ServletActionContext.getRequest().getSession().getAttribute("WW_TRANS_I18N_LOCALE"));
		//ServletActionContext.getRequest().getSession().setAttribute("WW_TRANS_I18N_LOCALE", locale);
		ActionContext.getContext().getSession().put("WW_TRANS_I18N_LOCALE", locale);
		
		//System.out.println(locale);
		System.out.println(ServletActionContext.getRequest().getRequestURI());
		return SUCCESS;
	}
}