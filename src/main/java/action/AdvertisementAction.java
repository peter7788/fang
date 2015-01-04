package action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import javax.servlet.ServletContext;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
import model.Advertisement;
import service.AdvertisementService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class AdvertisementAction extends ActionSupport {

	private int id;// 主键id
	private String title;// 广告标题
	private String savePath;// 上传文件的保存路径
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
		Advertisement advertisement = new Advertisement();
		advertisement.setTitle(title);
		advertisement.setImg_src(savePath + "/" + getUploadFileName());
		new AdvertisementService().addAdvertisement(advertisement);
		addToServletContext(advertisement);
		upload();

		return SUCCESS;
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
		deleteFromServletContext(advertisement);
		return SUCCESS;
	}

	/**
	 * 更新缓存中的数据
	 * 
	 * @param advertisement
	 */
	public void addToServletContext(Advertisement advertisement) {
		ServletContext context = ServletActionContext.getServletContext();
		String advertisementListString = (String) context
				.getAttribute("advertisementList");
		JSONArray jsonArray;
		if (advertisementListString != null) {
			jsonArray = (JSONArray) JSONSerializer
					.toJSON(advertisementListString);
		} else {
			jsonArray = new JSONArray();
		}
		jsonArray.add(advertisement.toJson());
		context.setAttribute("advertisementList", jsonArray.toString());
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param advertisement
	 */
	public void deleteFromServletContext(Advertisement advertisement) {
		ServletContext context = ServletActionContext.getServletContext();
		String advertisementListString = (String) context
				.getAttribute("advertisementList");
		JSONArray jsonArray = (JSONArray) JSONSerializer
				.toJSON(advertisementListString);
		jsonArray.remove(advertisement.toJson());
		context.setAttribute("advertisementList", jsonArray.toString());
	}

	/**
	 * 上传文件
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	public void upload() throws Exception {
		// TODO Auto-generated method stub
		FileOutputStream fos = new FileOutputStream(getSavePath() + "\\"
				+ getUploadFileName());
		FileInputStream fis = new FileInputStream(getUpload());
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
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
