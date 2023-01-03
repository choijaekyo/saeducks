package kr.co.seaduckene.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.user.command.Categories;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.mapper.IUserMapper;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements IUserService {
	
	@Autowired
	private IUserMapper userMapper;

	@Override
	public void registUser(UserVO userVO) {
		
		userMapper.registUser(userVO);
	}

	@Override
	public List<Categories> getCategories() {
		return userMapper.getCategories();
	}
	
	@Override
	public void updateUserFavorites(CategoryVO boardCategoryVO, String userId) {
		
		String[] majorList = boardCategoryVO.getCategoryMajorTitle().split(",");
		log.info(majorList);
		String[] minorList = boardCategoryVO.getCategoryMinorTitle().split(",");
		log.info(minorList);
		
		
		for (int i = 0; i < majorList.length; i++) {
			CategoryVO borVo = new CategoryVO(0, majorList[i], minorList[i], null);
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("categoryNo", userMapper.getCategoryNo(borVo));
			map.put("userNo", userMapper.getUserNo(userId));
			
			userMapper.insertFavorite(map);
		}
	}

}
