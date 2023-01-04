package kr.co.seaduckene.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.mapper.IBoardMapper;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.util.PageVO;

@Service
public class BoardServiceImpl implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	@Override
	public void write(BoardVO vo) {
		System.out.println("서비스 vo 들어옮" + vo);
		mapper.write(vo);
	}

	@Override
	public List<BoardVO> list(PageVO paging) {
		return mapper.list(paging);
	}

	@Override
	public BoardVO content(int bno) {
		return mapper.content(bno);
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
		
	}
	
	@Override
	public List<ProductVO> proList() {
		return mapper.proList();

	}

	
	
}











