package kr.co.seaduckene.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class UserControlller {

	@GetMapping("/userLogin")
	public void userLogin() {
		
	}
	
	@GetMapping("/userJoin")
	public void userJoin() {

	}

	@GetMapping("/userMyPage")
	public void userMyPage() {
		
	}
	
	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(@RequestBody String userId) {
		System.out.println(userId);
		return "duplicated";
	}
	
}
