package input.client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/menu/input")
public class ClientController {
	
	@Autowired
	private ClientService clientService;
	
	@GetMapping("/client")
	public String input_client(@ModelAttribute("clientInfoBean") ClientBean clientInfoBean) {
		return "menu/input/client";
	}
	
	@PostMapping("/client_pro")

	public String client_pro(@ModelAttribute("clientInfoBean") ClientBean clientInfoBean) {
		
		clientService.addClientInfo(clientInfoBean);
		
		return "menu/input/client";
	}
	


	
}
