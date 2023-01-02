package kr.co.seaduckene.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.service.IBoardService;
import kr.co.seaduckene.util.PageVO;

@Controller
@RequestMapping("/board")
public class boardListController {
	
	@Autowired
	private IBoardService service;

	@GetMapping("/boardList")
	public void boardList(Model model) {
		
		model.addAttribute("productList", service.proList());
	}
	
	@GetMapping("/boardLists")
	@ResponseBody
	public List<BoardVO> boardList(PageVO paging) {
		
		paging.setCpp(9);
		
		System.out.println(service.list(paging));
		
		return service.list(paging);
	}
	
	@GetMapping("/boardMyList")
	public void boardMyList() {}
	
	@GetMapping("/boardWrite")
	public void boardWrite() {}
	
	//상세보기
	@GetMapping("/boardDetail")
	public void boardDetail() {}
}
