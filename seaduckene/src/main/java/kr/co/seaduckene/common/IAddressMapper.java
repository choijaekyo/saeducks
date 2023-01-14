package kr.co.seaduckene.common;

import java.util.List;
import java.util.Map;

public interface IAddressMapper {
	
	// 주소등록
	void addAddress(AddressVO vo);
	
	// 기 등록 주소여부
	int checkAddr(Map<String, Object> map);

	// 주소수정
	void updateAddr(AddressVO addressVO);
	
	// 유저의 주소 정보를 불러오기
	List<AddressVO> getUserAddr(int userNo);
	
	// 유저의 추가 주소 저장
	void addNewAddress(AddressVO newAddressVo);
	
	// 유저의 address 삭제
	void deleteUserAddress(Map<String, Object> deletedCount);
	
	// rn 순서, userNo로 addressVO 얻기
	AddressVO getUserAddressWithRn(Map<String, Integer> map);
	
	// addressNo, addressRepresentative 변경
	void modiAddressNoAndRepresent(Map<String, Integer> map);
	
}
