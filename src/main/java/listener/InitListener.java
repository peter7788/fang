package listener;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import net.sf.json.JSONArray;
import model.Advertisement;
import model.Guest;
import model.HouseInfo;
import model.Message;
import model.News;
import service.AdvertisementService;
import service.GuestService;
import service.HouseInfoService;
import service.MessageService;
import service.NewsService;

public class InitListener implements ServletContextListener {

	@Override
	/**
	 * 把留言的数据在web初始化的时候存入application当中
	 */
	public void contextInitialized(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		initData();// initData()一定要放在initAdvertisement(sce)前面
		initMessage(sce);
		initHouseInfo(sce);
		initAdvertisement(sce);
		initNews(sce);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub

	}

	/**
	 * 初始化部分数据库信息
	 */
	public void initData() {
		// 增加默认的管理员账户
		Guest guest = new Guest();
		guest.setUser_email("helen_xu_sg@163.com");
		guest.setUser_name("Helen_Xu");
		guest.setUser_password("helen@helen");
		guest.setUser_level(0);
		new GuestService().addGuest(guest);
		// 增加默认广告
		List<Advertisement> adList = new AdvertisementService().findAll();
		if (adList == null || adList.size() == 0) {
			Advertisement ad1 = new Advertisement();
			ad1.setTitle("图一");
			ad1.setImg_src("images/image1.jpg");
			Advertisement ad2 = new Advertisement();
			ad2.setTitle("图二");
			ad2.setImg_src("images/image2.jpg");
			Advertisement ad3 = new Advertisement();
			ad3.setTitle("图三");
			ad3.setImg_src("images/image3.jpg");
			new AdvertisementService().addAdvertisement(ad1);
			new AdvertisementService().addAdvertisement(ad2);
			new AdvertisementService().addAdvertisement(ad3);
		}
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

	/**
	 * 初始化所有的新闻信息
	 * 
	 * @param sce
	 */
	public void initNews(ServletContextEvent sce) {
		List<News> newsList = new NewsService().findAll();
		if (newsList != null) {
			JSONArray jsonArray = new JSONArray();
			for (News news : newsList) {
				jsonArray.add(news.toJson());
			}
			ServletContext context = sce.getServletContext();
			context.setAttribute("newsList", jsonArray.toString());
		}
	}
}
