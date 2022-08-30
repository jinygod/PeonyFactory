package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import menu.MenuBean;
import menu.MenuService;

@Controller
public class MainController {

	@Autowired
	private MenuService menuService;
	
	@GetMapping("/main")
	public String main(Model model) {
		
		List<MenuBean> MenuList = menuService.getMenuInfo();
		
		model.addAttribute("MenuList", MenuList);
		
		return "main";
	}
}
