package kr.co.seaduckene.board.service;

import org.springframework.beans.factory.annotation.Autowired;

import kr.co.seaduckene.board.mapper.IBoardCategoryMapper;

public class BoardCategoryServiceImpl implements IBoardCategoryService {

	@Autowired
	private IBoardCategoryMapper mapper;
}
