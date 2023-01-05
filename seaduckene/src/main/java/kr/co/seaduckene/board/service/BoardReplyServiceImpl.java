package kr.co.seaduckene.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.command.BoardReplyVO;
import kr.co.seaduckene.board.mapper.IBoardReplyMapper;

@Service
public class BoardReplyServiceImpl implements IBoardReplyService {

	@Autowired
	private IBoardReplyMapper mapper;

	@Override
	public void replyRegist(BoardReplyVO vo) {
		mapper.replyRegist(vo);
		
	}

	@Override
	public List<BoardReplyVO> getList(Map<String, Object> data) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getTotal(int replyBoardNo) {
		// TODO Auto-generated method stub
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
