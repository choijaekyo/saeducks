package kr.co.seaduckene.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import lombok.extern.log4j.Log4j;

@Log4j
public class AdminLoginAccessHandler implements HandlerInterceptor {

	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Integer loginAdmin = (Integer) session.getAttribute("admin");
		
		if (request.getRequestURI().equals("/admin/adminLogin") || request.getRequestURI().equals("/admin/adminLoginAuth")
				|| request.getRequestURI().equals("/admin/askWrite") || request.getRequestURI().equals("/admin/askCategoryBoard")) {
			return true;
		}
		
		if (loginAdmin == null) {
			log.info(loginAdmin + ": 관리자 세션 없음.");
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			String contPath = request.getContextPath();
			
			String htmlCodes = "	<script>\r\n"
					+ "	alert('관리자만 접근할 수 있는 페이지입니다.');\r\n"
					+ "	location.href='" + contPath + "/admin/adminLogin';\r\n"
					+ "</script>";
			out.print(htmlCodes);
			out.flush();
			
			out.close();
			return false;
		}
		log.info("관리자 세션: " + loginAdmin);
		return true;
		
	}
}
