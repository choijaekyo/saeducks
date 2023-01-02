package kr.co.seaduckene.board.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.seaduckene.board.mapper.IBoardImageMapper;

public class BoardImageServiceImpl implements IBoardImageService {

	@Autowired
	private IBoardImageMapper mapper;
	
}
