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
	
	
	// 장바구니 상품 불러오기
	public List<ProductBasketVO> getBasketList(int userNo){
		return productMapper.getBasketList(userNo);
	}
	
	// 썸네일 가져오기
	public ProductImageVO getThumbnailImg(int productNo) {
		return productMapper.getThumbnailImg(productNo);
	}
	
	// 상품 재고수량 확인
	public String checkStock (List<Integer> orderProductNoList, UserVO user, int ea) {
		int userNo = user.getUserNo();
		
		if(ea != 0) {
			for(int productNo : orderProductNoList) {
				ProductVO product = productMapper.getContent(productNo);
				int stock = product.getProductStock();
				String productName = product.getProductName();
				if(stock < ea) {
					return "lack/"+productName;
				}
			}
			return "possible";
			
		} else {
			for(int productNo : orderProductNoList) {
				Map<String, Object> basketMap = new HashMap<String, Object>();
				basketMap.put("userNo", userNo);
				basketMap.put("productNo", productNo);
				ProductBasketVO basket = productMapper.getBasket(basketMap);
				
				ProductVO product = productMapper.getContent(productNo);
				int stock = product.getProductStock();
				String productName = product.getProductName();
				if(stock < basket.getBasketQuantity()) {
					return "lack/"+productName;
				}
			}
			return "possible";
		}
	}
	
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
			
			ProductVO product = productMapper.getContent(productNo);
			int stock = product.getProductStock();
			
			productMapper.order(order);
				
			// 상품 재고 수량 수정			
			int newStock = stock - quantity;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("stock", newStock);
			map.put("productNo", productNo);
			productMapper.updateStock(map);			
		
		}
		// user TABLE UPDATE
		 if(user.getUserEmail() == null) {
			updateEmail(userNo, userEmail);
		 }
		
		// address TABLE INSERT
		if(checkAddr(userNo, order.getOrderAddressDetail(),order.getOrderAddressZipNum())== 0) {
			addAddress(order, userNo);
		}
		
		// 장바구니 비우기
		productMapper.deleteBasket(userNo);
		
	}
	
	@Override
	public void order2(List<Integer> orderProductNoList, ProductOrderVO order, String userEmail, UserVO user, int ea) {
		int userNo = user.getUserNo();
		
		// 주문번호 날짜 8자리
		Date today = new Date();
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyyMMdd");
		String date = formatDate.format(today);
		
		// order TABLE INSERT
		for(int productNo : orderProductNoList) {
			ProductVO product = productMapper.getContent(productNo);
			
			// 주문번호 랜덤4자리
			Random random = new Random();
			int ranNum = random.nextInt(8889)+1111;
			// 12자리 주문번호 생성 및 setting
			String orderNum = date+ranNum;
			System.out.println("생성한 주문번호: " + orderNum);
			
			order.setOrderNum(orderNum);
			order.setOrderUserNo(userNo);
			order.setOrderProductNo(productNo);
			
			int quantity = ea;
			int price = product.getProductPriceSelling();
			
			order.setOrderQuantity(quantity);
			order.setOrderPrice(quantity*price);
			
			
			int stock = product.getProductStock();
			
			productMapper.order(order);
				
			// 상품 재고 수량 수정			
			int newStock = stock - quantity;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("stock", newStock);
			map.put("productNo", productNo);
			productMapper.updateStock(map);			
		
		}
		// user TABLE UPDATE
		 if(user.getUserEmail() == null) {
			updateEmail(userNo, userEmail);
		 }
		
		// address TABLE INSERT
		if(checkAddr(userNo, order.getOrderAddressDetail(),order.getOrderAddressZipNum())== 0) {
			addAddress(order, userNo);
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
	public int checkAddr(int userNo, String addressDetail, String addressZipnum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("OrderAddressDetail", addressDetail.replaceAll(" ", ""));
		map.put("zipNum", addressZipnum);
		return addressMapper.checkAddr(map);
	}
	
	// 주소테이블에 신규주소 등록
	public void addAddress(ProductOrderVO order,int userNo) {
		
		if(addressMapper.getUserAddr(userNo)==null) {
			AddressVO addrVo = new AddressVO(0,order.getOrderAddressDetail(),
					order.getOrderAddressBasic(),
					order.getOrderAddressZipNum(),1,userNo);
				addressMapper.addAddress(addrVo);
		}else {
			AddressVO addrVo = new AddressVO(0,order.getOrderAddressDetail(),
					order.getOrderAddressBasic(),
					order.getOrderAddressZipNum(),0,userNo);
				addressMapper.addAddress(addrVo);
		}
		
		
	}

	
	//카테고리 가져오기
	@Override
	public List<CategoryVO> getCategory() {
		return productMapper.getCategory();
	}
	
	@Override
	public List<String> getMajor() {
		return productMapper.getMajor();
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
	
	@Override
	public List<ProductImageVO> mainImage(int userNo) {
		return productMapper.mainImage(userNo);
	}
	
	@Override
	public List<ProductImageVO> mainImageNo() {
		return productMapper.mainImageNo();
	}
	
	@Override
	public void insertBasket(ProductBasketVO vo) {
		productMapper.insertBasket(vo);
	}
	
	@Override
	public void cQuantity(Map<String, Object> map) {
		productMapper.cQuantity(map);
	}
	@Override
	public int basketChk(ProductBasketVO vo) {
		
		return productMapper.basketChk(vo);
	}
	@Override
	public void delBasekt(int basketNo) {
		productMapper.delBasekt(basketNo);
		
	}
	
	@Override
	public List<ProductOrderVO> getOrder(int userNo) {
		
		return productMapper.getOrder(userNo);
	} //주문정보 불러오기
	
	@Override
	public CategoryVO getCt(int categoryNo) {
		
		return productMapper.getCt(categoryNo);
	}
	
	@Override
	public void updateProduct(ProductVO vo) {
		productMapper.updateProduct(vo);
		
	}
	@Override
	public void insertImg2(ProductImageVO vo) {
		productMapper.insertImg2(vo);
		
	}
	
	@Override
	public void deleteImage(int num) {
		productMapper.deleteImage(num);
		
	}
	@Override
	public void delProduct(int no) {
		productMapper.delProduct(no);
		
	}
	@Override
	public void refund(Map<String, Object> map) {
		productMapper.refund(map);
	}

	@Override
	public List<ProductVO> getProductList(int categoryNo) {
		return productMapper.getProductList(categoryNo);
	}


	
	
}
