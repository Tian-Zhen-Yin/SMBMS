package ksd.smbms.user.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import ksd.smbms.user.pojo.Role;
import ksd.smbms.user.pojo.User;
import ksd.smbms.user.service.RoleService;
import ksd.smbms.user.service.UserService;
import ksd.smbms.user.tools.Constants;
import ksd.smbms.user.tools.PageSupport;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

@Controller
@RequestMapping("/user")
public class UserController {
	@Resource(name="userService")
	private UserService userService;
	@Resource(name="roleService")
	private RoleService roleService;
	
	/**
	 * ����log4jע��
	 */
	private static final Logger log=Logger.getLogger(UserController.class);
	
	/*@RequestMapping("/login")
	public String login(@RequestParam("userCode")String userCode,
			@RequestParam("userPassword")String userPassword,
			HttpSession session){
		User user = userService.login(userCode, userPassword);
		if (user!=null) {
			session.setAttribute("userSession", user);
			return "frame";
		}else {
			return "error";
		}
		
	}*/
	@RequestMapping("/findAll")
	public String findAll(@RequestParam(value="queryname",required=false,defaultValue="")String queryUserName, 
			@RequestParam(value="queryUserRole",required=false,defaultValue="0")Integer queryUserRole, 
			@RequestParam(value="pageIndex",required=false,defaultValue="1")Integer currentPageNo,
			Model model) {
		//查询用户列表
		List<User> userList = null;
		//设置页面容量
		int pageSize = Constants.pageSize;
		//总数量（表）	
		int totalCount	= userService.getUserCount(queryUserName,queryUserRole);
		//总页数
		PageSupport pages=new PageSupport();
		pages.setCurrentPageNo(currentPageNo);
		pages.setPageSize(pageSize);
		pages.setTotalCount(totalCount);
		int totalPageCount = pages.getTotalPageCount();
		//控制首页和尾页
		if(currentPageNo < 1){
			currentPageNo = 1;
		}else if(currentPageNo > totalPageCount){
			currentPageNo = totalPageCount;
		}
		userList = userService.findAll(queryUserName,queryUserRole,(currentPageNo-1)*pageSize, pageSize);
		model.addAttribute("list", userList);
		List<Role> roleList = roleService.findAllRole();
		model.addAttribute("roleList", roleList);
		model.addAttribute("queryUserName", queryUserName);
		model.addAttribute("queryUserRole", queryUserRole);
		model.addAttribute("totalPageCount", totalPageCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("currentPageNo", currentPageNo);
		return "userlist";
	}

	@RequestMapping("/toAdd")
	public String toAdd(Map<String,Object> map){
		List<Role> rolelist=roleService.findAllRole();
		map.put("roleList", rolelist);
		return "useradd";
	}
	/**
	 * rolelist
	 */
	@RequestMapping("roleList")
	@ResponseBody
	public String userRolename() {
		List<Role> roleList = roleService.findAllRole();
		return JSONArray.toJSONString(roleList);
	}

	/**
	 * 增加时候验证账号的唯一性
	 */
	@RequestMapping(value="/checkName",
			method=RequestMethod.GET,
		produces="text/html;charset=utf-8")
	@ResponseBody
	public String checkName(@RequestParam("userCode") String userCode){
		String code =userService.checkName(userCode);
		String jsonString = null;
		if (userCode==null||userCode=="") {
			jsonString = JSON.toJSONString("false");
		}else{
			if(code != null){
				jsonString= JSON.toJSONString("exist");
			}else if(code == null){
				jsonString = JSON.toJSONString("noExist");
			}
		}
		
		return jsonString;
	}

	
	/**
	 * 执行增加
	 */
	@RequestMapping("/addUser")
	public String addUser(User user){
		Date da=new Date(new java.util.Date().getTime());
		user.setCreationDate(da);
		userService.addUser(user);
		return "redirect:findAll";
	}
	
	/**
	 * 删除用户
	 */
	@RequestMapping("/deleteUser")
	@ResponseBody
	public String deleteUser(int uid){
		userService.deleteUser(uid);
		String jsonString = JSON.toJSONString("true");
		return jsonString;
	}
	/**
	 * 查看用户信息
	 */
	@RequestMapping("/findById")
	public String findById(int uid,Model model){
		User user=userService.findById(uid);
		model.addAttribute("user", user);
		return "userview";
	}
	/**
	 * 修改用户信息
	 */
	@RequestMapping("/tomodify")
	public String getUserById(@RequestParam("uid")  int uid, Model model) {
		User user = userService.getUserById(uid);
		model.addAttribute("user", user);
		return "usermodify";
	}
	@RequestMapping("/modify")
	public String modifyUser(User user) {
		Date da=new Date(new java.util.Date().getTime());
		user.setModifyDate(da);
		userService.modifyUser(user);
		return "redirect:findAll";

	}
	/**
	 * 密码修改
	 */
	@RequestMapping("/toPwdUpdate")
	public String toPwdUpdate() {
		return "pwdmodify";
	}
	
	/*@RequestMapping("/tologin")
	public String quit() {
		return "login";
	}*/

	@RequestMapping("/pwdUpdate")
	public String pwdUpdate(String newpassword,HttpSession session,Model model){
		Object o = session.getAttribute(Constants.USER_SESSION);
		if(o != null && !StringUtils.isEmpty(newpassword)){
			int num = userService.updatePwd(((User)o).getId(),newpassword);
			if(num > 0){
				model.addAttribute(Constants.SYS_MESSAGE, "修改密码成功,请退出并使用新密码重新登录！");
				session.removeAttribute(Constants.USER_SESSION);//session注销
			}else{
				model.addAttribute(Constants.SYS_MESSAGE, "修改密码失败！");
			}
		}else{
			model.addAttribute(Constants.SYS_MESSAGE, "修改密码失败！");
		}
		session.invalidate();
		return "login";
	}

	@RequestMapping("/pwdIsRight")
	public @ResponseBody Object pwdIsRight(String oldpassword,HttpSession session, Model model) {
		Object o = session.getAttribute(Constants.USER_SESSION);
		Map<String, String> resultMap = new HashMap<String, String>();
		if(null == o ){//session过期
			resultMap.put("result", "sessionerror");
		}else if(StringUtils.isEmpty(oldpassword)){//旧密码输入为空
			resultMap.put("result", "error");
		}else{
			String sessionPwd = ((User)o).getUserPassword();
			System.out.println();
			if(oldpassword.equals(sessionPwd)){
				resultMap.put("result", "true");
			}else{//旧密码输入不正确
				resultMap.put("result", "false");
			}
		}
		return resultMap;
	}

}
