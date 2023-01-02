package kr.co.seaduckene.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.mapper.IBoardMapper;

@Service
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	
	@Override
	public void write(BoardVO vo) {
		mapper.write(vo);
	}

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO content(int bno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
		
	}
}











