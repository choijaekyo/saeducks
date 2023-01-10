package kr.co.seaduckene.board;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.seaduckene.board.command.BoardReplyListVO;
import kr.co.seaduckene.board.command.BoardReplyVO;
import kr.co.seaduckene.board.service.IBoardReplyService;

@RestController
@RequestMapping("/reply")
public class boardReplyController {
	
	@Autowired
	private IBoardReplyService service; 

	//댓글 등록
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody BoardReplyVO vo) {
		service.replyRegist(vo);
		
		return "regSuccess";
	}
	
	//페이징 추가된 댓글 목록
	
	@GetMapping("/getList/{bno}/{pageNum}")
	public List<BoardReplyListVO> getList(@PathVariable int bno, @PathVariable int pageNum) {
		
		/*
		 * List<BoardReplyListVO> list = service.getList(bno, pageNum); int total =
		 * service.getTotal(bno);
		 */
		
		/* System.out.println("list 내용: " + list); */
		/*
		 * Map<String, Object> map = new HashMap<>(); map.put("replyList", list);
		 * map.put("total", total);
		 */
		 
		return service.getList(bno, pageNum);
	}
	
	//댓글 수정(비밀번호 확인 포함)
	
	//뎃글 삭제

}