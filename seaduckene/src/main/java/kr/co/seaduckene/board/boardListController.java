package kr.co.seaduckene.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class boardListController {

	@GetMapping("/boardList")
	public void boardList() {}
	
	@GetMapping("/boardMyList")
	public void boardMyList() {}
	
	@GetMapping("/boardWrite")
	public void boardWrite() {}
}
