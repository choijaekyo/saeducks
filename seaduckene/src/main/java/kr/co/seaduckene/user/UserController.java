package kr.co.seaduckene.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.service.IBoardService;
import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.common.IAddressMapper;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.service.IUserService;
import kr.co.seaduckene.util.CertificationMailService;
import kr.co.seaduckene.util.PageVO;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {
	
	@Autowired
	private IBoardService boardService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private CertificationMailService mailService;
	

	@GetMapping("/userLogin")
	public void userLogin() {
		
	}
	
	@PostMapping("/userLoginAuth")
	public ModelAndView userLogin(UserVO userVO, ModelAndView modelAndView) {
		log.info(userVO);
		
		// 비밀번호 암호화는 나중에 구현할 것.
		
		modelAndView.addObject("userVo", userService.loginUser(userVO));
		
		return modelAndView;
	}
	
	@GetMapping("/userJoin")
	public void userJoin(HttpServletRequest request) {
		log.info(userService.getCategories());
		
		request.setAttribute("categoryList", userService.getCategories());
		request.setAttribute("majorLength", userService.getCategories().size() - 1);
		log.info(userService.getCategories().size() - 1);
	}
	
	@PostMapping("/userJoin")
	public ModelAndView userjoin(UserVO userVO, AddressVO addressVO, CategoryVO  boardCategoryVO, ModelAndView modelAndView, MultipartFile file) {
		log.info(userVO);
		log.info(addressVO);
		log.info(boardCategoryVO);
		
		
		//user table 등록
		userService.registUser(userVO);
		
		// 다른 곳에서 user정보가 필요할 시, 로그인 중인 세션에서 uservo 갖고 올 예정.
		// 계정 생성중에는 세션 정보가 없다.
		UserVO loginUserVO = userService.getUserVo(userVO.getUserId());
		int loginUserNo = loginUserVO.getUserNo();
		addressVO.setAddressUserNo(loginUserNo);
		
		//favorite table 등록
		userService.updateUserFavorites(boardCategoryVO, loginUserNo);
		
		if (!addressVO.getAddressBasic().equals("")) {
			// address table 등록
			userService.registAddr(addressVO);
		}
		
		modelAndView.setViewName("redirect:/user/userJoinSuccess");
		
		return modelAndView;
	}
	
	@GetMapping("/userJoinSuccess")
	public void userJoinSuccess() {};
	
	@GetMapping("/userFindAccount")
	public void userFindAccount() {
		
	}
	// email인증
	@ResponseBody
	@PostMapping("/userConfEmail")
	public String userConfEmail(@RequestBody String email) {
		System.out.println("email인증요청 들어옴");
		System.out.println(email);
		return mailService.joinEmail(email);
	}

	@GetMapping("/userMyPage/{head}")
	public ModelAndView userMyPage(ModelAndView modelAndView, @PathVariable int head) {
		modelAndView.addObject("toggle", head);
		
		modelAndView.setViewName("/user/userMyPage");
		
		return modelAndView;
	}
	
	@GetMapping("/userMyPageBoardList")
	@ResponseBody
	public List<BoardVO> userBoardList(PageVO paging) {
		
		paging.setCpp(9);
		
		return boardService.list(paging);
	}
	
	@GetMapping("/userBasket")
	public ModelAndView basket(ModelAndView modelAndView) {
		
		modelAndView.setViewName("redirect:/user/userMyPage/3");
		
		return modelAndView;
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(@RequestBody String userId) {
		log.info(userId);
		
		if (userService.checkId(userId) == 0) {

			return "accepted";
		} else {

			return "duplicated";
		}
		
		
	}
	
	@ResponseBody
	@PostMapping("/pwModify")
	public String pwModify(@RequestBody List<String> passwords) {
		String userPw = passwords.get(0);
		String modiPw = passwords.get(1);
		String checkPw = passwords.get(2);
		
		return Integer.toString(1);
	}
	
	@ResponseBody
	@PostMapping("/userUpdate")
	public String userUpdate(@RequestBody List<String> passwords) {
		String userPw = passwords.get(0);
		String checkPw = passwords.get(1);
		
		return Integer.toString(1);
	}
	
	@ResponseBody
	@PostMapping("/userDelete")
	public String userDelete(@RequestBody List<String> passwords) {
		String userPw = passwords.get(0);
		String checkPw = passwords.get(1);
		
		return Integer.toString(1);
	}
	

}
