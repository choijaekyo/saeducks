package kr.co.seaduckene.product.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.common.IAddressMapper;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.product.command.ProductImageVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.product.mapper.IProductMapper;
import kr.co.seaduckene.user.command.UserVO;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	private IProductMapper productMapper;
	@Autowired
	private IAddressMapper addressMapper;
	
	
	@Override
	public void order(List<Integer> orderProductNoList, ProductOrderVO order, String userEmail, UserVO user) {
		int userNo = user.getUserNo();
		
		// 주문번호 날짜 8자리
		Date today = new Date();
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyyMMdd");
		String date = formatDate.format(today);
		
		// order TABLE INSERT
		for(int productNo : orderProductNoList) {
			
			// 주문번호 랜덤4자리
			Random random = new Random();
			int ranNum = random.nextInt(8889)+1111;
			// 12자리 주문번호 생성 및 setting
			String orderNum = date+ranNum;
			System.out.println("생성한 주문번호: " + orderNum);
			
			order.setOrderNum(orderNum);
			order.setOrderUserNo(userNo);
			order.setOrderProductNo(productNo);
			
			//basketVO에서 상품정보,가격 가져와서 OrderVO에 setting하기
			Map<String, Object> basketMap = new HashMap<String, Object>();
			basketMap.put("userNo", userNo);
			basketMap.put("productNo", productNo);
			ProductBasketVO basket = productMapper.getBasket(basketMap);
			
			int quantity = basket.getBasketQuantity();
			int price = basket.getBasketPrice();
			
			order.setOrderQuantity(quantity);
			order.setOrderPrice(quantity*price);
			
			productMapper.order(order);
		}
		
		// user TABLE UPDATE
		updateEmail(userNo, userEmail);	
		
		// address TABLE INSERT
		if(checkAddr(userNo, order.getOrderAddressDetail())== 0) {
			AddressVO addrVo = new AddressVO(0,order.getOrderAddressDetail(),order.getOrderAddressBasic(),
					order.getOrderAddressZipNum(),userNo);
			addressMapper.addAddress(addrVo);
		}
	}
	
	// 주문user Email UPDATE
	public void updateEmail(int userNo, String userEmail) {
		Map<String, Object> userMap = new HashMap<String, Object>();
		userMap.put("userNo", userNo);
		userMap.put("userEmail", userEmail);
		productMapper.updateEmail(userMap);
	}
	
	// 기 등록된 주소인지 여부 확인
	public int checkAddr(int userNo, String addressDetail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("OrderAddressDetail", addressDetail.trim());
		return addressMapper.checkAddr(map);
	}
	

	//카테고리 가져오기
	@Override
	public List<CategoryVO> getCategory() {
		return productMapper.getCategory();
	}
	
	@Override
	public List<String> getMinor(String major) {
		
		return productMapper.getMinor(major);
	}
	
	@Override
	public int getCNum(Map<String, Object> map) {
		
		return productMapper.getCNum(map);
	}
	
	
	public void insertProduct(Map<String, Object> map) {
		productMapper.insertProduct(map);
	}
	
	@Override
	public void insertImg(ProductImageVO vo) {
		productMapper.insertImg(vo);
	}
	
	@Override
	public ProductVO getContent(int num) {
		
		return productMapper.getContent(num);
	}
	
	@Override
	public List<ProductImageVO> getImg(int num) {
		return productMapper.getImg(num);
	}
}
