package listener;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import net.sf.json.JSONArray;
import model.Advertisement;
import model.HouseInfo;
import model.Message;
import service.AdvertisementService;
import service.HouseInfoService;
import service.MessageService;

public class InitListener implements ServletContextListener {

	@Override
	/**
	 * 把留言的数据在web初始化的时候存入application当中
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		initMessage(sce);
		initHouseInfo(sce);
		initAdvertisement(sce);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

	/**
	 * 初始化所有的留言信息
	 * 
	 * @param sce
	 */
	public void initMessage(ServletContextEvent sce) {
		List<Message> messageList = new MessageService().findAll();
		if (messageList != null) {
			JSONArray jsonArray = new JSONArray();
			for (Message message : messageList) {
				jsonArray.add(message.toJson());
			}
			ServletContext context = sce.getServletContext();
			context.setAttribute("messageList", jsonArray.toString());
		}
	}

	/**
	 * 初始化所有的房屋信息
	 * 
	 * @param sce
	 */
	public void initHouseInfo(ServletContextEvent sce) {
		List<HouseInfo> houseInfoList = new HouseInfoService().findAll();
		if (houseInfoList != null) {
			JSONArray jsonArray = new JSONArray();
			for (HouseInfo houseInfo : houseInfoList) {
				jsonArray.add(houseInfo.toJson());
			}
			ServletContext context = sce.getServletContext();
			context.setAttribute("houseInfoList", jsonArray.toString());
		}
	}

	/**
	 * 初始化所有的广告信息
	 * 
	 * @param sce
	 */
	public void initAdvertisement(ServletContextEvent sce) {
		List<Advertisement> advertisementList = new AdvertisementService()
				.findAll();
		if (advertisementList != null) {
			JSONArray jsonArray = new JSONArray();
			for (Advertisement advertisement : advertisementList) {
				jsonArray.add(advertisement.toJson());
			}
			ServletContext context = sce.getServletContext();
			context.setAttribute("advertisementList", jsonArray.toString());
		}
	}
}
