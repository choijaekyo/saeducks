package kr.co.seaduckene.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.co.seaduckene.admin.command.AdminSearchVO;
import kr.co.seaduckene.admin.command.AdminVO;
import kr.co.seaduckene.common.NoticeVO;
import kr.co.seaduckene.product.command.ProductVO;

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

}
