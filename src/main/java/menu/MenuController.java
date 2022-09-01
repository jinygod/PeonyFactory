package menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/input")
	public String input(@RequestParam("menu_idx") String menu_idx, Model model) {
		model.addAttribute("menu_idx", menu_idx);
		return "menu/input";
	}

	@GetMapping("/submenu")
	public String submenu(@RequestParam("menu_idx") String menu_idx, Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		List<MenuBean> SubMenuList = menuService.getSubMenuInfo(menu_idx);
		model.addAttribute("SubMenuList", SubMenuList);
		
		return "menu/submenu";
	}
	
	
//	@GetMapping("/client_list")
//	public String client_list() {
//		return "menu/client_list";
//	}
//	@GetMapping("/order_reg")
//	public String order_reg() {
//		return "menu/order_reg";
//	}
//	@GetMapping("/order_approve")
//	public String order_approve() {
//		return "menu/order_approve";
//	}
//	@GetMapping("/order_list")
//	public String order_list() {
//		return "menu/order_list";
//	}
//	@GetMapping("/produce_reg")
//	public String produce_reg() {
//		return "menu/produce_reg";
//	}
//	@GetMapping("/produce_list")
//	public String produce_list() {
//		return "menu/produce_list";
//	}
//	@GetMapping("/process_reg")
//	public String process_reg() {
//		return "menu/process_reg";
//	}
//	@GetMapping("/process_list")
//	public String process_list() {
//		return "menu/process_list";
//	}
//	@GetMapping("/process_info")
//	public String process_info() {
//		return "menu/process_info";
//	}
//	@GetMapping("/result_product_list")
//	public String result_product_list() {
//		return "menu/result_product_list";
//	}
//	@GetMapping("/result_process_list")
//	public String result_process_list() {
//		return "menu/result_process_list";
//	}
//	@GetMapping("/result_error")
//	public String result_error() {
//		return "menu/result_error";
//	}
//	@GetMapping("/result_report")
//	public String result_report() {
//		return "menu/result_report";
//	}
}
