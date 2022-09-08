package main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	public MainBean getMainResult(MainBean mainBean){
		return mainDao.getMainResult(mainBean);
	}
}
