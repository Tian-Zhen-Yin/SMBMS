package ksd.smbms.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import ksd.smbms.user.pojo.User;
import ksd.smbms.user.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
@RequestMapping("/logincon")
public class LoginController {
	@Resource(name="userService")
	private UserService userService;
	
	@RequestMapping("/login")
	public String login(@RequestParam("userCode")String userCode,
			@RequestParam("userPassword")String userPassword,
			HttpSession session){
		User user = userService.login(userCode, userPassword);
		if (user!=null) {
			session.setAttribute("userSession", user);
			session.setAttribute("currentUser", user.getUserCode());
			return "index";
		}else {
			return "error";
		}
		
	}
	@RequestMapping("/tologin")
	public String tologin() {
		return "login01";
	}
	@RequestMapping("/quit")
	public String quit(HttpSession session) {
		session.invalidate();
		return "login01";
	}
	@RequestMapping("/index")
	public String home() {

		return "index";
	}
}
