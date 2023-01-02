package kr.co.seaduckene.product.service;

import java.util.List;

import kr.co.seaduckene.address.command.AddressVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.user.command.UserVO;

public interface IProductService {
	
	// 상품등록
	
	// 상품상세
	
	// 상품리스트
	
	// 장바구니 목록
	
	// 상품주문
	void order(List<Integer> orderProductNoList ,ProductOrderVO order, String userEmail, UserVO user);
	

}
