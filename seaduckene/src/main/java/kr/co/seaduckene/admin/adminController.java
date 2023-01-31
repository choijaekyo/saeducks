package kr.co.seaduckene.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.seaduckene.admin.command.AdminSearchVO;
import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.admin.command.AskListVO;
import kr.co.seaduckene.admin.service.IAdminService;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.user.command.Categories;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.service.IUserService;
import kr.co.seaduckene.util.AskCategoryBoardVO;
import kr.co.seaduckene.util.summernoteCopy;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/admin")
@Log4j
public class adminController {
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IAdminService service;

	// 관리자 로그인페이지
	@GetMapping("/adminLogin")
	public String adminLogin(HttpSession session) {
		
		if(session.getAttribute("admin")==null) {
			return"/admin/adminLogin";
		}
		return"/admin/adminMain";
	}
	
	// 관리자 로그인
	@PostMapping("/adminLoginAuth")
	public ModelAndView adminLogin(AdminVO adminVO, ModelAndView modelAndView) {		
		modelAndView.addObject("adminVO", service.getAdminVo(adminVO));	
		return modelAndView;
	}
	
	// 관리자 로그아웃 
	@GetMapping("/adminLogout")
	public String adminLogout(HttpSession session, RedirectAttributes ra) {
		session.removeAttribute("admin");
		
		ra.addFlashAttribute("msg", "adminLogout");
		return "redirect:/";
	}
	
	// 관리자 메인
	@GetMapping("/adminMain")
	public void adminMain() {}
	
	// 공지사항 등록 페이지
	@GetMapping("/NoticeAddPage")
	public void NoticeAddPage() {}
	
	// 공지사항 등록
	@PostMapping("/adminNoticeCreate")
	public String adminNoticeCreate(NoticeVO vo, @RequestParam(value="filename", required=false) List<String> summerfile) throws Exception {
		String noticeContent;
		noticeContent = vo.getNoticeContent();
		String editordata = noticeContent.replaceAll("summernoteImage","getImg");
		vo.setNoticeContent(editordata);
		service.write(vo);

		summernoteCopy copy = new summernoteCopy();
		copy.summerCopy(summerfile);
		
		return "redirect:/admin/adminMain";
	}
	
	// 주문목록 페이지
	@GetMapping("/userSearch")
	public void userSearch(Model model,String type, String keyword) {
		List<AdminSearchVO> list = service.usersSearch(type, keyword);
		model.addAttribute("list" , list);
	}	
	
	//송장번호 등록
	@GetMapping("/invoice")
	public String insertInvoice(String invoiceNum, String orderNum, RedirectAttributes ra) {
		System.out.println("송장번호:" + invoiceNum);
		System.out.println("주문번호:" + orderNum);
		service.insertInvoice(invoiceNum, orderNum);
		ra.addFlashAttribute("msg", "done");
		return "redirect:/admin/userSearch";
	}
	
	// 주문취소
	@GetMapping("/cancle")
	public String cancleOrder(String orderNum, RedirectAttributes ra) {
		service.cancleOrder(orderNum);
		ra.addFlashAttribute("msg", "cancle");
		return "redirect:/admin/userSearch";
	}
	
	// 환불처리
	@GetMapping("/refund")
	public String refund(String orderNum, RedirectAttributes ra) {
		service.refund(orderNum);
		ra.addFlashAttribute("msg", "refund");
		return "redirect:/admin/userSearch";
	}
	
	// 상품목록 페이지
	@GetMapping("/productList")
	public void productList(Model model,String type, String keyword) {
		model.addAttribute("list", service.getProductList(type, keyword));
	}

	// 문의 페이지
	@GetMapping("/askWrite")
	public String askWrite(Model model, HttpSession session) {
		UserVO userVo = (UserVO) session.getAttribute("login");
		/* log.info(userVo); */
		model.addAttribute("askList",service.getAskLisk(userVo.getUserNo()));
		return "admin/askWrite";
	}

	// 문의 글쓰기 요청
	@PostMapping("/askWrite")
	public String askWrite(AskListVO vo) {
		
		String content = ((String) vo.getAskListContent()).replace("\r\n","<br>");
		
		vo.setAskListContent(content);
		
		service.setAsk(vo);
		
		return "redirect:/admin/askWrite";
	}
	
	// 관리자 문의 게시판
	@GetMapping("/askAdminList")
	public String askAdminList(Model model, String type, String keyword) {

		List<AskListVO> list = service.getAskSearchList(type, keyword);
		model.addAttribute("searchList" , list);
		
		model.addAttribute("askAdminList",service.getAdminAskLisk());

		return "admin/askAdminList";
	}
	
	// 관리자 댓글 요청
	@PostMapping("/askAdminReply")
	public String askAdminReply(String askNo, String reply) {
		
		String content = ((String) reply.replace("\r\n","<br>"));

		service.setAskReply(askNo, content);
		
		return "redirect:/admin/askAdminList";
	}
	
	// 카테고리별 게시글 문의 요청 페이지 이동
	@GetMapping("/askCategoryBoard")
	public void askCategory(Model model) {
		
		List<Categories> categoryList = userService.getCategories();
		
		ObjectMapper categoryListConverter = new ObjectMapper();
		
		String categoryListJson = null;
		try {
			categoryListJson = categoryListConverter.writeValueAsString(categoryList);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info(categoryListJson);
		model.addAttribute("categoryListJson", categoryListJson);
	}
	
	// 카테고리별 게시글 문의 요청
	@PostMapping("/askCategoryBoard")
	public String askCategory(AskCategoryBoardVO askCateBoVo, RedirectAttributes ra) {
		log.info(askCateBoVo);
		
		service.insertCategoryBoard(askCateBoVo);
		
		ra.addFlashAttribute("msg", "askCategoryBoard");
		
		return "redirect:/";
	}
}
