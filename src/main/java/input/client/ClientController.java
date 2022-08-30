package input.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu/input")
public class ClientController {
	
	@GetMapping("/client")
	public String input_client(@ModelAttribute("clientInfoBean") ClientBean clientInfoBean) {
		return "menu/input/client";
	}
	

	
}
