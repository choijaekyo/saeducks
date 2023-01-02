package kr.co.seaduckene.board.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.seaduckene.board.mapper.IBoardReplyLikeMapper;

public class BoardReplyLikeServiceImpl implements IBoardReplyLikeService {

	@Autowired
	private IBoardReplyLikeMapper mapper;
}
