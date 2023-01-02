package kr.co.seaduckene.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.product.service.IProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService productService;

	@GetMapping("/createProduct")
	public void createProduct() {}
	
	@GetMapping("/order")
	public void orderSheet() {}
	
	@GetMapping("/productDetail")
	public void detail() {}
	
	@GetMapping("/finishOrder")
	public void finishOrder() {}
	
	@PostMapping("/order")
	public String order(@RequestParam("orderProductNo") List<Integer> orderProductNoList ,ProductOrderVO orderVo ,String userEmail/*, HttpSession session*/) {
		System.out.println("controller 동작");
		System.out.println(orderVo);
		System.out.println(userEmail);
		
		// order TABLE INSERT
		//UserVO user = (UserVO)session.getAttribute("login");
		//user.setUserNo(999);
		//productService.order(orderList, userEmail, addrVo, user);
		
		
		return "redirect:/product/finishOrder";
		
	}
	
	
	
	
	
	@GetMapping("/test")
	public void test() {}
	
	@PostMapping("/test2")
	public void test2 (@RequestParam("test") List<String> tests) {
		System.out.println("test2 POSt");
		System.out.println(tests);
	}
	
}
