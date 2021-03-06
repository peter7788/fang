package listener;

import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import net.sf.json.JSONArray;
import model.Advertisement;
import model.DownloadFile;
import model.Guest;
import model.HouseInfo;
import model.Message;
import model.News;
import model.Subscriber;
import service.AdvertisementService;
import service.DownloadFileService;
import service.GuestService;
import service.HouseInfoService;
import service.MessageService;
import service.NewsService;
import service.SubscriberService;

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
		initDownloadFile(sce);
		initSubscriber(sce);
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
			JSONArray jsonArrayNew = new JSONArray();
			JSONArray jsonArrayHot = new JSONArray();
			for (HouseInfo houseInfo : houseInfoList) {
				if (houseInfo.getMark().equals("new")) {
					jsonArrayNew.add(houseInfo.toJson());
				} else {
					jsonArrayHot.add(houseInfo.toJson());
				}
			}
			ServletContext context = sce.getServletContext();
			context.setAttribute("newHouseInfoList", jsonArrayNew.toString());
			context.setAttribute("hotHouseInfoList", jsonArrayHot.toString());
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

	/**
	 * 初始化所有的下载文件
	 * 
	 * @param sce
	 */
	public void initDownloadFile(ServletContextEvent sce) {
		List<DownloadFile> downloadFileList = new DownloadFileService()
				.findAll();
		if (downloadFileList != null) {
			JSONArray jsonArray = new JSONArray();
			for (DownloadFile downloadFile : downloadFileList) {
				jsonArray.add(downloadFile.toJson());
			}
			ServletContext context = sce.getServletContext();
			context.setAttribute("downloadFileList", jsonArray.toString());
		}
	}

	/**
	 * 初始化所有的订阅邮箱
	 * 
	 * @param sce
	 */
	public void initSubscriber(ServletContextEvent sce) {
		List<Subscriber> subscriberList = new SubscriberService().findAll();
		if (subscriberList != null) {
			JSONArray jsonArray = new JSONArray();
			for (Subscriber subscriber : subscriberList) {
				jsonArray.add(subscriber.toJson());
			}
			ServletContext context = sce.getServletContext();
			context.setAttribute("subscriberList", jsonArray.toString());
		}
	}
}
