package input.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu/input")
public class ClientController {
	
	@GetMapping("/client")
	public String input_client(@ModelAttribute("clientInfoBean") ClientBean clientInfoBean) {
		return "menu/input/client";
	}
	
	@PostMapping("/client_pro")
	public String input_client_pro() {
		
		return "menu/input/client_success";
	}
	
	@GetMapping("/order")
	public String input_order() {
		return "menu/input/order";
	}
	
	@GetMapping("/process")
	public String input_process() {
		return "menu/input/process";
	}
	
	@GetMapping("/product")
	public String input_product() {
		return "menu/input/product";
	}
	
}
