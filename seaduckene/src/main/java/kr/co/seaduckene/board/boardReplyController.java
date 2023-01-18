package kr.co.seaduckene.board;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.seaduckene.board.command.BoardReplyLikeVO;
import kr.co.seaduckene.board.command.BoardReplyListVO;
import kr.co.seaduckene.board.command.BoardReplyVO;
import kr.co.seaduckene.board.service.IBoardReplyLikeService;
import kr.co.seaduckene.board.service.IBoardReplyService;
import kr.co.seaduckene.user.command.UserVO;

@RestController
@RequestMapping("/reply")
public class boardReplyController {
	
	@Autowired
	private IBoardReplyService service; 
	
	@Autowired
	private IBoardReplyLikeService lService;

	//댓글 등록
	@PostMapping("/replyRegist")
	public String replyRegist(@RequestBody BoardReplyVO vo) {
		service.replyRegist(vo);
		
		return "regSuccess";
	}
	
	//페이징 추가된 댓글 목록
	@GetMapping("/getList/{bno}/{pageNum}")
	public Map<String, Object> getList(@PathVariable int bno, @PathVariable int pageNum, HttpSession session) {
		
		List<BoardReplyListVO> list = service.getList(bno, pageNum);
		int total = service.getTotal(bno);
		System.out.println("list 내용: " + list);
				
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("total", total);
		
		int userNo = ((UserVO) session.getAttribute("login")).getUserNo();
		List<BoardReplyLikeVO> like = lService.listLike(userNo);
		map.put("like", like);
		
		
		//reply마다 좋아요의 총 개수, 눌렀는지 누르지 않았는지 좋아요 인식,
		//replyno 그 replyno에 있는 좋아요 개수를 뽑아 올 수 있다.
		//replyno를 눌렀는지, 누르지 않았는지는  밖의 세션과 안쪽의 replyno를 가지고 와 검색을 해서 차이를 알 수 있다. 
		//리스트에 좋아요 총 개수 리스트를 만들어야 하고, - 인티저 만든 거 사용하고,
		//reply 마다 유저의 좋아요 했는지 안 했는지 리스트도 필요하고.
		 
		return map;
	}
	
	//댓글 수정(비밀번호 확인 포함)
	
	@PostMapping("/update")
	public void update(@RequestBody BoardReplyVO vo) {
		service.update(vo);
	}
	
	//댓글 삭제
	
	@PostMapping("/delete")
	public void delete(@RequestBody BoardReplyVO vo) {
		service.delete(vo.getReplyNo());
	}

}