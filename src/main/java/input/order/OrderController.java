package input.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu/input")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@GetMapping("/order")
	public String input_order(@ModelAttribute("orderInfoBean") OrderBean orderInfoBean) {
		return "menu/input/order";
	}
	
	@PostMapping("/order_pro")
	public String order_pro(@ModelAttribute("orderInfoBean") OrderBean orderInfoBean) {
		
		orderService.addOrderInfo(orderInfoBean);
		
		return "menu/input/order";
	}
	

	
}
