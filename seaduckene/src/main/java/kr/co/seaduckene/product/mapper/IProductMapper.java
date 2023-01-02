package kr.co.seaduckene.product.mapper;

import java.util.List;
import java.util.Map;

import kr.co.seaduckene.board.command.BoardCategoryVO;
import kr.co.seaduckene.board.command.BoardImageVO;

public interface IProductMapper {
	
	// 상품등록
	void insertProduct(Map<String, Object> map);
	// 상품상세
	
	// 상품리스트
	
	// 장바구니 목록
	
	// 상품주문
	
	//카테고리 리스트 갖고오기
	List<BoardCategoryVO> getCategory();
	
	//소 카테고리 불러오기
	List<String> getMinor(String major);
	
	//카테고리넘버
		int getCNum(Map<String, Object> map);

}
