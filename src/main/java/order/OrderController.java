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
	// 주문조회(승인완료)
	@GetMapping("/order_list")
	public String order_list(OrderBean orderBean,
							@RequestParam("menu_idx") String menu_idx,
							Model model) {
		
		List<OrderBean> ApprovedOrderList = orderService.getApprovedOrderList(orderBean);
		model.addAttribute("ApprovedOrderList", ApprovedOrderList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "order/order_list";
	}
	// 주문승인(승인&거절)
	@PostMapping("/order_approve")
	public String order_approve(@ModelAttribute("approveOrderBean") OrderBean approveOrderBean,
								@RequestParam("order_approve") String order_approve,
								@RequestParam("order_idx") String order_idx,
								@RequestParam("menu_idx") String menu_idx,
								Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		model.addAttribute("order_idx", order_idx);
		
		System.out.println(order_idx);
		System.out.println(order_approve);
		
		if(order_approve.equals("승인")) {
			orderService.approveOrder(order_idx);
			return "redirect:/order/order_approve";
		} else if(order_approve.equals("거절")) {
			orderService.refuseOrder(order_idx);
			return "redirect:/order/order_approve";
		} else if(order_approve.equals("전체승인")) {
			orderService.approveAllOrder(approveOrderBean);
			return "redirect:/order/order_approve";
		} else if(order_approve.equals("전체거절")) {
			orderService.refuseAllOrder(approveOrderBean);
			return "redirect:/order/order_approve";
		}
		
		return "redirect:/order/order_approve";
	}
	
}
