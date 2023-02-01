package kr.co.seaduckene.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.seaduckene.admin.command.AdminSearchVO;
import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.admin.command.AskListVO;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.util.AskCategoryBoardVO;

public interface IAdminMapper {

	// 관리자 정보 가져오기
	AdminVO getAdminVo(AdminVO adminVO);
	
	// 공지사항 글 쓰기
	void write(NoticeVO noticeVO);
	
	// 주문목록
	List<AdminSearchVO> usersSearch(Map<String, Object> map);

	// 송장번호 등록 
	void insertInvoice (Map<String, Object> map);
	
	// 주문취소
	void cancleOrder (String orderNum);
	
	// 환불처리 
	void refund (String orderNum);
	
	// 상품목록
	List<ProductVO> getProductList(Map<String, Object> map);
	
	// 카테고리별 테이블 문의글 저장	
	void insertCategoryBoard(AskCategoryBoardVO askCateBoVo);
	
	// 카테고리별 게시판 해당 유저의 문의글 가져오기
	List<AskCategoryBoardVO> getUserAskCategoryBoardList(int userNo);

	// 카테고리별 게시판 문의글 상세보기 가져오기
	AskCategoryBoardVO getAskCategoryBoard(int askBoardNo);
	
	// 카테고리별 게시판 모든, 검색 문의글 가져오기
	List<AskCategoryBoardVO> getAllAskCategoryBoardList(@Param("type") String type, @Param("keyword") String keyword);
	
	// 고객문의 글 쓰기
	void setAsk(AskListVO vo);	
	
	// 고객문의 리스트
	List<AskListVO> getAskLisk(int userNo);
	
	// 전체 문의 리스트
	List<AskListVO> getAdminAskLisk();
	
	// 문의사항 유저 검색
	List<AskListVO> getAskSearchList(@Param("type") String type, @Param("keyword") String keyword);
	
	// 관리자 답변 요청
	void setAskReply(@Param("askNo") String askNo, @Param("reply") String reply);
	
	// 관리자 게시판 답변 요청
	void setAskCategoryReply(@Param("askNo") String askNo, @Param("reply") String reply);
}
