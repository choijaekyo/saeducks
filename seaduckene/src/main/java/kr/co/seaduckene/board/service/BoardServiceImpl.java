package kr.co.seaduckene.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.mapper.IBoardMapper;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.util.BoardUserVO;
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
	public List<BoardVO> list(PageVO paging, int categoryNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("paging", paging);
		map.put("categoryNo", categoryNo);

		return mapper.list(map);
	}
	
	@Override
	public int getTotal(int categoryNo) {
		return mapper.getTotal(categoryNo);
	}
	
	@Override
	public int getMyBoardTotal(int userNo) {
		return mapper.getMyBoardTotal(userNo);
	}

	@Override
	public CategoryVO getCategory(int categoryNo) {
		return mapper.getCategory(categoryNo);
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
	public List<ProductVO> proList(int categoryNo) {
		return mapper.proList(categoryNo);
	}

	@Override
	public List<BoardUserVO> bUserList(int userNo) {
		return mapper.bUserList(userNo);
	}

	@Override
	public List<BoardUserVO> bUserNoList() {
		return mapper.bUserNoList();
	}

	@Override
	public List<NoticeVO> noticeList() {
		return mapper.noticeList();
	}

	@Override
	public List<NoticeVO> noticeLists(PageVO paging) {
		return mapper.noticeLists(paging);
	}

	@Override
	public int boardNoSearch(int boardUserNo) {
		return mapper.boardNoSearch(boardUserNo);
	}

	@Override
	public void boardImageAdd(int boardNo, String UUID) {
		mapper.boardImageAdd(boardNo, UUID);
	}

	@Override
	public void addViewCount(int boardNo) {
		mapper.addViewCount(boardNo);
	}

	@Override
	public List<BoardVO> getMyList(Map<String, Object> data) {
		return mapper.getMyList(data);
	}



	
}
