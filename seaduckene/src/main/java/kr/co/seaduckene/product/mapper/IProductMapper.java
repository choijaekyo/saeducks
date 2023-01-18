package kr.co.seaduckene.product.mapper;

import java.util.List;
import java.util.Map;

import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.product.command.ProductImageVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.product.command.ProductVO;

public interface IProductMapper {

	// 상품등록
	void insertProduct(Map<String, Object> map);

	// 상품상세
	ProductVO getContent(int num);

	// 장바구니 상품 불러오기
	List<ProductBasketVO> getBasketList(int userNo);

	// 썸네일 가져오기
	ProductImageVO getThumbnailImg(int productNo);

	// user 인증메일 등록여부 확인
	String checkEmail(int userNo);

	// 상품주문
	void order(ProductOrderVO orderVo);

	// 상품 재고수량 수정
	void updateStock(Map<String, Object> map);

	// 장바구니 비우기
	void deleteBasket(int userNo);

	// 인증메일 등록
	void updateEmail(Map<String, Object> map);

	// 장바구니수량,가격 가져오기
	ProductBasketVO getBasket(Map<String, Object> map);
	
	//상품삭제
	void delProduct(int no);

	// 카테고리 리스트 갖고오기
	List<CategoryVO> getCategory();

	// 소 카테고리 불러오기
	List<String> getMinor(String major);

	// 카테고리넘버
	int getCNum(Map<String, Object> map);

	// 상품 이미지 삽입
	void insertImg(ProductImageVO vo);

	// 메인 상품 이미지 출력 세션있음
	List<ProductImageVO> mainImage(int productNo);

	// 메인 상품 이미지 출력 세션 없음
	List<ProductImageVO> mainImageNo();

	// 이미지 정보
	List<ProductImageVO> getImg(int num);

	// 장바구니 등록
	void insertBasket(ProductBasketVO vo);

	// 장바구니 수량 변경
	public void cQuantity(Map<String, Object> map);

	// 장바구니 중복 체크
	public int basketChk(ProductBasketVO vo);

	// 장바구니 삭제
	public void delBasekt(int basketNo);

	// 주문정보 불러오기
	List<ProductOrderVO> getOrder(int userNo);

	// 카테고리 정보 불러오기
	CategoryVO getCt(int categoryNo);

	// 상품정보 업데이트
	void updateProduct(ProductVO vo);
	
	//이미지 수정삽입
	void insertImg2(ProductImageVO vo);
	
	//기존사진 삭제
	void deleteImage(int num);
	
	// 유저 삭제 시 유저 정보 삭제
	void deleteUserAllInfoOrder(int userNo);
	
	// 유저 삭제 시 유저 정보 삭제
	void deleteUserAllInfoBasket(int userNo);
	
	//환불/주문취소 신청
	void refund(Map<String, Object> map);
	
}
