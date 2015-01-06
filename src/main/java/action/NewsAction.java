package action;

import model.News;
import service.NewsService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class NewsAction extends ActionSupport {

	// 主键id
	private int id;
	// 新闻标题
	private String title;
	// 新闻链接
	private String link;

	/**
	 * 添加新闻
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addNews() throws Exception {
		News news = new News();
		news.setTitle(title);
		news.setLink(link);
		System.out.println(title);
		System.out.println(link);
		new NewsService().addNews(news);

		return SUCCESS;
	}

	/**
	 * 删除广告
	 * 
	 * @return
	 * @throws Exception
	 */
	public String deleteNews() throws Exception {
		News news = new NewsService().findById(id);
		if (news != null) {
			new NewsService().deleteNews(news);
		}

		return SUCCESS;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
