package dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.DownloadFile;

public class DownloadFileDao {

	/**
	 * 添加下载文件
	 * 
	 * @param session
	 * @param downloadFile
	 */
	public void addDownloadFile(Session session, DownloadFile downloadFile) {
		Transaction tx = session.beginTransaction();
		session.save(downloadFile);
		tx.commit();
	}

	/**
	 * 查询所有下载文件
	 * 
	 * @param session
	 * @return
	 */
	public List<DownloadFile> findAll(Session session) {
		Transaction tx = session.beginTransaction();
		List<DownloadFile> list = (List<DownloadFile>) session.createQuery(
				"from DownloadFile").list();
		tx.commit();
		return list;
	}

	/**
	 * 查看某个下载文件
	 * 
	 * @param session
	 * @param id
	 * @return
	 */
	public DownloadFile findById(Session session, int id) {
		Transaction tx = session.beginTransaction();
		List<DownloadFile> downloadFileList = (List<DownloadFile>) session
				.createQuery("from DownloadFile where id=" + id).list();
		tx.commit();
		if (downloadFileList != null) {
			return downloadFileList.get(0);
		} else {
			return null;
		}
	}

	/**
	 * 更新下载文件
	 * 
	 * @param session
	 * @param downloadFile
	 */
	public void updateDownloadFile(Session session, DownloadFile downloadFile) {
		Transaction tx = session.beginTransaction();
		session.update(downloadFile);
		tx.commit();
	}

	/**
	 * 删除下载文件
	 * 
	 * @param session
	 * @param downloadFile
	 */
	public void deleteDownloadFile(Session session, DownloadFile downloadFile) {
		Transaction tx = session.beginTransaction();
		session.delete(downloadFile);
		tx.commit();
	}
}
