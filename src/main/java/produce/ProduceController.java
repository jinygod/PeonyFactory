package produce;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	// 작업지시서
	@GetMapping("/produce_orderwork")
	public String produce_orderwork(@ModelAttribute("orderWorkBean") ProduceBean orderWorkBean,
									ProduceBean produceBean, ProcessBean processListBean,
							   		@RequestParam("menu_idx") String menu_idx,
							   		@RequestParam(value = "page", defaultValue = "1") int page,
							   		Model model) {
		
		List<ProduceBean> OrderWorkList = produceService.getOrderworkList(produceBean, page);
		List<ProcessBean> ProcessList = processService.getProcessList(processListBean);
		model.addAttribute("ProcessList", ProcessList);
		model.addAttribute("OrderWorkList", OrderWorkList);
		model.addAttribute("menu_idx", menu_idx);
		
		PageBean pageBean = produceService.getOrderworkContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("page", page);
		
		return "produce/produce_orderwork";
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
		
		PageBean pageBean = produceService.getProduceContentCnt(page);
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
	@RequestMapping(value="/request")
	public String request(HttpServletRequest request,
						  @RequestParam("menu_idx") String menu_idx, Model model) {
			
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size; i++) {
			produceService.updateOrderworkStatus(ajaxMsg[i]);
			produceService.addProduceInfo(ajaxMsg[i]);
			produceService.updateProcessRate(ajaxMsg[i]);
		}
		
		model.addAttribute("menu_idx", menu_idx);
		return "redirect:produce_orderwork";
	}
}