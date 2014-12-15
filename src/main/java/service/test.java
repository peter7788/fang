package service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import model.Guest;
import model.HouseInfo;
import model.Message;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*添加客户方法测试
		Guest guest = new Guest();
		guest.setUser_email("24647@4646");
		guest.setUser_name("qiuyuejun2");
		guest.setUser_password("123456");
		guest.setUser_level(10);
		
		new GuestService().addGuest(guest);
		
		//查询所有用户测试
		List<Guest> list= new GuestService().findAll();
		for(Guest guest: list){
			System.out.println(guest.getUser_email());
		}
		
		
		//修改用户密码测试
		GuestService service=new GuestService();
		Guest guest=service.findGuest("qiuyuejun1","123456");
		guest.setUser_password("12456");
		service.changpwd(guest);
		System.out.println(guest.getUser_name());
		
		
		//删除用户测试
		GuestService service=new GuestService();
		Guest guest=service.findByName("qiuyuejun1");
		service.deleteGuest(guest);
		 */
		
		/*添加留言测试
		Message message=new Message();
		
		message.setUser_name("pantianxi");
		message.setMessage_time(new java.sql.Date(new java.util.Date().getTime()));
		message.setUser_email("7788@qq.com");
		message.setUser_phone("15179687895");
		message.setContent("留言测试内容");
		
		new MessageService().addMessage(message);
		*/
		//System.out.println(new java.sql.Date(System.currentTimeMillis()));
		
		/*查看用户留言测试、删除用户留言测试
		List<Message> list=new MessageService().findAll();
		for(Message msg:list){
			System.out.println("Message from '"+msg.getUsername()+"'");
		}
		
		Message message=list.get(0);
		new MessageService().deleteMessage(message);
		*/	
		
		/*添加房屋信息测试
		HouseInfo hi=new HouseInfo();
		HouseInfoService his=new HouseInfoService();
		
		hi.setZone("天河区");
		hi.setAddress("天河北888号");
		hi.setArea(200);
		hi.setPrice(100);
		hi.setType("一厅两房");
		hi.setDirection("E");
		hi.setFloor(18);
		hi.setAge(20);
		hi.setDecoration("毛坯");
		hi.setMark("急售");
		hi.setPublish_time(new java.sql.Date(114,10,1));
		his.addHouseInfo(hi);
		*/
		
		/*房屋信息查询
		HouseInfo hi=new HouseInfo();
		HouseInfoService his=new HouseInfoService();
		List<HouseInfo> houseInfo_list=null;
		houseInfo_list=his.findByCriteria(" where h.direction='E'"
				+ " and h.floor between '3' and '5' and h.type='一厅三房'"
				+ " and h.area between '150' and '200' and  h.price>'1000'"
				+ " and  h.age between '5' and '10' and  h.decoration='毛坯'");
		System.out.println(houseInfo_list.size());
		*/
		
		/*
		Advertisement ad1=new Advertisement();
		Advertisement ad2=new Advertisement();
		Advertisement ad3=new Advertisement();
		Advertisement ad4=new Advertisement();
		AdvertisementService ads=new AdvertisementService();
		
		ad1.setTitle("主题1");
		ad1.setImg_src("F:\\主题1.png");
		ad1.setLink("www.xxxxx1.com");
		ads.addAd(ad1);
		
		ad2.setTitle("主题2");
		ad1.setImg_src("F:\\主题2.png");
		ad1.setLink("www.xxxxx2.com");
		ads.addAd(ad1);
		
		ad3.setTitle("主题3");
		ad1.setImg_src("F:\\主题3.png");
		ad1.setLink("www.xxxxx3.com");
		ads.addAd(ad1);
		
		ad4.setTitle("主题4");
		ad1.setImg_src("F:\\主题4.png");
		ad1.setLink("www.xxxxx4.com");
		ads.addAd(ad1);
		
		//流文件读取保存
		try {
			//File fs=new File("img/主题1.png");
			File fs=new File(ad1.getImg_src());
			BufferedInputStream bis;
			bis = new BufferedInputStream(
					new FileInputStream(fs));
			BufferedOutputStream out=new BufferedOutputStream(new FileOutputStream("img/sample1.png"));
			byte[] buffer=new byte[1024];
			int len=0;
			while((len=bis.read(buffer))!=-1){
				out.write(buffer);
			} 
		}catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	*/
		
	}
}
