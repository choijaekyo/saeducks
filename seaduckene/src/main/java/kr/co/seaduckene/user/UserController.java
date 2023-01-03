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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.service.IBoardService;
import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.service.IUserService;
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
	
	

	@GetMapping("/userLogin")
	public void userLogin() {
		
	}
	
	@GetMapping("/userJoin")
	public void userJoin(HttpServletRequest request) {
		log.info(userService.getCategories());
		
		request.setAttribute("categoryList", userService.getCategories());
		request.setAttribute("majorLength", userService.getCategories().size() - 1);
		log.info(userService.getCategories().size() - 1);
	}
	
	@PostMapping("/userJoin")
	public void userjoin(UserVO userVO, AddressVO addressVO, CategoryVO  boardCategoryVO) {
		log.info(userVO);
		log.info(addressVO);
		log.info(boardCategoryVO);
		
		userService.registUser(userVO);
		userService.updateUserFavorites(boardCategoryVO, userVO.getUserId());
		
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
		System.out.println(userId);
		return "duplicated";
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
	
	@GetMapping("/userJoinSuccess")
	public void userJoinSuccess() {
		
	}
	
	@GetMapping("/userFindAccount")
	public void userFindAccount() {
		
	}
}
