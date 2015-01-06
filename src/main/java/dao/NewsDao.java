package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.News;

public class NewsDao {

	/**
	 * 添加新闻
	 * 
	 * @param session
	 * @param news
	 */
	public void addNews(Session session, News news) {
		Transaction tx = session.beginTransaction();
		session.save(news);
		tx.commit();
	}

	/**
	 * 查询所有新闻
	 * 
	 * @param session
	 * @return
	 */
	public List<News> findAll(Session session) {
		Transaction tx = session.beginTransaction();
		List<News> list = (List<News>) session.createQuery("from News").list();
		tx.commit();
		return list;
	}

	/**
	 * 查看某个新闻
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	public News findById(Session session, int id) {
		Transaction tx = session.beginTransaction();
		List<News> newsList = (List<News>) session.createQuery(
				"from News where id=" + id).list();
		tx.commit();
		if (newsList != null) {
			return newsList.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 更新新闻
	 * 
	 * @param session
	 * @param news
	 */
	public void updateNews(Session session, News news) {
		Transaction tx = session.beginTransaction();
		session.update(news);
		tx.commit();
	}

	/**
	 * 删除新闻
	 * 
	 * @param session
	 * @param news
	 */
	public void deleteNews(Session session, News news) {
		Transaction tx = session.beginTransaction();
		session.delete(news);
		tx.commit();
	}
}
