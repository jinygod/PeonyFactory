package product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import process.PageBean;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
//	// 기초정보등록 - 품목등록
//	@GetMapping("/product")
//	public String input_product(@ModelAttribute("productInfoBean") ProductBean productInfoBean) {
//		return "menu/input/product";
//	}
	
	@GetMapping("/product_reg")
	public String product_reg(@RequestParam("menu_idx") String menu_idx,
							  Model model) {
		model.addAttribute("menu_idx", menu_idx);
		
		return "input/product";
	}
	@GetMapping("/product_list")
	public String product_list(ProductBean productBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		List<ProductBean> ProductList = productService.getProductList(productBean);
		model.addAttribute("ProductList", ProductList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "product/product_list";
	}
	
}
