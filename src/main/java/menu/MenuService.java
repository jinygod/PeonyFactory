package menu;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {

	@Autowired
	private MenuDao MenuDao;
	
	public List<MenuBean> getMenuInfo(){
		
		List<MenuBean> MenuList = MenuDao.getMenuInfo();
		return MenuList;
	}
	
}
