package input;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import client.ClientBean;
import client.ClientService;
import order.OrderBean;
import order.OrderService;
import process.ProcessBean;
import process.ProcessService;
import product.ProductBean;
import product.ProductService;

@Controller
@RequestMapping("/input")
public class InputController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProcessService processService;
	
	// 기초정보등록 - 거래처등록
	@GetMapping("/client")
	public String input_client(@ModelAttribute("clientInfoBean") ClientBean clientInfoBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		return "input/client";
	}
	
	// 기초정보등록 - 거래처등록
	@PostMapping("/client_pro")

	public String client_pro(@ModelAttribute("clientInfoBean") ClientBean clientInfoBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		clientService.addClientInfo(clientInfoBean);
		model.addAttribute("menu_idx", menu_idx);
		return "input/client_success";
	}
	
	// 기초정보등록 - 품목등록
	@GetMapping("/product")
	public String input_product(@ModelAttribute("productInfoBean") ProductBean productInfoBean,
								@RequestParam("menu_idx") String menu_idx,
								Model model) {
		model.addAttribute("menu_idx", menu_idx);
		return "input/product";
	}
	// 기초정보등록 - 품목등록
	@PostMapping("/product_pro")
	public String product_pro(@ModelAttribute("productInfoBean") ProductBean productInfoBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		productService.addProductInfo(productInfoBean);
		model.addAttribute("menu_idx", menu_idx);
		return "input/product_success";
	}
	
	// 기초정보등록 - 주문등록
	@GetMapping("/order")
	public String input_order(@ModelAttribute("orderInfoBean") OrderBean orderInfoBean,
							  @RequestParam("menu_idx") String menu_idx,
							  Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		return "input/order";
	}
	// 기초정보등록 - 주문등록	
	@PostMapping("/order_pro")
	public String order_pro(@ModelAttribute("orderInfoBean") OrderBean orderInfoBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		orderService.addOrderInfo(orderInfoBean);
		model.addAttribute("menu_idx", menu_idx);
		return "input/order_success";
	}
	
	// 기초정보등록 - 공정등록
	@GetMapping("/process")
	public String input_process(@ModelAttribute("processInfoBean") ProcessBean processInfoBean,
							    @RequestParam("menu_idx") String menu_idx,
							    Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		return "input/process";
	}
	// 기초정보등록 - 공정등록	
	@PostMapping("/process_pro")
	public String process_pro(@ModelAttribute("processInfoBean") ProcessBean processInfoBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		processService.addProcessInfo(processInfoBean);
		model.addAttribute("menu_idx", menu_idx);
		return "input/process_success";
	}

}
