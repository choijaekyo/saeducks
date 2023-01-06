package kr.co.seaduckene.board;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.service.IBoardService;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.util.PageVO;

@Controller
@RequestMapping("/board")
public class boardListController {
	
	@Autowired
	private IBoardService service;

	//게시판 목록으로 이동
	@GetMapping("/boardList/{categoryNo}")
	public String boardList(Model model, @PathVariable int categoryNo) {

		// a태그 달때 ? 프로덕트 넘버 달아서 넘기기 GET
		System.out.println("게시판 목록으로 이동!");
		model.addAttribute("categoryNo", categoryNo);
		model.addAttribute("productList", service.proList(categoryNo));
		
		return "board/boardList";
	}
	
	//페이징
	@GetMapping("/boardLists")
	@ResponseBody
	public List<BoardVO> boardList(PageVO paging, int categoryNo) {
		
		paging.setCpp(9);
		
		return service.list(paging,categoryNo);
	}
	
	//내 글 목록으로 이동
	@GetMapping("/boardMyList")
	public void boardMyList() {}
	
	
	//글쓰기 페이지로 이동 요청
	@GetMapping("/boardWrite")
	public void boardWrite() {
		System.out.println("/board/boardWrite: GET");
	}
	
	
	//게시글을 DB 등록 요청
	@PostMapping("/boardWrite")
	public String boardWrite(PageVO paging, BoardVO vo) {
		service.write(vo);
		
		return "redirect:/board/boardList";
	}
	
	
	//상세보기 페이지
	@GetMapping("/boardDetail/{boardNo}")
	public String boardDetail(@PathVariable int boardNo, PageVO vo, Model model) {
		model.addAttribute("list", service.content(boardNo));
		return "board/boardDetail";
	}
	
	//수정 페이지로 이동
	@PostMapping("/boardModify")
	public void modify(@ModelAttribute("list") BoardVO vo) {
		System.out.println(vo);
	}
	
	//글 수정 처리
	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardVO vo) {
		System.out.println(vo);
		service.update(vo);
		return "redirect:/board/boardDetail/" + vo.getBoardNo();
	}
	
	//글 삭제 처리
	@PostMapping("/boardDelete")
	public String boardDelete(int boardNo) {
		service.delete(boardNo);
		
		return "redirect:/board/boardList";
	}
	
	// 공지사항 리스트
	@GetMapping("/noticeList")
	@ResponseBody
	public List<NoticeVO> noticeList() {
		return service.noticeList();
	}
	
	// 공지사항페이지 이동
	@GetMapping("/notice")
	public void notice() {}
	
	// 공지사항 페이징
	@GetMapping("/noticeLists")
	@ResponseBody
	public List<NoticeVO> noticeLists(PageVO paging) {
		
		paging.setCpp(9);

		return service.noticeLists(paging);
	}

	@GetMapping("/testPage")
	public void testPage() {}
}