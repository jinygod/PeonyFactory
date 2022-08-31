package input.process;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import input.order.OrderBean;

@Service
public class ProcessService {
	
	@Autowired
	private ProcessDao processDao;

	public void addProcessInfo(ProcessBean processInfoBean) {
		processDao.addProcessInfo(processInfoBean);
	}
	
	public List<ProcessBean> getProcessList(){
		return processDao.getProcessList();
	}
}
