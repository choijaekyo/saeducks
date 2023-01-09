package kr.co.seaduckene.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.mapper.IUserMapper;
import lombok.extern.log4j.Log4j;

@Log4j
public class AutoLoginHandler implements HandlerInterceptor {
	
	@Autowired
	private IUserMapper userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie autoLoginCookie = WebUtils.getCookie(request, "autoLoginCookie");
		
		if (autoLoginCookie != null) {
			UserVO userVo = userService.getUserBySessionId(autoLoginCookie.getValue());
			log.info("autoLogin userVo: " + userVo);
			
			if (userVo != null) {
				
				long expiredDateSeconds = userVo.getUserCookieExpireDate().getTime();
				if ((System.currentTimeMillis() - expiredDateSeconds) >= 0) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					String contPath = request.getContextPath();
					
					String htmlCodes = "	<script>\r\n"
							+ "	alert('자동 로그인 정보가 만료되었습니다.\n로그인 페이지로 이동합니다.');\r\n"
							+ "	location.href='" + contPath + "/user/userLogin';\r\n"
							+ "</script>";
					out.print(htmlCodes);
					out.flush();
					
					out.close();
					return false;
					
				}
				
				HttpSession session = request.getSession();
				session.setAttribute("login", userVo);
			}
		}
		
		return true;
	}

}
