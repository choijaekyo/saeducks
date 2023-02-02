package kr.co.seaduckene.board.service;

import java.util.List;
import java.util.Map;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.util.BoardUserVO;
import kr.co.seaduckene.util.PageVO;

public interface IBoardService {

	// 글 등록
	void write(BoardVO vo);

	// 글 목록
	List<BoardVO> list(PageVO paging , int categoryNo);
	
	// category 글 수량
	int getTotal(int categoryNo);
	
	// 내 글 총 수량
	int getMyBoardTotal (int userNo);
	
	// 공지 총 수량
	int getNoticeTotal ();
	
	// 카테고리 이름
	CategoryVO getCategory (int categoryNo);

	// 상세보기
	BoardVO content(int bno);

	// 글 수정
	void update(BoardVO bno);

	// 글 삭제
	void delete(int bno);

	// 상품 목록
	List<ProductVO> proList(int categoryNo);
	
	// 메인 리스트 유저 세션 있는
	List<BoardUserVO> bUserList(int userNo);
	
	// 메인 리스트 유저 세션 있는
	List<BoardUserVO> bUserNoList();
	
	// 푸터 공지사항 리스트
	List<NoticeVO> noticeList();
	
	// 공지사항 리스트
	List<NoticeVO> noticeLists(PageVO paging);
	
	// boardNo 찾기
	int boardNoSearch(int boardUserNo);
	
	// 보드 이미지 등록
	void boardImageAdd(int boardNo, String UUID);
	
	// 조회수 추가 
	void addViewCount(int boardNo);
	
	//내글 가져오기
	List<BoardVO> getMyList(Map<String, Object> data);
}
