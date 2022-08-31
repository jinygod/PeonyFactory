package input.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu/input")
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/product")
	public String input_product(@ModelAttribute("productInfoBean") ProductBean productInfoBean) {
		return "menu/input/product";
	}
	
	@PostMapping("/product_pro")
	public String product_pro(@ModelAttribute("productInfoBean") ProductBean productInfoBean) {
		
		productService.addProductInfo(productInfoBean);
		
		return "menu/input/product";
	}
	

	
}
