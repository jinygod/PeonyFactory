package order;

import java.util.List;

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

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	// 주문등록
	@GetMapping("/order_reg")
	public String order_reg(@RequestParam("menu_idx") String menu_idx,
			Model model) {
		model.addAttribute("menu_idx", menu_idx);
		
		return "input/order";
	}
	// 거래처조회
	@GetMapping("/client_list")
	public String client_list(ClientBean clientBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		List<ClientBean> ClientList = orderService.getClientList(clientBean);
		model.addAttribute("ClientList", ClientList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "order/client_list";
	}
	// 주문승인(미승인)
	@GetMapping("/order_approve")
	public String order_approve(OrderBean orderBean,
								@RequestParam("menu_idx") String menu_idx,
								Model model) {
		
		List<OrderBean> UnapprovedOrderList = orderService.getUnapprovedOrderList(orderBean);
		model.addAttribute("UnapprovedOrderList", UnapprovedOrderList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "order/order_approve";
	}
	// 주문조회(전체)
	@GetMapping("/order_list")
	public String order_list(OrderBean orderBean,
							@RequestParam("menu_idx") String menu_idx,
							Model model) {
		
		List<OrderBean> ApprovedOrderList = orderService.getApprovedOrderList(orderBean);
		model.addAttribute("ApprovedOrderList", ApprovedOrderList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "order/order_list";
	}
	
}
