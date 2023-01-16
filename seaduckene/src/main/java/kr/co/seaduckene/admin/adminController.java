package kr.co.seaduckene.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.admin.service.IAdminService;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.util.summernoteCopy;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	@Autowired
	private IAdminService service;

	@GetMapping("/adminLogin")
	public void adminLogin() {}
	
	@PostMapping("/adminLoginAuth")
	public ModelAndView adminLogin(AdminVO adminVO, ModelAndView modelAndView) {
		
		modelAndView.addObject("adminVO", service.getAdminVo(adminVO));
		
		return modelAndView;
	}
	
	@GetMapping("/adminMain")
	public void adminMain() {}
	
	@GetMapping("/NoticeAddPage")
	public void NoticeAddPage() {}
	
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
	
	@GetMapping("/userSearch")
	public void userSearch() {}	
	
}
