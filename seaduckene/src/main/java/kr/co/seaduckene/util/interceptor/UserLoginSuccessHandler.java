package kr.co.seaduckene.util.interceptor;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.FlashMapManager;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.service.IUserService;
import lombok.extern.log4j.Log4j;

@Log4j
public class UserLoginSuccessHandler implements HandlerInterceptor {
	
	@Autowired
	private IUserService userService;

	//컨트롤러가 동작한 이후에 실행되는 핸들러 (postHandle) 오버라이딩.
	// /login 요청으로 들어올 때 실행되도록 xml 파일에 빈으로 등록 후 매핑.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		UserVO user = (UserVO) modelAndView.getModel().get("userVo");
		log.info(user);

		if (user == null) {
			FlashMap fm = new FlashMap();
			fm.put("msg", "loginFail");
			FlashMapManager fmm = RequestContextUtils.getFlashMapManager(request);
			fmm.saveOutputFlashMap(fm, request, response);
			modelAndView.setViewName("redirect:/user/userLogin");

		} else {
			log.info("로그인 성공!"); 
			
			if ((int) modelAndView.getModel().get("autoLoginCheck") == 1) {				
					long expiredTime = 60 * 60 * 3;
					
					String loginSessionId = request.getSession().getId();
					
					Cookie autoLoginCookie = new Cookie("autoLoginCookie", loginSessionId);
					autoLoginCookie.setPath(request.getContextPath() + "/");
					autoLoginCookie.setMaxAge((int)expiredTime);
					response.addCookie(autoLoginCookie);
					
					long expiredDateSeconds = System.currentTimeMillis() + expiredTime * 1000;
					Timestamp expiredDate = new Timestamp(expiredDateSeconds);
					
					user.setUserSessionId(loginSessionId);
					user.setUserCookieExpireDate(expiredDate);
					
					userService.setAutoLogin(user);
			} else {
				userService.undoAutoLogin(user.getUserNo());
			}
			 

			HttpSession session = request.getSession();
			user = userService.getUserVoWithNo(user.getUserNo());
			session.setAttribute("login", user);

			modelAndView.setViewName("redirect:/");
		}
	}
}
