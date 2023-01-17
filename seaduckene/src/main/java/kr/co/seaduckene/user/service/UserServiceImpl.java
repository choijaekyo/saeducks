package kr.co.seaduckene.user.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.WebUtils;

import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.common.IAddressMapper;
import kr.co.seaduckene.favorite.FavoriteVO;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.product.mapper.IProductMapper;
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
	
	@Autowired
	private IProductMapper productMapper;

	@Override
	public void registUser(UserVO userVO) {
		
		userMapper.registUser(userVO);
	}
	
	@Override
	public UserVO getUserVoWithNo(int userNo) {
		return userMapper.getUserVoWithNo(userNo);
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
	public void addUserFavorites(CategoryVO categoryVO, int userNo) {
		
		// 카테고리 한 개에서도 작동하는 지 봐야 함.
		// -> 카테고리 한 개도 잘 동작 하는 듯.
		String[] majorList = categoryVO.getCategoryMajorTitle().split(",");
		log.info(majorList);
		String[] minorList = categoryVO.getCategoryMinorTitle().split(",");
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
		
		addressVO.setAddressRepresentative(1);
		
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
	
	@Override
	public List<CategoryVO> getUserCategories(int userNo) {
		
		return userMapper.getUserCategories(userNo);
	}
	
	@Override
	public List<AddressVO> getUserAddr(int userNo) {
		return addressMapper.getUserAddr(userNo);
	}
	
	@Override
	public List<String> findAccount (String userName, String userEmail) {
		log.info(userEmail);
		log.info(userName);
		
		Map<String, Object> map = new HashMap<>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		
		List<String> userIds = userMapper.findAccount(map);
		log.info(userIds);
		
		return userIds;
	}

	@Override
	public void updatePw(String userId, String tmpPw) {
		Map<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("tmpPw", tmpPw);
		
		userMapper.updatePw(map);
		
	}
	
	@Override
	public void setAutoLogin(UserVO userVo) {
		userMapper.setAutoLogin(userVo);
	}
	
	@Override
	public UserVO getUserBySessionId(String sessionId) {
		return userMapper.getUserBySessionId(sessionId);
	}
	
	@Override
	public void undoAutoLogin(int userNo) {
		userMapper.undoAutoLogin(userNo);
	}
	
	@Override
	public int checkCurrPw(Map<String, String> pwkMap) {
		return userMapper.checkCurrPw(pwkMap);
	}
	
	@Override
	public void changePw(Map<String, String> pwkMap) {
		userMapper.changePw(pwkMap);
	}
	
	@Override
	public void updateUserInfo(UserVO userVo) {
		userMapper.updateUserInfo(userVo);
	}

	@Override
	public List<FavoriteVO> getUserFavorites(int userNo) {
		return userMapper.getUserFavorites(userNo);
	}
	
	@Override
	public void deleteUserFavorites(Map<String, Object> deletedCount) {
		userMapper.deleteUserFavorites(deletedCount);
	}
	
	@Override
	public void updateUserFavorites(CategoryVO newCategoryVO, int userNo) {
		
		String[] newMajorList = newCategoryVO.getCategoryMajorTitle().split(",");
		log.info(Arrays.toString(newMajorList));
		String[] newMinorList = newCategoryVO.getCategoryMinorTitle().split(",");
		log.info(Arrays.toString(newMinorList));
		
		List<CategoryVO> currCategoryVOs = userMapper.getUserCategories(userNo);
		List<FavoriteVO> currFavoriteVOs = userMapper.getUserFavorites(userNo);
		
		for (int i = 0; i < newMajorList.length; i++) {
			CategoryVO borVo = new CategoryVO(0, newMajorList[i], newMinorList[i], null);
			Map<String, Integer> map = new HashMap<String, Integer>();
			if (currCategoryVOs.get(i).getCategoryNo() != userMapper.getCategoryNo(borVo)) {
				log.info("curr: " + currCategoryVOs.get(i).getCategoryNo());
				log.info("new: " + userMapper.getCategoryNo(borVo));
				map.put("categoryNo", userMapper.getCategoryNo(borVo));
				map.put("userNo", userNo);
				log.info("currFavNo: " + currFavoriteVOs.get(i).getFavoriteNo());
				map.put("favoriteNo", currFavoriteVOs.get(i).getFavoriteNo());
				
				userMapper.updateUserFavorites(map);
			}
		}
		
	}
	
	@Override
	public void addNewAddress(AddressVO newAddressVo, int userNo) {
		
		String[] addressBasicList = newAddressVo.getAddressBasic().split(",");
		log.info(Arrays.toString(addressBasicList));
		String[] addressDetailList = newAddressVo.getAddressDetail().split(",");
		log.info(Arrays.toString(addressDetailList));
		String[] addressZipNumList = newAddressVo.getAddressZipNum().split(",");
		log.info(Arrays.toString(addressZipNumList));
		
		for (int i = 0; i < addressBasicList.length; i++) {
			AddressVO addrVo = new AddressVO(0, addressDetailList[i], addressBasicList[i], addressZipNumList[i], 0, userNo);
			
			log.info(addrVo);
			addressMapper.addNewAddress(addrVo);
		}
		
	}
	
	@Override
	public void deleteUserAddress(Map<String, Object> deletedCount) {
		addressMapper.deleteUserAddress(deletedCount);
	}
	
	@Override
	public void updateUserAddress(AddressVO newAddressVO, int userNo) {
		
		String[] newAddressBasicList = newAddressVO.getAddressBasic().split(",");
		log.info(Arrays.toString(newAddressBasicList));
		String[] newAddressDetailList = newAddressVO.getAddressDetail().split(",");
		log.info(Arrays.toString(newAddressDetailList));
		String[] newAddressZipNumList = newAddressVO.getAddressZipNum().split(",");
		log.info(Arrays.toString(newAddressZipNumList));
		
		List<AddressVO> currAddressVOs = addressMapper.getUserAddr(userNo);
		
		for (int i = 0; i < newAddressBasicList.length; i++) {
			if (!currAddressVOs.get(i).getAddressBasic().equals(newAddressBasicList[i])
				|| !currAddressVOs.get(i).getAddressDetail().trim().equals(newAddressDetailList[i].trim())
				|| !currAddressVOs.get(i).getAddressZipNum().equals(newAddressZipNumList[i])) {

				AddressVO modiAddressVo = new AddressVO(currAddressVOs.get(i).getAddressNo(), newAddressDetailList[i], newAddressBasicList[i], newAddressZipNumList[i], 0, userNo);
				
				log.info(modiAddressVo);
				
				addressMapper.updateAddr(modiAddressVo);
			}
		}
	}
	
	@Override
	public AddressVO getUserAddressWithRn(int addressIndex, int userNo) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("addressRn", addressIndex);
		map.put("userNo", userNo);
		
		return addressMapper.getUserAddressWithRn(map);
	}
	
	@Override
	public void modiAddressNoAndRepresent(Map<String, Integer> map) {
		addressMapper.modiAddressNoAndRepresent(map);
	}
	
	@Override
	public void deleteUserAllInfo(int userNo, HttpServletRequest request, HttpServletResponse response) {
		userMapper.deleteUserAllInfoUser(userNo);
		userMapper.deleteUserAllInfofavorite(userNo);
		addressMapper.deleteUserAllInfo(userNo);
		productMapper.deleteUserAllInfoOrder(userNo);
		productMapper.deleteUserAllInfoBasket(userNo);
		
		HttpSession session = request.getSession();
		
		Cookie autoLoginCookie = WebUtils.getCookie(request, "autoLoginCookie");
		if (autoLoginCookie != null) {
			UserVO userVo = userMapper.getUserBySessionId(autoLoginCookie.getValue());
			log.info("autoLogin userVo: " + userVo);
			
			if (userVo != null) {
				// 쿠키 삭제는 받아온 쿠키 객체를 직접 지운다
				autoLoginCookie.setPath(request.getContextPath() + "/");
				autoLoginCookie.setMaxAge(0);
				response.addCookie(autoLoginCookie);
				userMapper.undoAutoLogin(userVo.getUserNo());
			}
			
		}
		
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
	}
	
}
