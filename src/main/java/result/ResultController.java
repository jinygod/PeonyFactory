package result;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/result")
public class ResultController {
	
	@GetMapping("/result_product_list")
	public String result_product_list(@RequestParam("menu_idx") String menu_idx,
							   Model model) {
		
		return "result/result_product_list";
	}

}
