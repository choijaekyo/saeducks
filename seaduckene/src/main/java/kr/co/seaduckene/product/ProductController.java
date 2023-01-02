package kr.co.seaduckene.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.seaduckene.product.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService service;

	@GetMapping("/createProduct")
	public void createProduct() {}
	
	@GetMapping("/order")
	public void orderSheet() {}
	
	@GetMapping("/productDetail")
	public void detail( ) {}
	
	
	
}
