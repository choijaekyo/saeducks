package kr.co.seaduckene.util.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.product.service.IProductService;
import lombok.extern.log4j.Log4j;

@Log4j
public class CategoryHandler implements HandlerInterceptor {
	
	@Autowired
	private IProductService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("Action CategoryHandler");
		
		
		List<String> majorList = service.getMajor();	
		//model.addAttribute("majorList", majorList);
		request.setAttribute("majorListHeader", majorList);
		
		List<CategoryVO> categoryList = service.getCategory();
		//model.addAttribute("categoryList" , categoryList);
		request.setAttribute("ctListHeader" , categoryList);
		
		return true;
	}

}
