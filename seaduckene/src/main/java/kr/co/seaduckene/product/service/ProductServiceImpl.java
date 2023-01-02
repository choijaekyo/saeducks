package kr.co.seaduckene.product.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.product.mapper.IProductMapper;

@Service
public class ProductServiceImpl implements IProductService {
	
	@Autowired
	private IProductMapper mapper;

}
