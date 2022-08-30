package menu;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@GetMapping("/menu")
	public String menu(@RequestParam("menu_idx") String menu_idx) {
		return "menu/menu";
		
	}
	
	@GetMapping("/input")
	public String input() {
		return "menu/input";
	}

}
