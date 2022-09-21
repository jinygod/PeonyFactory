package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.MainBean;
import main.MainService;
import menu.MenuBean;
import menu.MenuService;

@Controller
public class MainController {

	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MainService mainService;
	
	@GetMapping("/main")
	public String main(MainBean mainBean, Model model) {
		
		List<MenuBean> MenuList = menuService.getMenuInfo();
		MainBean MainResult = mainService.getMainResult(mainBean);
		
		model.addAttribute("MenuList", MenuList);
		model.addAttribute("MainResult", MainResult);
		
		return "main";
	}
}
