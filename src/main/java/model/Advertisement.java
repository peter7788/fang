package model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class Advertisement implements Serializable {

	// 主键id
	private int id;
	// 广告标题
	private String title;
	// 广告图片地址
	private String img_src;
	// 广告图片的跳转链接
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

	public String getImg_src() {
		return img_src;
	}

	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}