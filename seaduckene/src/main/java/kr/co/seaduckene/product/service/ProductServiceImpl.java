package kr.co.seaduckene.product.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.address.command.AddressVO;
import kr.co.seaduckene.address.mapper.IAddressMapper;
import kr.co.seaduckene.board.command.BoardCategoryVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
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
		
		// 주문번호 날짜 8자리
		Date today = new Date();
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyyMMdd");
		String date = formatDate.format(today);
		
		// order TABLE INSERT
		for(int productNo : orderProductNoList) {
			
			// 주문번호 랜덤4자리
			Random random = new Random();
			int ranNum = random.nextInt(10000);
			// 12자리 주문번호 생성 및 setting
			String orderNum = date+ranNum;
			System.out.println("생성한 주문번호: " + orderNum);
			
			order.setOrderNum(orderNum);
			order.setOrderUserNo(user.getUserNo());
			order.setOrderProductNo(productNo);
			
			// basketVO에서 상품정보,가격 가져와서 OrderVO에 setting하기
			
			productMapper.order(order);
		}
		
		// user TABLE UPDATE
		
		// address TABLE INSERT
		if(checkAddr(user.getUserNo(), order.getOrderAddressBasic())== 0) {
			AddressVO addrVo = new AddressVO(0,order.getOrderAddressDetail(),order.getOrderAddressBasic(),
					order.getOrderAddressZipNum(),user.getUserNo());
			addressMapper.addAddress(addrVo);
		}
	}
	
	// 기 등록된 주소인지 여부 확인
	public int checkAddr(int userNo, String addressBasic) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		map.put("OrderAddressBasic", addressBasic);
		return addressMapper.checkAddr(map);
	}
	
	
	@Autowired
	private IProductMapper mapper;
	
	
	//카테고리 가져오기
	@Override
	public List<BoardCategoryVO> getCategory() {
		return mapper.getCategory();
	}
	
	@Override
	public List<String> getMinor(String major) {
		
		return mapper.getMinor(major);
	}
	
	@Override
	public int getCNum(Map<String, Object> map) {
		
		return mapper.getCNum(map);
	}
	
	
	public void insertProduct(Map<String, Object> map) {
		mapper.insertProduct(map);
	}
}
