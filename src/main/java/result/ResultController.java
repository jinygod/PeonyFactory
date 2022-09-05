package result;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import produce.ProduceBean;

@Controller
@RequestMapping("/result")
public class ResultController {
	
	@Autowired
	private ResultService resultService;
	
	@GetMapping("/result_process_list")
	public String result_process_list(ProduceBean produceBean,
									  @RequestParam("menu_idx") String menu_idx,
									  Model model) {
		
		List<ProduceBean> ResultProcess07List = resultService.getResultProcess07List(produceBean);
		List<ProduceBean> ResultProcess08List = resultService.getResultProcess08List(produceBean);
		List<ProduceBean> ResultProcess09List = resultService.getResultProcess09List(produceBean);
		model.addAttribute("ResultProcess07List", ResultProcess07List);
		model.addAttribute("ResultProcess08List", ResultProcess08List);
		model.addAttribute("ResultProcess09List", ResultProcess09List);
		model.addAttribute("menu_idx", menu_idx);
		
		return "result/result_process_list";
	}

}
