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
		// a태그 달때 ? 프로덕트 넘버 달아서 넘기기 GET
		model.addAttribute("productList", service.proList());
	}
	
	@GetMapping("/boardLists")
	@ResponseBody
	public List<BoardVO> boardList(PageVO paging) {
		
		paging.setCpp(9);
		
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
