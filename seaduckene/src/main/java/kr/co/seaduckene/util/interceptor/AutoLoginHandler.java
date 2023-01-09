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
import kr.co.seaduckene.user.service.IUserService;
import lombok.extern.log4j.Log4j;

@Log4j
public class AutoLoginHandler implements HandlerInterceptor {
	
	@Autowired
	private IUserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie autoLoginCookie = WebUtils.getCookie(request, "autoLoginCookie");
		HttpSession session = request.getSession();
		// 현재 로그인 상태의 세션에서 얻은 유저 정보.
		UserVO loginUser = (UserVO) session.getAttribute("login");
		
		// 쿠키의 세션 아이디 정보로 검색해서 얻은 유저 정보.
		UserVO userVo = userService.getUserBySessionId(autoLoginCookie.getValue());
		log.info("autoLogin userVo: " + userVo);

		// 로그인 중
		if (loginUser != null) {
			
		} else { // 로그인 아닌 상태
			// 이전에 자동로그인 선택함. <- userVo 변수 사용 가능.
			if (autoLoginCookie != null) {
				// 자동 로그인 선택한 유저 정보 없음.
				if (userService.getUserBySessionId(autoLoginCookie.getValue()) == null) {
					autoLoginCookie.setPath(request.getContextPath() + "/");
					autoLoginCookie.setMaxAge(0);
					response.addCookie(autoLoginCookie);
					userService.undoAutoLogin(userVo.getUserNo());
				} else { // 자동 로그인 선택한 유저 정보 있음
					session.setAttribute("login", userVo);
				}
				
			} else {// 이전에 자동로그인 선택한 정보 없음.
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				String contPath = request.getContextPath();
				session.removeAttribute("login");
				
				String htmlCodes = "	<script>\r\n"
						+ "	alert('자동 로그인 정보가 만료되었습니다.\n로그인 페이지로 이동합니다.');\r\n"
						+ "	location.href='" + contPath + "/user/userLogin';\r\n"
						+ "</script>";
				out.print(htmlCodes);
				out.flush();
				
				out.close();
				
			}
		}
		
		return true;
	}

}
