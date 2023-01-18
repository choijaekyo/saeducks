package kr.co.seaduckene.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.seaduckene.board.command.BoardReplyLikeVO;
import kr.co.seaduckene.board.service.IBoardReplyLikeService;

@Controller
@RequestMapping("/snsBoard")
public class boardReplyLikeController {
	
	@Autowired
	private IBoardReplyLikeService service;
	
	@GetMapping("/likeUpdate")
	@ResponseBody
	public int likeUpdate(BoardReplyLikeVO vo) {
		System.out.println(vo);
		
		BoardReplyLikeVO bvo= service.searchLike(vo);
		
		if( bvo ==null) {
			service.createLike(vo);
			return 1;
		}else if(bvo.getLikeState() ==1) {
			service.deleteLike(bvo.getLikeNo());
			return 0;
		}else  {
			service.makeLike(bvo.getLikeNo());
			return 1;
		}
			
	}
	
	@PostMapping("/listLike")
	@ResponseBody
	public List<BoardReplyLikeVO> listLike(@RequestBody int userNo) {
		return service.listLike(userNo);
	}
	
	
	
	
}
