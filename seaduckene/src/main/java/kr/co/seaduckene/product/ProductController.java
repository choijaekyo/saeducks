package kr.co.seaduckene.product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.product.command.ProductImageVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.product.service.IProductService;
import kr.co.seaduckene.user.command.UserVO;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private IProductService productService;

	@GetMapping("/createProduct")
	public void createProduct(Model model) {
		System.out.println("product/createProduct GET 요청");
		List<CategoryVO> list = productService.getCategory();
		LinkedHashSet<String> major = new LinkedHashSet<String>();
		
		for(CategoryVO vo : list) {
			major.add(vo.getCategoryMajorTitle());
		}
		model.addAttribute("major", major);
		model.addAttribute("category", list);
		
	}
	
	@GetMapping("/order")
	public void orderSheet(HttpSession session,Model model) {
		System.out.println("controller동작 order/GET");
		
//		UserVO user = (UserVO)session.getAttribute("login");
//		int userNo = user.getUserNo();
		
		int userNo=999;
		
		// 장바구니 상품 불러오기
		List<ProductBasketVO> basketList = productService.getBasketList(userNo);
		model.addAttribute("basketList",basketList);
		System.out.println(basketList);
//		for(ProductBasketVO product : basketList) {
//			ProductImageVO thumbnail = productService.getThumbnailImg(product.getBasketProductNo());
//			modelAndView.addObject("thumbnail",thumbnail);
//		}
		
	}
	
	@GetMapping("/productDetail")
	public void detail(int productNo,Model model) {
		ProductVO vo = productService.getContent(productNo);
		List<ProductImageVO> ivo = productService.getImg(productNo);
		System.out.println(vo);
		System.out.println(ivo);
		model.addAttribute("vo", vo);
		model.addAttribute("imgList", ivo);
	}
	
	@GetMapping("/display")
	@ResponseBody
	public byte[] getFile(String fileLoca, String fileName){
		System.out.println("/display:GET");
		System.out.println("fileName:" + fileName);
		System.out.println("fileLoca:" + fileLoca);
		
		File file = new File("c:/imgduck/product/" +fileLoca+"/"+fileName);
		System.out.println(file);
		
		byte[] result = null;
		try {
			result = FileCopyUtils.copyToByteArray(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
				
		
	}
	
	@GetMapping("/finishOrder")
	public void finishOrder() {}
	
	@PostMapping("/order")
	public String order(@RequestParam("orderProductNo") List<Integer> orderProductNoList ,
						ProductOrderVO orderVo ,String userEmail/*, HttpSession session*/) {
		System.out.println("controller 동작");
		System.out.println(orderVo);
		System.out.println(userEmail);
		
		// order TABLE INSERT
		//UserVO user = (UserVO)session.getAttribute("login");
		//user.setUserNo(999);
		//productService.order(orderList, userEmail, addrVo, user);

		UserVO user = new UserVO();
		user.setUserNo(999);
		
		productService.order(orderProductNoList, orderVo, userEmail, user);
		
		return "redirect:/product/finishOrder";	
	}
	
	@ResponseBody
	@GetMapping("/getCategory")
	public List<String> getCategory(@RequestParam("major") String major){
		System.out.println("/product/getCategory GET");
		return productService.getMinor(major);
	}
	
	@PostMapping("/createProduct")
	public void insertProduct(ProductVO vo,@RequestParam("majorCategory") String major,
			@RequestParam("minorCategory") String minor,
			@RequestParam("productImg") List<MultipartFile> list) {
		System.out.println("/product/createProduct POST");
		System.out.println(major+minor);
		System.out.println(vo);
		Map<String, Object> map = new HashMap<>();
		map.put("major", major);
		map.put("minor", minor);
		map.put("vo", vo);
		int cnum = productService.getCNum(map);
		map.put("cnum", cnum);
		productService.insertProduct(map);
		
		ProductImageVO ivo = new ProductImageVO();
		
		SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
		String today = simple.format(new Date());
		ivo.setProductImageFolder(today);
		
		String uploadFolder ="C:/imgduck/product/"+today;
		ivo.setProductImagePath("C:/imgduck/product/");
		for(int i =0;i<list.size();i++ ) {
				ivo.setProductThumbnail(0);
			if(i==0) {
				ivo.setProductThumbnail(1);
			}
			String fileRealName = list.get(i).getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			ivo.setProdcutImageFileRealName(fileRealName);
			
			UUID uuid = UUID.randomUUID();
			String uu = uuid.toString().replace("-","");
			
			ivo.setProductImageFileName(uu+fileExtension);
			
			File folder = new File(uploadFolder);
			if(!folder.exists()) {
				folder.mkdirs();
			}
			File saveFile = new File(uploadFolder+"/"+uu+fileExtension);
			productService.insertImg(ivo);
			try {
				list.get(i).transferTo(saveFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}
	
	@GetMapping("/mainDisplayImg")
	public ResponseEntity<byte[]> mainDisplayImg(String fileLoca, String fileName) {
		
		File file = new File("C:/imgduck/product/" + fileLoca + "/" + fileName);
		ResponseEntity<byte[]>result = null;
		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	@PostMapping("/insertBasket")
	@ResponseBody
	public void insertBasket(@RequestBody ProductBasketVO vo) {
		System.out.println(vo);
		productService.insertBasket(vo);
	}
	@GetMapping("/plusQuantity")
	public ModelAndView plusQ(ModelAndView modelAndView , int basketNo ,int q) {
		System.out.println("/plusQuantity GET");
		Map<String, Object> map = new HashMap<>();
		map.put("basketNo",basketNo);
		map.put("q",q+1);
		productService.cQuantity(map);
		modelAndView.setViewName("redirect:/user/userMyPage/3");
		return modelAndView;
	}
	
	@GetMapping("/minusQuantity")
	public ModelAndView minusQ(ModelAndView modelAndView , int basketNo,int q) {
		System.out.println("/minusQuantity GET");
		modelAndView.setViewName("redirect:/user/userMyPage/3");
		if(q==0) return modelAndView;
		Map<String, Object> map = new HashMap<>();
		map.put("basketNo",basketNo);
		map.put("q",q-1);
		productService.cQuantity(map);

		
		return modelAndView;
	}
	
	
	
	
	
	
}
