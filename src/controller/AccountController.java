package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {
	private String username;//用户名
	private String password;//密码
	/**
	 * 登录验证操作
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login")
	public void login(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("登录验证！");
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 	
	}
	
	@RequestMapping(value = "search")
	public void search(HttpServletRequest request, HttpServletResponse response){
		
	}
}