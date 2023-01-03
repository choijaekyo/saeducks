package kr.co.seaduckene.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.seaduckene.product.service.IProductService;

public class homeHandler implements HandlerInterceptor {
	
	@Autowired
	private IProductService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		/* service.mainImage(productNo); */
		
		
		return false;
	}
	

}















