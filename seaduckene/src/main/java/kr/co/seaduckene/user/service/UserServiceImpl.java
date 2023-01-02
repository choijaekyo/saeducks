package kr.co.seaduckene.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.user.command.Categories;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.mapper.IUserMapper;

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

}
