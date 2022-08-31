package menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/input")
	public String input() {
		return "menu/input";
	}

	@GetMapping("/submenu")
	public String submenu(@RequestParam("menu_idx") String menu_idx, Model model) {
		
		model.addAttribute("menu_idx", menu_idx);
		List<MenuBean> SubMenuList = menuService.getSubMenuInfo(menu_idx);
		model.addAttribute("SubMenuList", SubMenuList);
		
		return "menu/submenu";
	}
}
