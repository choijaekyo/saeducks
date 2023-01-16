package kr.co.seaduckene;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.seaduckene.board.service.IBoardService;
import kr.co.seaduckene.product.command.ProductImageVO;
import kr.co.seaduckene.product.service.IProductService;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.util.BoardUserVO;
import lombok.extern.log4j.Log4j;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IProductService service;
	
	@Autowired
	private IBoardService bService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		List<ProductImageVO> list;
		List<BoardUserVO> bList;
		UserVO loginVo = (UserVO)session.getAttribute("login");
		
		if(loginVo == null) {
			System.out.println("login 세션 없음");
			list = service.mainImageNo();
			bList = bService.bUserNoList();
		
		} else {
			System.out.println("login 세션 있음");
			list = service.mainImage(loginVo.getUserNo());
			bList = bService.bUserList(loginVo.getUserNo());
			
		}
		
		System.out.println("사진리스트:"+list);
		

		model.addAttribute("boardList", bList );
		model.addAttribute("mainListImg", list );
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
