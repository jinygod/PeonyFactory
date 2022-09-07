package order;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import client.ClientBean;
import menu.MenuBean;
import process.PageBean;
import produce.ProduceService;
import product.ProductBean;
import product.ProductService;
import user.UserBean;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProduceService produceService;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	// 주문등록
	@GetMapping("/order_reg")
	public String order_reg(@RequestParam("menu_idx") String menu_idx, OrderBean orderBean,
							ClientBean clientBean, ProductBean productBean,
							Model model) {
		
		// 주문번호 시퀀스 자동입력용
		Integer OrderSeq = orderService.getOrderSeq(orderBean);
		// 거래처정보(거래처코드 select옵션용)
		List<ClientBean> ClientList = orderService.getClientList(clientBean);
		// 품목정보(품목코드 select옵션용)
		List<ProductBean> ProductList = productService.getProductList(productBean);
		
		model.addAttribute("ProductList", ProductList);
		model.addAttribute("ClientList", ClientList);
		model.addAttribute("OrderSeq", OrderSeq);
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
								@RequestParam(value = "page", defaultValue = "1") int page,
								Model model) {
		
		List<OrderBean> UnapprovedOrderList = orderService.getUnapprovedOrderList(orderBean, page);
		model.addAttribute("UnapprovedOrderList", UnapprovedOrderList);
		model.addAttribute("menu_idx", menu_idx);
		
		PageBean pageBean = orderService.getOrderApproveContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		
		return "order/order_approve";
	}
	// 주문조회(전체)
	@GetMapping("/order_list")
	public String order_list(OrderBean orderBean, MenuBean menuBean,
							@RequestParam("menu_idx") String menu_idx,
							@RequestParam(value = "page", defaultValue = "1") int page,
							Model model) {

		List<OrderBean> OrderList = orderService.getOrderList(orderBean, page);
		model.addAttribute("OrderList", OrderList);
		model.addAttribute("menu_idx", menu_idx);
		
		PageBean pageBean = orderService.getOrderListContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		
		return "order/order_list";
	}
	
	@RequestMapping(value="/approve")
	public String approve(HttpServletRequest request,
						  @RequestParam("menu_idx") String menu_idx, Model model) {
			
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			orderService.approveOrder(ajaxMsg[i]);
			produceService.addOrderworkInfo(ajaxMsg[i]);
		}
		
		model.addAttribute("menu_idx", menu_idx);
		return "redirect:order_approve";
	}
	@RequestMapping(value="/refuse")
	public String refuse(HttpServletRequest request,
						 @RequestParam("menu_idx") String menu_idx, Model model) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			orderService.refuseOrder(ajaxMsg[i]);
		}
		
		model.addAttribute("menu_idx", menu_idx);
		return "redirect:order_approve";
	}
}
