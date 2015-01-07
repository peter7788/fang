package action;

import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import org.apache.struts2.ServletActionContext;
import model.DownloadFile;
import service.DownloadFileService;
import util.Upload;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DownloadFileAction extends ActionSupport {

	private int id;// 主键id
	private String title;// 文件名
	private String file_url;// 文件url
	private String savePath;// 上传文件的保存路径
	private String sizeLimit;// 上传文件的大小限制
	private File upload;// 上传文件
	private String uploadContentType;// 上传文件类型
	private String uploadFileName;// 上传文件的文件名
	private String downloadFileName;// 下载文件的文件名

	/**
	 * 添加下载文件
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addDownloadFile() throws Exception {
		if (getUpload().length() > Long.parseLong(sizeLimit)) {
			return ERROR;
		} else {
			DownloadFile downloadFile = new DownloadFile();
			downloadFile.setTitle(getUploadFileName());
			downloadFile.setFile_url(savePath + "/" + getUploadFileName());
			new DownloadFileService().addDownloadFile(downloadFile);
			Upload.upload(getSavePath(), getUploadFileName(), getUpload());

			return SUCCESS;
		}
	}

	/**
	 * 删除下载文件
	 * 
	 * @return
	 * @throws Exception
	 */
	public String deleteDownloadFile() throws Exception {
		DownloadFile downloadFile = new DownloadFileService().findById(id);
		if (downloadFile != null) {
			new DownloadFileService().deleteDownloadFile(downloadFile);
		}

		return SUCCESS;
	}

	/**
	 * 下载文件
	 * 
	 * @return
	 * @throws Exception
	 */
	public InputStream getTargetFile() throws Exception {
		DownloadFile downloadFile = new DownloadFileService().findById(id);
		if (downloadFile != null) {
			downloadFileName = downloadFile.getTitle();
			return ServletActionContext.getServletContext()
					.getResourceAsStream(
							"/" + savePath + "/" + downloadFileName);
		} else {
			downloadFileName = "";
			return ServletActionContext.getServletContext()
					.getResourceAsStream("");
		}
	}

	/**
	 * 获取下载文件的名称
	 * 
	 * @return
	 */
	public String getDownloadFileName() {
		String downFileName = downloadFileName;
		try {
			downFileName = new String(downFileName.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return downFileName;
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

	public String getFile_url() {
		return file_url;
	}

	public void setFile_url(String file_url) {
		this.file_url = file_url;
	}

	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String value) {
		this.savePath = value;
	}

	public String getSizeLimit() {
		return sizeLimit;
	}

	public void setSizeLimit(String value) {
		this.sizeLimit = value;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
}
