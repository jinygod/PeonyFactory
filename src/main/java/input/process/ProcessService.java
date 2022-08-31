package input.process;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProcessService {
	
	@Autowired
	private ProcessDao processDao;

	public void addProcessInfo(ProcessBean processInfoBean) {
		processDao.addProcessInfo(processInfoBean);
	}
}
