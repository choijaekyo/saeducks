package kr.co.seaduckene.product.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.address.command.AddressVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.product.mapper.IProductMapper;
import kr.co.seaduckene.user.command.UserVO;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	private IProductMapper productMapper;
	//@Autowired
	//private IAddressMapper addressMapper
	
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
			
			productMapper.order(order);
		}
		
		// user TABLE UPDATE
		
		// address TABLE INSERT
		AddressVO addrVo = new AddressVO();
		addrVo.setAddressZipNum(order.getOrderAddressZipNum());
		addrVo.setAddressBasic(order.getOrderAddressBasic());
		addrVo.setAddressDetail(order.getOrderAddressDetail());
		// addressMapper.addAddress(addrVo);
		
	}
	
}
