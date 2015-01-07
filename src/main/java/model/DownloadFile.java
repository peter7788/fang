package model;

import java.io.Serializable;
import net.sf.json.JSONObject;

@SuppressWarnings("serial")
public class DownloadFile implements Serializable {

	// 主键id
	private int id;
	// 文件名
	private String title;
	// 文件url
	private String file_url;

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

	public String getFile_url() {
		return file_url;
	}

	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}

	public JSONObject toJson() {
		JSONObject temp = new JSONObject();
		temp.put("id", id);
		temp.put("title", title);
		temp.put("file_url", file_url);
		return temp;
	}
}
