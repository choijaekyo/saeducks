package kr.co.seaduckene.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.service.BoardServiceImpl;

@Controller
@RequestMapping("/board")
public class boardListController {
	
	@Autowired
	private BoardServiceImpl service;

	//게시판 목록으로 이동
	@GetMapping("/boardList")
	public void boardList() {}
	
	//내 글 목록으로 이동
	@GetMapping("/boardMyList")
	public void boardMyList() {}
	
	//글 등록 페이지
	@GetMapping("/boardWrite")
	public void boardWrite() {}
	
	//상세보기 페이지
	@GetMapping("/boardDetail")
	public void boardDetail() {}
	
	//글 수정 처리
	@GetMapping("/boardUpdate")
	public String boardUpdate(BoardVO vo) {
		service.update(vo);
		return "redirect:/board/boardDetail/" + vo.getBoardNo();
	}
	
	//글 삭제 처리
	@PostMapping("/boardDelete")
	public String boardDelete(int bno) {
		service.delete(bno);
		
		return "redirect:/board/boardList";
	}

}