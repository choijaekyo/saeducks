package kr.co.seaduckene.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.command.BoardReplyLikeVO;
import kr.co.seaduckene.board.mapper.IBoardReplyLikeMapper;

@Service
public class BoardReplyLikeServiceImpl implements IBoardReplyLikeService {

	@Autowired
	private IBoardReplyLikeMapper mapper;

	@Override
	public BoardReplyLikeVO searchLike(BoardReplyLikeVO vo) {
		return mapper.searchLike(vo);
	}

	@Override
	public void createLike(BoardReplyLikeVO vo) {
		mapper.createLike(vo);
		
	}

	@Override
	public void deleteLike(int no) {
		mapper.deleteLike(no);
		
	}
	@Override
	public void makeLike(int no) {
		mapper.makeLike(no);
		
	}

	@Override
	public List<BoardReplyLikeVO> listLike(int userNo) {
		return mapper.listLike(userNo);
	}


}

