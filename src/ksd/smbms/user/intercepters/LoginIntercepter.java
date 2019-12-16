package ksd.smbms.user.intercepters;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登陆拦截器
 * @author admin
 *
 */
public class LoginIntercepter implements HandlerInterceptor{
	//响应完毕执行
	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
	//进行中，但是还没有响应
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		
	}
	//资源进入执行拦截
	@Override
	public boolean preHandle(
							HttpServletRequest req,
							HttpServletResponse resp,
							Object arg2) throws Exception {
		//登陆业务处理：验证是否登陆
		HttpSession session = req.getSession();
		String userKey = (String) session.getAttribute("currentUser");
		if (userKey!=null) {
			return true;
		}else{
			req.getRequestDispatcher("/WEB-INF/jsp/errpr.jsp").forward(req, resp);
		}
		return false;
	}

}
