package kr.co.seaduckene.admin.service;

import java.util.List;

import kr.co.seaduckene.admin.command.AdminSearchVO;
import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.admin.command.AskListVO;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.product.command.ProductVO;

public interface IAdminService {

	// 관리자 정보 가져오기
	AdminVO getAdminVo(AdminVO adminVO);
	
	// 공지사항 글 쓰기
	void write(NoticeVO noticeVO);
	
	// 주문목록
	List<AdminSearchVO> usersSearch(String type, String keyword);
	
	// 송장번호 등록 
	void insertInvoice (String invoiceNum, String orderNum);
	
	// 주문취소
	void cancleOrder (String orderNum);
	
	// 환불처리 
	void refund (String orderNum);
	
	// 상품목록
	List<ProductVO> getProductList(String type, String keyword);
	
	// 고객문의 글 쓰기
	void setAsk(AskListVO vo);
	
	// 고객문의 리스트
	List<AskListVO> getAskLisk(int userNo);
	
}
