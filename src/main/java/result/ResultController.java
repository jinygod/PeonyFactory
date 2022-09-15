package result;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/result")
public class ResultController {
	
	@Autowired
	private ResultService resultService;
	
	@GetMapping("/result_total_produce")
	public String result_total_produce(ResultBean resultBean,
									  @RequestParam("menu_idx") String menu_idx,
									  Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		
		return "result/result_total_produce";
	}

	@GetMapping("/result_process_error")
	public String result_process_error(ResultBean resultBean,
									  @RequestParam("menu_idx") String menu_idx,
									  Model model) {
		
		ResultBean ResultProcess = resultService.getResultProcessList(resultBean);
		List<ResultBean> ResultProcessSummary = resultService.getResultProcessSummary(resultBean);
		model.addAttribute("ResultProcess", ResultProcess);
		model.addAttribute("ResultProcessSummary", ResultProcessSummary);
		
		model.addAttribute("menu_idx", menu_idx);
		return "result/result_process_error";
	}
	
	@GetMapping("/result_product_total")
	public String result_product_total(ResultBean resultBean,
										@RequestParam("menu_idx") String menu_idx,
										Model model) {
		
		
		List<ResultBean> ResultProductTotalSummary = resultService.getResultProductTotalSummary(resultBean);
		ResultBean ResultTotal = resultService.getResultProductTotalCnt(resultBean);

		
		model.addAttribute("ResultProductTotalSummary", ResultProductTotalSummary);
		model.addAttribute("ResultTotal", ResultTotal);
		model.addAttribute("menu_idx", menu_idx);
		return "result/result_product_total";
	}
	
	@GetMapping("/result_report")
	public String result_report(@RequestParam("menu_idx") String menu_idx, Model model) {
		model.addAttribute("menu_idx", menu_idx);
		return "result/result_report";
	}
	
	@GetMapping("/result_report_data")
	public String result_report_data(@RequestParam("menu_idx") String menu_idx,
									ResultBean resultBean, Model model) {
		
		List<ResultBean> ResultProductTotalSummary = resultService.getResultProductTotalSummary(resultBean);
		ResultBean ResultTotal = resultService.getResultProductTotalCnt(resultBean);

		model.addAttribute("menu_idx", menu_idx);
		model.addAttribute("ResultProductTotalSummary", ResultProductTotalSummary);
		model.addAttribute("ResultTotal", ResultTotal);
		
		return "result/result_report_data";
	}
	
	@GetMapping("/result_report_write")
	public String result_report_write(@RequestParam("menu_idx") String menu_idx,
										ResultBean resultBean, Model model) {
		List<ResultBean> ResultProductTotalSummary = resultService.getResultProductTotalSummary(resultBean);
		ResultBean ResultTotal = resultService.getResultProductTotalCnt(resultBean);
		
		model.addAttribute("menu_idx", menu_idx);
		model.addAttribute("ResultProductTotalSummary", ResultProductTotalSummary);
		model.addAttribute("ResultTotal", ResultTotal);
		return "result/result_report_write";
	}
	
	@GetMapping("/result_report_standard")
	public String result_report_standard(@RequestParam("menu_idx") String menu_idx, Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		return "result/result_report_standard";
	}
	
}
