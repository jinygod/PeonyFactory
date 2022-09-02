package process;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.ProductBean;

@Controller
@RequestMapping("/process")
public class ProcessController {
	
	@Autowired
	private ProcessService processService;

	@GetMapping("/process_reg")
	public String process_reg(@RequestParam("menu_idx") String menu_idx,
							  Model model) {
		model.addAttribute("menu_idx", menu_idx);
		
		return "input/process";
	}
	
	@GetMapping("/process_list")
	public String process_list(ProcessBean processListBean,
							   @RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		List<ProcessBean> ProcessList = processService.getProcessList(processListBean);
		model.addAttribute("ProcessList", ProcessList);
		model.addAttribute("menu_idx", menu_idx);
		
		return "process/process_list";
	}
	
	@GetMapping("/process_info")
	public String process_info(ProcessBean processInfoBean,
							   @RequestParam("menu_idx") String menu_idx,
							   @RequestParam(value = "page", defaultValue = "1") int page,
							   Model model) {
		
		List<ProcessBean> ProcessInfo = processService.getProcessInfo(processInfoBean, page);
		model.addAttribute("ProcessInfo", ProcessInfo);
		model.addAttribute("menu_idx", menu_idx);
		
		PageBean pageBean = processService.getContentCnt(page);
		model.addAttribute("pageBean", pageBean);
		
		model.addAttribute("page", page);
		
		return "process/process_info";
	}
	
}
