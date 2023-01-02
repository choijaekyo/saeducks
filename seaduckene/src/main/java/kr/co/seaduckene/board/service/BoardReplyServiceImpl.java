package kr.co.seaduckene.board.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.seaduckene.board.mapper.IBoardReplyMapper;

public class BoardReplyServiceImpl implements IBoardReplyService {

	@Autowired
	private IBoardReplyMapper mapper;
}
