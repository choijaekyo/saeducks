package kr.co.seaduckene.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.seaduckene.user.command.UserVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class UserLoginVerifHandler implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		UserVO loginUser = (UserVO) session.getAttribute("login");
		if (loginUser != null) {
			log.info("로그인 세션: " + loginUser);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			String contPath = request.getContextPath();
			
			String htmlCodes = "	<script>\r\n"
					+ "	alert('유효하지 않은 접근입니다.\\n이미 로그인한 정보가 있습니다.\\n홈 화면으로 이동합니다.');\r\n"
					+ "	location.href='" + contPath + "/';\r\n"
					+ "</script>";
			out.print(htmlCodes);
			out.flush();
			
			out.close();	
			return false;
		}
		
		return true;
	}
	
}
