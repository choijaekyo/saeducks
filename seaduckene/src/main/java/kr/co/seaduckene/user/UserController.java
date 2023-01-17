package kr.co.seaduckene.user;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.seaduckene.board.command.BoardVO;
import kr.co.seaduckene.board.service.IBoardService;
import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.product.service.IProductService;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.service.IUserService;
import kr.co.seaduckene.util.CertificationMailService;
import kr.co.seaduckene.util.PageVO;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class UserController {
	
	@Autowired
	private IBoardService boardService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private CertificationMailService mailService;
	
	@Autowired
	private IProductService productService;
	

	@GetMapping("/userLogin")
	public void userLogin() {}
	
	@PostMapping("/userLoginAuth")
	public ModelAndView userLogin(UserVO userVO, ModelAndView modelAndView, int autoLoginCheck) {
		log.info(userVO);
		
		// 비밀번호 암호화는 나중에 구현할 것.
		
		modelAndView.addObject("userVo", userService.getUserVo(userVO));
		modelAndView.addObject("autoLoginCheck", autoLoginCheck);
		
		return modelAndView;
	}
	
	@GetMapping("/userJoin")
	public void userJoin(HttpServletRequest request) {
		log.info(userService.getCategories());
		
		request.setAttribute("categoryList", userService.getCategories());
		request.setAttribute("majorLength", userService.getCategories().size() - 1);
		log.info(userService.getCategories().size() - 1);
	}
	
	@GetMapping("/userLogout")
	public ModelAndView userLogin(ModelAndView modelAndView, HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		Cookie autoLoginCookie = WebUtils.getCookie(request, "autoLoginCookie");
		if (autoLoginCookie != null) {
			UserVO userVo = userService.getUserBySessionId(autoLoginCookie.getValue());
			log.info("autoLogin userVo: " + userVo);
			
			if (userVo != null) {
				// 쿠키 삭제는 받아온 쿠키 객체를 직접 지운다
				autoLoginCookie.setPath(request.getContextPath() + "/");
				autoLoginCookie.setMaxAge(0);
				response.addCookie(autoLoginCookie);
				userService.undoAutoLogin(userVo.getUserNo());
			}
			
		}
		
		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
		modelAndView.setViewName("redirect:/user/userLogin");
		
		return modelAndView;
	}
	
	@PostMapping("/userJoin")
	public ModelAndView userjoin(UserVO userVO, AddressVO addressVO, CategoryVO  categoryVO, ModelAndView modelAndView, MultipartFile profilePic) {
		log.info(userVO);
		log.info(addressVO);
		log.info(categoryVO);
		log.info(profilePic);
		
		if (profilePic.getSize() != 0) {
			SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
			String today = simple.format(new Date());
			
			String fileRealName = profilePic.getOriginalFilename(); // 파일 원본명
			String profilePath = "c:/imgduck/user/";
			
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			
			UUID uuid = UUID.randomUUID();
			String uu = uuid.toString().replace("-","");
			
			
			userVO.setUserProfileFileRealName(fileRealName);
			userVO.setUserProfilePath(profilePath);
			userVO.setUserProfileFolder(today);
			userVO.setUserProfileFileName(uu + fileExtension); 
			
			String uploadFolder = profilePath + today;
			File folder = new File(uploadFolder);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			File saveFile = new File(uploadFolder+"/"+uu+fileExtension);
			try {
				profilePic.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		
		//user table 등록
		userService.registUser(userVO);
		
		// 다른 곳에서 user정보가 필요할 시, 로그인 중인 세션에서 uservo 갖고 올 예정.
		// - 안됨. userno에서 uservo를 가져와야 최신 유저 정보를 쓸 수 있다.
		// 계정 생성중에는 세션 정보가 없다.
		UserVO registeredUserVO = userService.getUserVo(userVO);
		int registerdUserNo = registeredUserVO.getUserNo();
		addressVO.setAddressUserNo(registerdUserNo);
		
		//favorite table 등록
		userService.addUserFavorites(categoryVO, registerdUserNo);
		
		if (!addressVO.getAddressBasic().equals("")) {
			// address table 등록
			userService.registAddr(addressVO);
		}
		
		modelAndView.setViewName("redirect:/user/userJoinSuccess");
		
		return modelAndView;
	}
	
	@GetMapping("/userJoinSuccess")
	public void userJoinSuccess() {};
	
	// email인증
	@ResponseBody
	@PostMapping("/userConfEmail")
	public String userConfEmail(@RequestBody String email) {
		log.info("email인증요청 들어옴" + email);
		return mailService.joinEmail(email);
	}

	@GetMapping("/userMyPage/{head}")
	public ModelAndView userMyPage(ModelAndView modelAndView, @PathVariable int head, HttpSession session) {
		modelAndView.addObject("toggle", head);
		
		modelAndView.setViewName("/user/userMyPage");
		int userNo = ((UserVO)session.getAttribute("login")).getUserNo();
		UserVO userVo = userService.getUserVoWithNo(userNo);
		List<ProductBasketVO> bvo = userService.getBasket(userNo);
		List<ProductOrderVO> ovo = productService.getOrder(userNo);
		List<String> name = new ArrayList<String>();
		System.out.println(ovo);
		
		if(ovo != null) {
			for(ProductOrderVO order : ovo) {
				ProductVO vo2 = productService.getContent(order.getOrderProductNo());
				
				name.add(vo2.getProductName());
			}
		}
		
		
		int total = 0;
		for(ProductBasketVO b : bvo) {
			total += b.getBasketQuantity() * b.getBasketPrice();
		}
		modelAndView.addObject("name", name);
		modelAndView.addObject("order", ovo);
		modelAndView.addObject("basket", bvo);
		modelAndView.addObject("total", total);
		modelAndView.addObject("user", userVo);
		
		log.info(userService.getCategories());
		
		modelAndView.addObject("categoryList", userService.getCategories());
		modelAndView.addObject("majorLength", userService.getCategories().size() - 1);
		
		List<CategoryVO> categoryVOs = userService.getUserCategories(userNo);
		
		
		modelAndView.addObject("userCategoryList", categoryVOs);
		log.info(categoryVOs);
		
		log.info(userService.getUserCategories(userNo).toString());
		
		List<AddressVO> userAddrList = userService.getUserAddr(userNo);
		
		log.info(userAddrList);
		if (userAddrList.size() != 0) {
			modelAndView.addObject("userAddrList", userAddrList);			
		}
		
		
		return modelAndView;
	}
	
	@GetMapping("/userBasket")
	public ModelAndView basket(ModelAndView modelAndView) {
		System.out.println("/userBasket GET");
		modelAndView.setViewName("redirect:/user/userMyPage/3");
		return modelAndView;
	}
	

	@ResponseBody
	@PostMapping("/checkId")
	public String checkId(@RequestBody String userId) {
		log.info(userId);
		
		if (userService.checkId(userId) == 0) {

			return "accepted";
		} else {

			return "duplicated";
		}
		
		
	}
	
	@ResponseBody
	@PostMapping("/checkNickname")
	public String checkNickname(@RequestBody String userNickname) {
		log.info(userNickname);
		
		if (userService.checkNickname(userNickname) == 0) {
			
			return "accepted";
		} else {
			
			return "duplicated";
		}
		
		
	}
	
	@ResponseBody
	@PostMapping("/pwModify")
	public String pwModify(@RequestBody List<String> passwords, HttpServletRequest request) {
		log.info(passwords);
		String userPw = passwords.get(0);
		String modiPw = passwords.get(1);
		String checkPw = passwords.get(2);
		log.info(userPw);
		log.info(modiPw);
		log.info(checkPw);
		
		HttpSession session = request.getSession();
		int userNo = ((UserVO) session.getAttribute("login")).getUserNo();
		
		Map<String, String> pwMap = new HashMap<String, String>();
		pwMap.put("userNo", Integer.toString(userNo));
		pwMap.put("userPw", userPw);
		pwMap.put("modiPw", modiPw);
		pwMap.put("checkPw", checkPw);
		
		if (userService.checkCurrPw(pwMap) == 1) {
			
			if (modiPw.equals(checkPw)) {
				userService.changePw(pwMap);
			}
			
			return "PwChanged";
		} else {
			
			return "wrongPw";
		}
		
	}
	
	@ResponseBody
	@PostMapping("/userPwConfirm")
	public String userUpdateConfirm(@RequestBody List<String> passwords, HttpServletRequest request) {
		String userPw = passwords.get(0);
		String checkPw = passwords.get(1);
		
		HttpSession session = request.getSession();
		int userNo = ((UserVO) session.getAttribute("login")).getUserNo();
		
		Map<String, String> pwMap = new HashMap<String, String>();
		pwMap.put("userNo", Integer.toString(userNo));
		pwMap.put("userPw", userPw);
		pwMap.put("checkPw", checkPw);
		
		return Integer.toString(userService.checkCurrPw(pwMap));
	}
	
	@PostMapping("/userUpdate")
	public ModelAndView userUpdate(UserVO userVO, AddressVO addressVO, CategoryVO  categoryVO
								, ModelAndView modelAndView, MultipartFile profilePic, String categoryIndex, String addressCount) {
		log.info("/userUpdate");
		log.info(userVO); 
		log.info(addressVO); // 수정된 부분 확인 후 db 수정
		log.info(categoryVO); // 삭제된 부분 조회 후 삭제 처리 먼저, 추가된 부분 확인 후 db favorite 추가. 
		log.info(profilePic); 
		log.info(categoryIndex);
		log.info(addressCount);
		
		int userNo = userVO.getUserNo();
		
		ObjectMapper categoryConverter = new ObjectMapper();
		ObjectMapper addressConverter = new ObjectMapper();
		List<String> categoryIndexList = new ArrayList<>();
		List<String> addressCountList = new ArrayList<>();
		try {
			categoryIndexList = categoryConverter.readValue(categoryIndex, new TypeReference<List<String>>(){});
			addressCountList = addressConverter.readValue(addressCount, new TypeReference<List<String>>(){});
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		
		// 저장된 카테고리 삭제 코드
		List<Integer> deletedFavoriteIndex = new ArrayList<>();
		Map<String, Object> deletedFavoriteIndexMap = new HashMap<>();
		for (int i = 0; i < userService.getUserFavorites(userNo).size(); i++) {
			if (categoryIndexList.contains(Integer.toString(i))) {
				continue;
			} else {
				deletedFavoriteIndex.add(i + 1);
			}
		}
		
		deletedFavoriteIndexMap.put("deleted_favorite_index", deletedFavoriteIndex);
//		deletedFavoriteIndexMap.put("size", deletedFavoriteIndex.size());
		deletedFavoriteIndexMap.put("userNo", userNo);
		if (deletedFavoriteIndex.size() > 0) {
			userService.deleteUserFavorites(deletedFavoriteIndexMap);
		}
		
		// 저장된 카테고리 수정 코드
		int currUserFavortiesCount = categoryIndexList.size();
		
		if (currUserFavortiesCount > 0) {
			String[] currMajorArray = new String[currUserFavortiesCount];
			String[] currMinorArray = new String[currUserFavortiesCount];
			
			String[] categoryMajorTitleList = categoryVO.getCategoryMajorTitle().split(",");
			String[] categoryMinorTitleList = categoryVO.getCategoryMinorTitle().split(",");
			
			for (int i = 0; i < currUserFavortiesCount; i++) {
				currMajorArray[i] = categoryMajorTitleList[i];
				currMinorArray[i] = categoryMinorTitleList[i];
			}
			
			String currMajorString = String.join(",", currMajorArray);
			String currMinorString =  String.join(",", currMinorArray);
			
			CategoryVO modiCategoryVo = new CategoryVO();
			modiCategoryVo.setCategoryMajorTitle(currMajorString);
			modiCategoryVo.setCategoryMinorTitle(currMinorString);
			
			log.info(modiCategoryVo);
			userService.updateUserFavorites(modiCategoryVo, userNo);
		}
		
		// 추가된 카테고리 insert 코드
		log.info(categoryVO.getCategoryMajorTitle());
		log.info(categoryVO.getCategoryMinorTitle());
		int allUserCategoriesCount = categoryVO.getCategoryMinorTitle().split(",").length;
//		currUserFavortiesCount = categoryIndexList.size();
		
		if (currUserFavortiesCount < allUserCategoriesCount) {
			String[] newMajorArray = new String[allUserCategoriesCount - currUserFavortiesCount];
			String[] newMinorArray = new String[allUserCategoriesCount - currUserFavortiesCount];
			
			String[] categoryMajorTitleList = categoryVO.getCategoryMajorTitle().split(",");
			String[] categoryMinorTitleList = categoryVO.getCategoryMinorTitle().split(",");
			
			for (int i = currUserFavortiesCount; i < allUserCategoriesCount; i++) {
				newMajorArray[i - currUserFavortiesCount] = categoryMajorTitleList[i];
				newMinorArray[i - currUserFavortiesCount] = categoryMinorTitleList[i];
			}
			
			String newMajorString = String.join(",", newMajorArray);
			String newMinorString =  String.join(",", newMinorArray);
			
			CategoryVO newCategoryVo = new CategoryVO();
			newCategoryVo.setCategoryMajorTitle(newMajorString);
			newCategoryVo.setCategoryMinorTitle(newMinorString);
			
			log.info(newCategoryVo);
			userService.addUserFavorites(newCategoryVo, userNo);
		}
		
		
		
		log.info(addressCountList);
		
		List<AddressVO> beforeDeleteAddressList = userService.getUserAddr(userNo);

		if (addressVO.getAddressBasic() != null) {
			log.info(Arrays.toString(addressVO.getAddressBasic().split(",")));
			log.info(Arrays.toString(addressVO.getAddressDetail().split(",")));
			log.info(Arrays.toString(addressVO.getAddressZipNum().split(",")));
			
			int allAddressCount = addressVO.getAddressBasic().split(",").length;
			int currAddressCount = addressCountList.size();
			
			// 저장된 주소 삭제 코드
			List<Integer> deletedAddressCount = new ArrayList<>();
			Map<String, Object> deletedAddressCountMap = new HashMap<>();
			for (int i = 0; i < beforeDeleteAddressList.size(); i++) {
				if (addressCountList.contains(Integer.toString(i + 1))) {
					continue;
				} else {
					deletedAddressCount.add(i + 1);
				}
			}
			
			deletedAddressCountMap.put("deleted_adderss_count", deletedAddressCount);
//		deletedAddressCountMap.put("size", deletedAddressCount.size());
			deletedAddressCountMap.put("userNo", userNo);
			
			log.info("deletedAddressCountMap: " + deletedAddressCountMap);
			
			if (deletedAddressCount.size() > 0) {
				userService.deleteUserAddress(deletedAddressCountMap);
			}
			
			// 저장된 주소 변경 코드
			if (currAddressCount > 0) {
				String[] addressBasicList = addressVO.getAddressBasic().split(",");
				String[] addressDetailList = addressVO.getAddressDetail().split(",");
				String[] addressZipNumList = addressVO.getAddressZipNum().split(",");
				
				String[] modiAddressBasicArray = new String[currAddressCount];
				String[] modiAddressDetailArray = new String[currAddressCount];
				String[] modiAddressZipNumArray = new String[currAddressCount];
				
				for (int i = 0; i < currAddressCount; i++) {
					modiAddressBasicArray[i] = addressBasicList[i];
					modiAddressDetailArray[i] = addressDetailList[i];
					modiAddressZipNumArray[i] = addressZipNumList[i];
				}
				
				String modiAddressBasicString = String.join(",", modiAddressBasicArray);
				String modiAddressDetailString = String.join(",", modiAddressDetailArray);
				String modiAddressZipNumString = String.join(",", modiAddressZipNumArray);
				
				AddressVO modiAddressVo = new AddressVO(0, modiAddressDetailString, modiAddressBasicString, modiAddressZipNumString, 0, userNo);
				userService.updateUserAddress(modiAddressVo, userNo);
			}
			
			// 추가된 주소 insert 코드
			if (currAddressCount < allAddressCount) {			
				String[] addressBasicList = addressVO.getAddressBasic().split(",");
				String[] addressDetailList = addressVO.getAddressDetail().split(",");
				String[] addressZipNumList = addressVO.getAddressZipNum().split(",");
				
				String[] newAddressBasicArray = new String[allAddressCount - currAddressCount];
				String[] newAddressDetailArray = new String[allAddressCount - currAddressCount];
				String[] newAddressZipNumArray = new String[allAddressCount - currAddressCount];
				
				for (int i = currAddressCount; i < allAddressCount; i++) {
					newAddressBasicArray[i - currAddressCount] = addressBasicList[i];
					newAddressDetailArray[i - currAddressCount] = addressDetailList[i];
					newAddressZipNumArray[i - currAddressCount] = addressZipNumList[i];
				}
				
				String newAddressBasicString = String.join(",", newAddressBasicArray);
				String newAddressDetailString =  String.join(",", newAddressDetailArray);
				String newAddressZipNumString =  String.join(",", newAddressZipNumArray);
				
				AddressVO newAddressVo = new AddressVO();
				newAddressVo.setAddressBasic(newAddressBasicString);
				newAddressVo.setAddressDetail(newAddressDetailString);		
				newAddressVo.setAddressZipNum(newAddressZipNumString);		
				
				log.info(newAddressVo);
				userService.addNewAddress(newAddressVo, userNo);
			}
			
			log.info("allAddressCount: " + allAddressCount);
			log.info("currAddressCount: " + currAddressCount);
			
		}
		
		
		if (profilePic.getSize() != 0) {
			SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
			String today = simple.format(new Date());
			
			String fileRealName = profilePic.getOriginalFilename(); // 파일 원본명
			String profilePath = "c:/imgduck/user/";
			
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			
			UUID uuid = UUID.randomUUID();
			String uu = uuid.toString().replace("-","");
			
			
			userVO.setUserProfileFileRealName(fileRealName);
			userVO.setUserProfilePath(profilePath);
			userVO.setUserProfileFolder(today);
			userVO.setUserProfileFileName(uu + fileExtension); 
			
			String uploadFolder = profilePath + today;
			File folder = new File(uploadFolder);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			File saveFile = new File(uploadFolder+"/"+uu+fileExtension);
			try {
				profilePic.transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			UserVO userBeforeUpdate = userService.getUserVoWithNo(userVO.getUserNo());
			File previousFile = new File(userBeforeUpdate.getUserProfilePath() + userBeforeUpdate.getUserProfileFolder()
										+ "/" + userBeforeUpdate.getUserProfileFileName());
			
			previousFile.delete();
			
		}
		
		// user 정보 업데이트
		userService.updateUserInfo(userVO);
		
		modelAndView.setViewName("redirect:/user/userMyPage/1");
		
		return modelAndView;
	}
	
	@PostMapping("/userDelete")
	public ModelAndView userDelete(int userNo, ModelAndView modelAndView, HttpServletRequest request, HttpServletResponse response) {
		
		userService.deleteUserAllInfo(userNo, request, response);
		modelAndView.setViewName("redirect:/user/userLogin");
		
		return modelAndView;
	}
	
	@GetMapping("/userFindAccount")
	public void userFindAccount() {}
	
	@PostMapping("/userFindAccount")
	public String userFindAccount (String userName, String userEmail, Model model) {
		List<String> userIds = userService.findAccount(userName,userEmail);
		model.addAttribute("userIds", userIds);
		return "/user/userFindAccountRes";
	}
	
	@GetMapping("/userFindAccountRes")
	public void successFindAccount() {}

	@GetMapping("/userFindPw")
	public void userFindPw() {}
	
	@PostMapping("/userFindPw")
	public String userFindPw(String userId, String userEmail) {
		// mailService에서 임시비밀번호 보내기
		String tmpPw = mailService.sendTmpPw(userEmail);
		// mapper에서 임시비밀번호로 비밀번호 수정하기
		userService.updatePw(userId, tmpPw);
		return "/user/userLogin";
	}
	
	@ResponseBody
	@GetMapping("/getProfile")
	public ResponseEntity<byte[]> getProfile(HttpSession session) {
		
		int userNo = ((UserVO) session.getAttribute("login")).getUserNo();
		UserVO loginUser = userService.getUserVoWithNo(userNo);
		
		File file = new File(loginUser.getUserProfilePath() + loginUser.getUserProfileFolder() + '/' +loginUser.getUserProfileFileName());
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/changeMainAddress")
	public String changeMainAddress(@RequestBody String addressCount, HttpSession session) {
		log.info(addressCount);
		
		int userNo = ((UserVO) session.getAttribute("login")).getUserNo();
		int addressRn = Integer.parseInt(addressCount);
		
		AddressVO prevRprsttvAddress = userService.getUserAddressWithRn(1, userNo);
		AddressVO nextRprsttvAddress = userService.getUserAddressWithRn(addressRn, userNo);
		
		log.info(prevRprsttvAddress);
		log.info(nextRprsttvAddress);
		Map<String, Integer> map1 = new HashMap<String, Integer>();
		map1.put("whereUserNo", userNo);
		map1.put("whereAddressNo", prevRprsttvAddress.getAddressNo());
		map1.put("modiAddressNo", 0);
		map1.put("modiAddressRprsttv", 0);
		
		userService.modiAddressNoAndRepresent(map1);
		
		Map<String, Integer> map2 = new HashMap<String, Integer>();
		map2.put("whereUserNo", userNo);
		map2.put("whereAddressNo", nextRprsttvAddress.getAddressNo());
		map2.put("modiAddressNo", prevRprsttvAddress.getAddressNo());
		map2.put("modiAddressRprsttv", 1);
		
		userService.modiAddressNoAndRepresent(map2);
		
		Map<String, Integer> map3 = new HashMap<String, Integer>();
		map3.put("whereUserNo", userNo);
		map3.put("whereAddressNo", 0);
		map3.put("modiAddressNo", nextRprsttvAddress.getAddressNo());
		map3.put("modiAddressRprsttv", 0);
		
		userService.modiAddressNoAndRepresent(map3);
		
		return "changed";
	}
	
	

}
