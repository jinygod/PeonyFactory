package input.process;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu/input")
public class ProcessController {
	
	@Autowired
	private ProcessService processService;
	
	@GetMapping("/process")
	public String input_process(@ModelAttribute("processInfoBean") ProcessBean processInfoBean) {
		return "menu/input/process";
	}
	
	@PostMapping("/process_pro")
	public String process_pro(@ModelAttribute("processInfoBean") ProcessBean processInfoBean) {
		
		processService.addProcessInfo(processInfoBean);
		
		return "menu/input/process_success";
	}
	

	
}
