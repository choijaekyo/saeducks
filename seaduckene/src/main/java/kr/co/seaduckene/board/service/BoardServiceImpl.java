package kr.co.seaduckene.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.mapper.IBoardMapper;

@Service
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardMapper maaper;
}











