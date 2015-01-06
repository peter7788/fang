package model;

import java.io.Serializable;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class News implements Serializable {

	// 主键id
	private int id;
	// 新闻标题
	private String title;
	// 新闻链接
	private String link;

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

	public JSONObject toJson() {
		JSONObject temp = new JSONObject();
		temp.put("id", id);
		temp.put("title", title);
		temp.put("link", link);
		return temp;
	}
}
