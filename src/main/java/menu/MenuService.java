package menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {

	@Autowired
	private MenuDao menuDao;
	
	public List<MenuBean> getMenuInfo(){
		
		List<MenuBean> MenuList = menuDao.getMenuInfo();
		
		return MenuList;
	}
	
	public List<MenuBean> getSubMenuInfo(String menu_idx){
		
		return menuDao.getSubMenuInfo(menu_idx);
	}
	
}
