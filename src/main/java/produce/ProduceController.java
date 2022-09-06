package produce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import process.PageBean;
import process.ProcessBean;
import process.ProcessService;

@Controller
@RequestMapping("/produce")
public class ProduceController {
	
	@Autowired
	private ProduceService produceService;
	
	@Autowired
	private ProcessService processService;
	
	// 주문승인 -> orderwork_table에 insert
	@PostMapping("/orderwork_insert")
	public String orderwork_insert(@ModelAttribute("approveOrderBean") ProduceBean approveOrderBean,
								   @RequestParam("order_approve") String order_approve,
								   @RequestParam("order_idx") String order_idx,
							   	   @RequestParam("menu_idx") String menu_idx,
							   	   Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		model.addAttribute("order_idx", order_idx);
		
		if(order_approve.equals("승인")) {
			produceService.approveOrder(order_idx);
			produceService.addOrderworkInfo(approveOrderBean);
			return "redirect:/order/order_approve";
		} else if(order_approve.equals("거절")) {
			produceService.refuseOrder(order_idx);
			return "redirect:/order/order_approve";
		} else if(order_approve.equals("전체승인")) {
//			produceService.addOrderchkInfo(approveOrderBean);
			produceService.approveAllOrder(approveOrderBean);
			produceService.addOrderworkInfo(approveOrderBean);
			return "redirect:/order/order_approve";
		} else if(order_approve.equals("전체거절")) {
			produceService.refuseAllOrder(approveOrderBean);
			return "redirect:/order/order_approve";
		}
		
		return "redirect:/order/order_approve";
	}
	
	// 작업지시서
	@GetMapping("/produce_orderwork")
	public String produce_orderwork(@ModelAttribute("orderWorkBean") ProduceBean orderWorkBean,
									ProduceBean produceBean, ProcessBean processListBean,
							   		@RequestParam("menu_idx") String menu_idx,
							   		Model model) {
		
		List<ProduceBean> OrderWorkList = produceService.getOrderworkList(produceBean);
		List<ProcessBean> ProcessList = processService.getProcessList(processListBean);
		model.addAttribute("ProcessList", ProcessList);
		model.addAttribute("OrderWorkList", OrderWorkList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "produce/produce_orderwork";
	}
	
	@PostMapping("/produce_orderwork_pro")
	public String produce_orderwork_pro(@ModelAttribute("orderWorkBean") ProduceBean orderWorkBean,
										@RequestParam("orderwork_idx") String orderwork_idx,
										@RequestParam("menu_idx") String menu_idx,
										Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		model.addAttribute("orderwork_idx", orderwork_idx);
		
		produceService.updateOrderworkStatus(orderwork_idx);
		produceService.addProduceInfo(orderWorkBean);
		
		return "redirect:/produce/produce_orderwork";
	}
	
	@GetMapping("/produce_status")
	public String produce_status(@ModelAttribute("produceStatusBean")ProduceBean produceStatusBean,
								 ProduceBean produceBean,
							 	 @RequestParam("menu_idx") String menu_idx,
							 	@RequestParam(value = "page", defaultValue = "1") int page,
								 Model model) {
		
		List<ProduceBean> ProduceStatusList = produceService.getProducestatusList(produceBean, page);
		model.addAttribute("menu_idx", menu_idx);
		model.addAttribute("ProduceStatusList", ProduceStatusList);
		
		PageBean pageBean = produceService.getContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		
		model.addAttribute("page", page);
		
		return "produce/produce_status";
	}
	
	@PostMapping("/produce_status_pro")
	public String produce_status_pro(@ModelAttribute("produceStatusBean")ProduceBean produceStatusBean,
								 	 @RequestParam("menu_idx") String menu_idx,
									 Model model) {

		produceService.updateProduceStatus(produceStatusBean);
		model.addAttribute("menu_idx", menu_idx);	
		
		return "redirect:/produce/produce_status";
	}
}