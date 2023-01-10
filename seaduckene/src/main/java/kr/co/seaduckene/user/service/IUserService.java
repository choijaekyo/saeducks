package kr.co.seaduckene.user.service;

import java.util.List;

import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.user.command.Categories;
import kr.co.seaduckene.user.command.UserVO;

public interface IUserService {

	// 유저 생성
	void registUser(UserVO userVO);
	
	// 유저 정보 가져오기
	UserVO getUserVo(UserVO userVO);
	
	// 유저 아이디 중복 확인
	int checkId(String userId);
	
	// 유저 닉네임 중복 확인
	int checkNickname(String userNickname);
	
	// 카테고리 정보 가져오기
	List<Categories> getCategories();
	
	// 유저 favorite table 연동
	void updateUserFavorites(CategoryVO boardCategoryVO, int userNo);
	
	// 유저에서 주소 테이블에 입력
	String registAddr(AddressVO addressVO);
	
	// 유저에서 주소 테이블의 내용 수정
	void updateAddr(AddressVO addressVO);
	
	//장바구니데이터 불러오기
	List<ProductBasketVO> getBasket(int num);
	
	// 유저의 카테고리 정보를 불러오기
	List<CategoryVO> getUserCategories(int userNo);
	
	// 유저의 주소 정보를 불러오기
	List<AddressVO> getUserAddr(int userNo);
	
	// 아이디 찾기
	List<String> findAccount (String userName, String userEmail);
	
	// 임시 비밀번호로 정보수정
	void updatePw (String userId, String tmpPw);
	
	// 자동 로그인 설정
	void setAutoLogin(UserVO userVo);
	
	// 쿠키의 sessionId로 session userVO 얻기
	UserVO getUserBySessionId(String sessionId);
	
	// 자동 로그인 해제
	void undoAutoLogin(int userNo);
}
