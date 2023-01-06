package kr.co.seaduckene.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
	
	//댓글 수정(비밀번호 확인 포함)
	
	//뎃글 삭제

}