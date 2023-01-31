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
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.seaduckene.common.AddressVO;
import kr.co.seaduckene.common.CategoryVO;
import kr.co.seaduckene.product.command.ProductBasketVO;
import kr.co.seaduckene.product.command.ProductImageVO;
import kr.co.seaduckene.product.command.ProductOrderVO;
import kr.co.seaduckene.product.command.ProductVO;
import kr.co.seaduckene.product.service.IProductService;
import kr.co.seaduckene.user.command.UserVO;
import kr.co.seaduckene.user.service.IUserService;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@RequestMapping("/product")
@PropertySource("classpath:tossPay.properties")
public class ProductController {
	
	@Autowired
	private IProductService productService;
	@Autowired
	private IUserService userService;
	
	@Value("${toss.clientKey}")
	private String clientKey;

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
	
	@GetMapping("/modifyProduct")
	public void modify(Model model , int no) {
		System.out.println("product/modifyProduct GET 요청");
		ProductVO pvo = productService.getContent(no);
		List<CategoryVO> list = productService.getCategory();
		LinkedHashSet<String> major = new LinkedHashSet<String>();
		CategoryVO cvo = productService.getCt(pvo.getProductCategoryNo());
		for(CategoryVO vo : list) {
			major.add(vo.getCategoryMajorTitle());
		}
		model.addAttribute("product", pvo);
		model.addAttribute("major", major);
		model.addAttribute("category", list);
		model.addAttribute("cvo", cvo);
		
	}
	@GetMapping("/deleteProduct")
	public String delProduct(int no) {
		System.out.println("product/deleteProduct GET 요청");
		productService.delProduct(no);
		return "redirect:/";
	}
	
	@GetMapping("/master")
	public void master() {
		
	}
	
	@GetMapping("/order")
	public void orderSheet(HttpSession session,Model model) {
		System.out.println("controller동작 order/GET");
		
		UserVO user = (UserVO)session.getAttribute("login");
		int userNo = user.getUserNo();

		// 주소목록 불러오기
		List<AddressVO> addrList = userService.getUserAddr(userNo);
		model.addAttribute("addrList", addrList);
		
		// 장바구니 상품 불러오기
		List<ProductBasketVO> basketList = productService.getBasketList(userNo);
		model.addAttribute("basketList",basketList);
		
		int total = 0;
		// 상품 썸네일 가져오기
		for(ProductBasketVO product : basketList) {
			//ProductImageVO thumbnail = productService.getThumbnailImg(product.getBasketProductNo());
			
			// 총액 계산하기
			total += product.getBasketQuantity()*product.getBasketPrice();
		}
		//model.addAttribute("total",total);
		session.setAttribute("total", total);
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
		
		File file = new File("/usr/local/imgduck/product/" +fileLoca+"/"+fileName);
		System.out.println(file);
		
		byte[] result = null;
		try {
			result = FileCopyUtils.copyToByteArray(file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
				
		
	}
	
	@GetMapping("/display2")
	@ResponseBody
	public byte[] getFile2(int no){
		System.out.println("/display2:GET");
		System.out.println(no);
		
		ProductImageVO vo = productService.getThumbnailImg(no);
		String fileLoca = vo.getProductImageFolder();
		String fileName = vo.getProductImageFileName();
		
		
		File file = new File("/usr/local/imgduck/product/" +fileLoca+"/"+fileName);
		System.out.println(file);
		
		byte[] result = null;
		try {
			result = FileCopyUtils.copyToByteArray(file);
		} catch (IOException e) {
			e.printStackTrace();
		}	
		return result;
	}

	@PostMapping("/order")
	public String order(@RequestParam("orderProductNo") List<Integer> orderProductNoList ,
						ProductOrderVO orderVo ,String userEmail, HttpSession session,
						RedirectAttributes ra) {
		System.out.println("controller 동작");
		System.out.println(orderVo);
		System.out.println(userEmail);
		System.out.println(orderVo.getOrderPaymentMethod());
		
		UserVO user = (UserVO)session.getAttribute("login");	
		
		String result =  productService.checkStock(orderProductNoList, user);
		
		
		
		if(result.equals("lack")) {
			ra.addFlashAttribute("result", result);
			return "redirect:/product/order";
		} else {
			if(orderVo.getOrderPaymentMethod().equals("tossPay")) {
				session.setAttribute("orderList", orderProductNoList);
				session.setAttribute("orderVo", orderVo);
				session.setAttribute("userEmail", userEmail);
				ra.addFlashAttribute("clientKey", clientKey);
				return "redirect:/product/payment";
			} else {
				productService.order(orderProductNoList, orderVo, userEmail, user);
				return "redirect:/user/userMyPage/4";	
			}
		}
		
	}
	
	@ResponseBody
	@GetMapping("/getCategory")
	public List<String> getCategory(@RequestParam("major") String major){
		System.out.println("/product/getCategory GET");
		return productService.getMinor(major);
	}
	
	@PostMapping("/createProduct")
	public String insertProduct(ProductVO vo,@RequestParam("majorCategory") String major,
			@RequestParam("minorCategory") String minor,
			@RequestParam("productImg") List<MultipartFile> list,
			@RequestParam("thumbnailImg") MultipartFile thumb) {
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
		list.add(thumb);
		String uploadFolder ="/usr/local/imgduck/product/"+today;
		ivo.setProductImagePath("/usr/local/imgduck/product/");
		for(int i =0;i<list.size();i++ ) {
				ivo.setProductThumbnail(0);
			if(i==(list.size()-1)) {
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
		return "redirect:/product/createProduct";	 
	}
	@PostMapping("/modifyProduct")
	public String updateProduct(ProductVO vo,@RequestParam("majorCategory") String major,
			@RequestParam("minorCategory") String minor,
			@RequestParam("productImg") List<MultipartFile> list,
			@RequestParam("thumbnailImg") MultipartFile thumb) {
		System.out.println("/product/modify POST");
		Map<String, Object> map = new HashMap<>();
		map.put("major", major);
		map.put("minor", minor);
		System.out.println("파일 들어왓니:"+thumb.getSize());
		int cnum = productService.getCNum(map);
		vo.setProductCategoryNo(cnum);
		System.out.println(vo);
		map.put("cnum", cnum);
		map.put("vo", vo);
		productService.updateProduct(vo);
		

		if(thumb.getSize() !=0) {

			List<ProductImageVO> iList = productService.getImg(vo.getProductNo());
			
			for (ProductImageVO ivo2 : iList) {
				File file = new File(ivo2.getProductImagePath()+ivo2.getProductImageFolder()+"/"+ivo2.getProductImageFileName());
				file.delete();
			}
			productService.deleteImage(vo.getProductNo());
			ProductImageVO ivo = new ProductImageVO();
			
			SimpleDateFormat simple = new SimpleDateFormat("yyyyMMdd");
			String today = simple.format(new Date());
			ivo.setProductImageFolder(today);
			list.add(thumb);
			String uploadFolder ="/usr/local/imgduck/product/"+today;
			ivo.setProductImagePath("/usr/local/imgduck/product/");
			for(int i =0;i<list.size();i++ ) {
					ivo.setProductThumbnail(0);
					ivo.setProductImageProductNo(vo.getProductNo());
				if(i==(list.size()-1)) {
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
				productService.insertImg2(ivo);
				try {
					list.get(i).transferTo(saveFile);
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		}

		return "redirect:/admin/productList";	 
	}
	
	@GetMapping("/mainDisplayImg")
	public ResponseEntity<byte[]> mainDisplayImg(String fileLoca, String fileName) {
		
		File file = new File("/usr/local/imgduck/product/" + fileLoca + "/" + fileName);
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
	public String insertBasket(@RequestBody ProductBasketVO vo) {
		System.out.println(vo);
		ProductVO pvo = productService.getContent(vo.getBasketProductNo());
		if(pvo.getProductStock() == 0) return "empty";
		if(productService.basketChk(vo)==1) return"fail";
		productService.insertBasket(vo);
		return"seccess";
	}
	@GetMapping("/plusQuantity")
	public ModelAndView plusQ(ModelAndView modelAndView , int basketNo ,int q,int pNo) {
		System.out.println("/plusQuantity GET");
		modelAndView.setViewName("redirect:/user/userMyPage/3");
		ProductVO vo = productService.getContent(pNo);
		if(q == vo.getProductStock()) {
			return modelAndView;
		}
		Map<String, Object> map = new HashMap<>();
		map.put("basketNo",basketNo);
		map.put("q",q+1);
		productService.cQuantity(map);
		
		return modelAndView;
	}
	
	@GetMapping("/minusQuantity")
	public ModelAndView minusQ(ModelAndView modelAndView , int basketNo,int q ) {
		System.out.println("/minusQuantity GET");
		modelAndView.setViewName("redirect:/user/userMyPage/3");
		if(q==1) return modelAndView;
		Map<String, Object> map = new HashMap<>();
		map.put("basketNo",basketNo);
		map.put("q",q-1);
		productService.cQuantity(map);

		
		return modelAndView;
	}
	@GetMapping("/basketDel")
	public ModelAndView basketDel(ModelAndView modelAndView , int basketNo) {
		
		productService.delBasekt(basketNo);
		
		modelAndView.setViewName("redirect:/user/userMyPage/3");
		
		return modelAndView;
	}
	
	@GetMapping("/payment")
	public void payment() {}
	
	@GetMapping("/success")
	public String paycomplete(HttpSession session,@RequestParam String paymentKey) {
		System.out.println("페이먼트 키: "+paymentKey);
		
		@SuppressWarnings("unchecked")
		List<Integer> orderProductNoList = (List<Integer>) session.getAttribute("orderList");
		ProductOrderVO orderVo = (ProductOrderVO) session.getAttribute("orderVo");
		orderVo.setPaymentKey(paymentKey);
		String userEmail = (String) session.getAttribute("userEmail");
		
		UserVO user = (UserVO)session.getAttribute("login");	
		productService.order(orderProductNoList, orderVo, userEmail, user);
		
		return "redirect:/user/userMyPage/4";
	}
	
	@GetMapping("/fail")
	public String fail() {
		return "redirect:/user/userMyPage/3";
	}
	
	@GetMapping("/refund")
	public void refund1(int no,Model model) {
		ProductVO vo= productService.getContent(no);
		model.addAttribute("vo", vo);
		
	}
	@PostMapping("/refund")
	public String refund(@RequestParam("refundType") String type, int productNo, @RequestParam("reasonForRefund") String reason) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("productNo",productNo);
		map.put("reason", reason);
		productService.refund(map);
			
		
		return"redirect:/user/userMyPage/4";
	}
	
	
}
