package kr.co.seaduckene.user.service;

import java.util.List;

import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.user.command.Categories;
import kr.co.seaduckene.user.command.UserVO;

public interface IUserService {

	// 유저 생성
	void registUser(UserVO userVO);
	
	// 유저 정보 가져오기
	UserVO getUserVo(String userId);
	
	// 유저 아이디 중복 확인
	int checkId(String userId);
	
	// 카테고리 정보 가져오기
	List<Categories> getCategories();
	
	// 유저 favorite table 연동
	void updateUserFavorites(CategoryVO boardCategoryVO, int userNo);
	
	// 유저에서 주소 테이블에 입력
	String registAddr(AddressVO addressVO);
	
	// 유저에서 주소 테이블의 내용 수정
	void updateAddr(AddressVO addressVO);
	
}
