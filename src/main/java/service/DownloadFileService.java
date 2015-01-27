package service;

import java.util.List;
import javax.servlet.ServletContext;
import model.DownloadFile;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import dao.DownloadFileDao;

public class DownloadFileService extends TotalService {

	/**
	 * 添加下载文件
	 * 
	 * @param downloadFile
	 */
	public void addDownloadFile(DownloadFile downloadFile) {
		Session session = sessionFactory.openSession();
		new DownloadFileDao().addDownloadFile(session, downloadFile);
		session.close();
		addToServletContext(downloadFile);
	}

	/**
	 * 查询所有下载文件
	 * 
	 * @return
	 */
	public List<DownloadFile> findAll() {
		Session session = sessionFactory.openSession();
		List<DownloadFile> list = new DownloadFileDao().findAll(session);
		session.close();
		return list;
	}

	/**
	 * 根据id查找下载文件
	 * 
	 * @return
	 */
	public DownloadFile findById(int id) {
		Session session = sessionFactory.openSession();
		DownloadFile downloadFile = new DownloadFileDao().findById(session, id);
		session.close();
		return downloadFile;
	}

	/**
	 * 更新下载文件
	 * 
	 * @param downloadFile
	 */
	public void updateDownloadFile(DownloadFile downloadFile) {
		Session session = sessionFactory.openSession();
		new DownloadFileDao().updateDownloadFile(session, downloadFile);
		session.close();
	}

	/**
	 * 删除下载文件
	 * 
	 * @param downloadFile
	 */
	public void deleteDownloadFile(DownloadFile downloadFile) {
		Session session = sessionFactory.openSession();
		new DownloadFileDao().deleteDownloadFile(session, downloadFile);
		session.close();
		deleteFromServletContext(downloadFile);
	}

	/**
	 * 更新缓存中的数据
	 * 
	 * @param downloadFile
	 */
	public void addToServletContext(DownloadFile downloadFile) {
		ServletContext context = ServletActionContext.getServletContext();
		String downloadFileListString = (String) context
				.getAttribute("downloadFileList");
		JSONArray jsonArray;
		if (downloadFileListString != null) {
			jsonArray = (JSONArray) JSONSerializer
					.toJSON(downloadFileListString);
		} else {
			jsonArray = new JSONArray();
		}
		jsonArray.add(downloadFile.toJson());
		context.setAttribute("downloadFileList", jsonArray.toString());
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param downloadFile
	 */
	public void deleteFromServletContext(DownloadFile downloadFile) {
		ServletContext context = ServletActionContext.getServletContext();
		String downloadFileListString = (String) context
				.getAttribute("downloadFileList");
		JSONArray jsonArray = (JSONArray) JSONSerializer
				.toJSON(downloadFileListString);
		for (int i = 0; i < jsonArray.size(); i++) {
			DownloadFile temp = (DownloadFile) JSONObject.toBean(
					(JSONObject) jsonArray.get(i), DownloadFile.class);
			if (temp.getId() == downloadFile.getId()) {
				jsonArray.remove(i);
				break;
			}
		}
		context.setAttribute("downloadFileList", jsonArray.toString());
	}
}
