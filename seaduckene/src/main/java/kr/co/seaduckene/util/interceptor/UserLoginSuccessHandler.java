package kr.co.seaduckene.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.seaduckene.user.command.UserVO;
import lombok.extern.log4j.Log4j;

@Log4j
public class UserLoginSuccessHandler implements HandlerInterceptor {

	//컨트롤러가 동작한 이후에 실행되는 핸들러 (postHandle) 오버라이딩.
	// /login 요청으로 들어올 때 실행되도록 xml 파일에 빈으로 등록 후 매핑.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		UserVO user = (UserVO) modelAndView.getModel().get("userVo");


		if (user == null) {
			FlashMap fm = new FlashMap();
			fm.put("msg", "loginFail");
			FlashMapManager fmm = RequestContextUtils.getFlashMapManager(request);
			fmm.saveOutputFlashMap(fm, request, response);
			modelAndView.setViewName("redirect:/user/userLogin");

		} else {
			log.info("로그인 성공!");
			/* 쿠키는 자동로그인. 나중에 구현  
			 * Cookie cookie = new Cookie("login", user.getUserId());
			 * cookie.setPath(request.getContextPath() + "/");
			 * cookie.setMaxAge(40);
			 * response.addCookie(cookie);
			 */

			HttpSession session = request.getSession();
			session.setAttribute("login", user);

			modelAndView.setViewName("redirect:/");
		}
	}
}
