package kr.co.seaduckene.user.mapper;

import java.util.List;
import java.util.Map;

import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.favorite.FavoriteVO;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.user.command.Categories;
import kr.co.seaduckene.user.command.UserVO;

public interface IUserMapper {

	// 유저 생성
	void registUser(UserVO userVO);
	
	// 유저 정보 가져오기
	UserVO getUserVo(UserVO userVO);
	
	// userNo로 유저 정보 가져오기 
	UserVO getUserVoWithNo(int userNo);
	
	// 유저 아이디 중복 확인
	int checkId(String userId);

	// 유저 닉네임 중복 확인
	int checkNickname(String userNickname);
	
	// 카테고리 정보 가져오기
	List<Categories> getCategories();

	// 카테고리 table에서 catogory_no 가져옴
	int getCategoryNo(CategoryVO categoryVO);

	// favorite table에 추가
	void insertFavorite(Map<String, Integer> map);

	// 장바구니데이터 불러오기
	List<ProductBasketVO> getBasket(int num);

	// 유저의 카테고리 정보를 불러오기
	List<CategoryVO> getUserCategories(int userNo);
	
	// 아이디 찾기
	List<String> findAccount (Map<String, Object> map);
	
	// 비밀번호 찾기
	void updatePw(Map<String, Object> map);

	// 자동 로그인 설정
	void setAutoLogin(UserVO userVo);
	
	// 쿠키의 sessionId로 session userVO 얻기
	UserVO getUserBySessionId(String sessionId);
	
	// 자동 로그인 해제
	void undoAutoLogin(int userNo);

	// 현재 입력한 비밀번호 검증 
	int checkCurrPw(Map<String, String> pwkMap);
	
	// 입력한 번호로 비밀번호 변경
	void changePw(Map<String, String> pwkMap);
	
	// 유저의 favorite 변경
	void updateUserFavorites(CategoryVO categoryVO, int userNo);
	
	// 유저 정보 변경 
	void updateUserInfo(UserVO userVo);
	
	// 유저의 favorite 가져오기
	List<FavoriteVO> getUserFavorites(int userNo);
	
	// 유저의 favorite 삭제
	void deleteUserFavorites(Map<String, Object> deletedCount);
	
	// 유저의 favorite 변경
	void updateUserFavorites(Map<String, Integer> map);
	
	// 유저 삭제 시 유저 정보 삭제
	void deleteUserAllInfoUser(int userNo);

	// 유저 삭제 시 유저 정보 삭제
	void deleteUserAllInfofavorite(int userNo);
}
