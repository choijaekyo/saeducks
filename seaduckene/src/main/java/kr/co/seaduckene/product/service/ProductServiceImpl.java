package kr.co.seaduckene.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.seaduckene.board.command.BoardCategoryVO;
import kr.co.seaduckene.board.command.BoardImageVO;
import kr.co.seaduckene.product.mapper.IProductMapper;

@Service
public class ProductServiceImpl implements IProductService {
	
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
