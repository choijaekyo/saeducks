package kr.co.seaduckene.common;

import java.util.Map;

public interface IAddressMapper {
	
	// 주소등록
	void addAddress(AddressVO vo);
	
	// 기 등록 주소여부
	int checkAddr(Map<String, Object> map);

	
	// 주소수정
	
	// 주소삭제
}
