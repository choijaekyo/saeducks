package kr.co.seaduckene.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.common.IAddressMapper;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.user.command.Categories;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.mapper.IUserMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserMapper userMapper;
	
	@Autowired
	private IAddressMapper addressMapper;

	@Override
	public void registUser(UserVO userVO) {
		
		userMapper.registUser(userVO);
	}
	
	@Override
	public UserVO getUserVo(UserVO userVO) {
		return userMapper.getUserVo(userVO);
	}

	@Override
	public List<Categories> getCategories() {
		return userMapper.getCategories();
	}
	
	@Override
	public void updateUserFavorites(CategoryVO boardCategoryVO, int userNo) {
		
		// 카테고리 한 개에서도 작동하는 지 봐야 함.
		// -> 카테고리 한 개도 잘 동작 하는 듯.
		String[] majorList = boardCategoryVO.getCategoryMajorTitle().split(",");
		log.info(majorList);
		String[] minorList = boardCategoryVO.getCategoryMinorTitle().split(",");
		log.info(minorList);
		
		
		for (int i = 0; i < majorList.length; i++) {
			CategoryVO borVo = new CategoryVO(0, majorList[i], minorList[i], null);
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("categoryNo", userMapper.getCategoryNo(borVo));
			map.put("userNo", userNo);
			
			userMapper.insertFavorite(map);
		}
	}
	
	@Override
	public String registAddr(AddressVO addressVO) {
		
		String addressDetail = addressVO.getAddressDetail();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", addressVO.getAddressUserNo());
		// 유저 등록에서 확인하는데 product의 코드 그냥 사용함.
		map.put("OrderAddressDetail", addressDetail.replaceAll(" ", ""));
		
		if (addressMapper.checkAddr(map) != 0)  return "fail";
		
		addressMapper.addAddress(addressVO);
		/* addressMapper.addAddress(addressVO, userNo); */
		return "success";
		
	}
	
	@Override
	public void updateAddr(AddressVO addressVO) {
		
		addressMapper.updateAddr(addressVO);
	}
	
	@Override
	public List<ProductBasketVO> getBasket(int num) {
		return userMapper.getBasket(num);
	}

	@Override
	public int checkId(String userId) {
		return userMapper.checkId(userId);
	}
	
	@Override
	public int checkNickname(String userNickname) {
		return userMapper.checkNickname(userNickname);
	}
	
	

}
