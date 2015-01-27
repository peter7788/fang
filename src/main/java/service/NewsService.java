package service;

import java.util.List;
import javax.servlet.ServletContext;
import model.News;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import dao.NewsDao;

public class NewsService extends TotalService {

	/**
	 * 添加新闻
	 * 
	 * @param news
	 */
	public void addNews(News news) {
		Session session = sessionFactory.openSession();
		new NewsDao().addNews(session, news);
		session.close();
		addToServletContext(news);
	}

	/**
	 * 查询所有新闻
	 * 
	 * @return
	 */
	public List<News> findAll() {
		Session session = sessionFactory.openSession();
		List<News> list = new NewsDao().findAll(session);
		session.close();
		return list;
	}

	/**
	 * 根据id查找新闻
	 * 
	 * @return
	 */
	public News findById(int id) {
		Session session = sessionFactory.openSession();
		News news = new NewsDao().findById(session, id);
		session.close();
		return news;
	}

	/**
	 * 更新新闻
	 * 
	 * @param news
	 */
	public void updateNews(News news) {
		Session session = sessionFactory.openSession();
		new NewsDao().updateNews(session, news);
		session.close();
	}

	/**
	 * 删除新闻
	 * 
	 * @param news
	 */
	public void deleteNews(News news) {
		Session session = sessionFactory.openSession();
		new NewsDao().deleteNews(session, news);
		session.close();
		deleteFromServletContext(news);
	}

	/**
	 * 更新缓存中的数据
	 * 
	 * @param news
	 */
	public void addToServletContext(News news) {
		ServletContext context = ServletActionContext.getServletContext();
		String newsListString = (String) context.getAttribute("newsList");
		JSONArray jsonArray;
		if (newsListString != null) {
			jsonArray = (JSONArray) JSONSerializer.toJSON(newsListString);
		} else {
			jsonArray = new JSONArray();
		}
		jsonArray.add(news.toJson());
		context.setAttribute("newsList", jsonArray.toString());
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param news
	 */
	public void deleteFromServletContext(News news) {
		ServletContext context = ServletActionContext.getServletContext();
		String newsListString = (String) context.getAttribute("newsList");
		JSONArray jsonArray = (JSONArray) JSONSerializer.toJSON(newsListString);
		for (int i = 0; i < jsonArray.size(); i++) {
			News temp = (News) JSONObject.toBean((JSONObject) jsonArray.get(i),
					News.class);
			if (temp.getId() == news.getId()) {
				jsonArray.remove(i);
				break;
			}
		}
		context.setAttribute("newsList", jsonArray.toString());
	}
}
