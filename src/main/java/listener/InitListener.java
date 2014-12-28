package listener;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import model.Message;
import service.MessageService;

public class InitListener implements ServletContextListener {

	@Override
	/**
	 * 把留言的数据在web初始化的时候存入application当中
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		List<Message> messageList = new MessageService().findAll();
		if (messageList != null) {
			ServletContext context = sce.getServletContext();
			context.setAttribute("messageList", messageList);
		}
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}
}
