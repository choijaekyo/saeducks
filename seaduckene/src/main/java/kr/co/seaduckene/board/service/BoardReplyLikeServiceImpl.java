package kr.co.seaduckene.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.seaduckene.board.mapper.IBoardReplyLikeMapper;

public class BoardReplyLikeServiceImpl implements IBoardReplyLikeService {

	@Autowired
	private IBoardReplyLikeMapper mapper;

	@Override
	public int searchLike() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void createLike() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteLike() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Integer> listLike(String userId) {
		// TODO Auto-generated method stub
		return null;
	}


}

