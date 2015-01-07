package action;

import java.io.File;
import org.apache.struts2.ServletActionContext;
import model.Advertisement;
import service.AdvertisementService;
import util.Upload;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdvertisementAction extends ActionSupport {

	private int id;// 主键id
	private String title;// 广告标题
	private String savePath;// 上传文件的保存路径
	private String sizeLimit;// 上传文件的大小限制
	private File upload;// 上传文件
	private String uploadContentType;// 上传文件类型
	private String uploadFileName;// 上传文件的文件名

	/**
	 * 添加广告信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String addAdvertisement() throws Exception {
		if (getUpload().length() > Long.parseLong(sizeLimit)) {
			return ERROR;
		} else {
			Advertisement advertisement = new Advertisement();
			advertisement.setTitle(title);
			advertisement.setImg_src(savePath + "/" + getUploadFileName());
			new AdvertisementService().addAdvertisement(advertisement);
			new AdvertisementService().addToServletContext(advertisement);
			Upload.upload(getSavePath(), getUploadFileName(), getUpload());

			return SUCCESS;
		}
	}

	/**
	 * 删除广告
	 * 
	 * @return
	 * @throws Exception
	 */
	public String deleteAdvertisement() throws Exception {
		Advertisement advertisement = new AdvertisementService().findById(id);
		if (advertisement != null) {
			new AdvertisementService().deleteAdvertisement(advertisement);
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
