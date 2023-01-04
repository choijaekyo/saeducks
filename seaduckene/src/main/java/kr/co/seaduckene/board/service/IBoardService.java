package kr.co.seaduckene.board.service;

import java.util.List;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.util.BoardUserVO;
import kr.co.seaduckene.util.PageVO;

public interface IBoardService {

	// 글 등록
	void write(BoardVO vo);

	// 글 목록
	List<BoardVO> list(PageVO paging);

	// 상세보기
	BoardVO content(int bno);

	// 글 수정
	void update(BoardVO bno);

	// 글 삭제
	void delete(int bno);

	// 상품 목록
	List<ProductVO> proList();
	
	// 메인 리스트 유저 세션 있는
	List<BoardUserVO> bUserList(int userNo);
	
	// 메인 리스트 유저 세션 있는
	List<BoardUserVO> bUserNoList();
}
