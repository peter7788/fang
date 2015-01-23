package action;

import model.Subscriber;
import service.SubscriberService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class SubscriberAction extends ActionSupport {

	// 名称
	private String name;
	// 电子邮箱
	private String email;

	/**
	 * 增加订阅邮箱
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addSubscriber() throws Exception {
		if (new SubscriberService().findByEmail(email) == null) {
			Subscriber subscriber = new Subscriber();
			subscriber.setName(name);
			subscriber.setEmail(email);
			new SubscriberService().addSubscriber(subscriber);
		}
		return SUCCESS;
	}

	/**
	 * 删除订阅邮箱
	 * 
	 * @return
	 * @throws Exception
	 */
	public String deleteSubscriber() throws Exception {
		Subscriber subscriber = new SubscriberService().findByEmail(email);
		if (subscriber != null) {
			new SubscriberService().deleteSubscriber(subscriber);
		}
		return SUCCESS;
	}

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
}
