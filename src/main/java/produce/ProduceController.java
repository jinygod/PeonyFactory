package produce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import order.OrderBean;
import process.ProcessBean;
import process.ProcessService;

@Controller
@RequestMapping("/produce")
public class ProduceController {
	
	@Autowired
	private ProduceService produceService;
	
	@Autowired
	private ProcessService processService;
	
	
	@GetMapping("/produce_status")
	public String produce_status(@RequestParam("menu_idx") String menu_idx,
							  Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		
		return "produce/produce_status";
	}
	
	
	@GetMapping("/produce_orderwork")
	public String produce_orderwork(OrderBean orderBean, ProcessBean processListBean,
							   		@RequestParam("menu_idx") String menu_idx,
							   		Model model) {
		
		List<OrderBean> OrderWorkList = produceService.getOrderworkList(orderBean);
		List<ProcessBean> ProcessList = processService.getProcessList(processListBean);
		model.addAttribute("ProcessList", ProcessList);
		model.addAttribute("OrderWorkList", OrderWorkList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "produce/produce_orderwork";
	}
	
	@PostMapping("/orderwork_pro")
	public String orderwork_pro(OrderBean orderWorkBean,
								@RequestParam("menu_idx") String menu_idx,
								Model model) {
		
		System.out.println(orderWorkBean.getOrderwork_date().getClass().getName());
		
		produceService.addOrderworkInfo(orderWorkBean);
		
		return "produce/produce_orderwork";
	}
	
}