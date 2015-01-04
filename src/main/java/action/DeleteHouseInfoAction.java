package action;

import javax.servlet.ServletContext;
import model.HouseInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;
import org.apache.struts2.ServletActionContext;
import service.HouseInfoService;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class DeleteHouseInfoAction extends ActionSupport {

	private int id;// 主键id

	/**
	 * 删除房屋信息
	 * 
	 * @return
	 * @throws Exception
	 */
	public String deleteHouseInfo() throws Exception {
		HouseInfo houseInfo = new HouseInfoService().findById(id);
		if (houseInfo != null) {
			new HouseInfoService().deleteHouseInfo(houseInfo);
		}
		deleteFromServletContext(houseInfo);
		return SUCCESS;
	}

	/**
	 * 删除缓存中的数据
	 * 
	 * @param houseInfo
	 */
	public void deleteFromServletContext(HouseInfo houseInfo) {
		ServletContext context = ServletActionContext.getServletContext();
		String houseInfoListString = (String) context
				.getAttribute("houseInfoList");
		JSONArray jsonArray = (JSONArray) JSONSerializer
				.toJSON(houseInfoListString);
		jsonArray.remove(houseInfo.toJson());
		context.setAttribute("houseInfoList", jsonArray.toString());
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
}
