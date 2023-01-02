package kr.co.seaduckene.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/product")
public class ProductController {

	@GetMapping("/createProduct")
	public void createProduct() {}
	
	@GetMapping("/order")
	public void orderSheet() {}
	
	@GetMapping("/productDetail")
	public void detail( ) {}
	
	
	
}
