package kr.co.seaduckene.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.command.BoardReplyListVO;
import kr.co.seaduckene.board.command.BoardReplyVO;
import kr.co.seaduckene.board.mapper.IBoardReplyMapper;
import kr.co.seaduckene.util.PageVO;

@Service
public class BoardReplyServiceImpl implements IBoardReplyService {

	@Autowired
	private IBoardReplyMapper mapper;

	@Override
	public void replyRegist(BoardReplyVO vo) {
		mapper.replyRegist(vo);
		
	}
	
	@Override
	public List<BoardReplyListVO> getList(int bno, int pageNum) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum);
		vo.setCpp(5);
		System.out.println(bno);
		System.out.println(vo.getPageNum());
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);
		data.put("bno", bno);
		
		return mapper.getList(data);
	}

	@Override
	public int getTotal(int replyBoardNo) {
		return mapper.getTotal(replyBoardNo);
	}

	@Override
	public int pwCheck(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return mapper.pwCheck(vo);
	}

	@Override
	public void update(BoardReplyVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void delete(int replyNo) {
		mapper.delete(replyNo);
		
	}




	
	
	
}
