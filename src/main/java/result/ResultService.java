package result;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import produce.ProduceBean;

@Service
public class ResultService {

	@Autowired
	private ResultDao resultDao;
	

	// 생산현황조회
	public List<ProduceBean> getResultProcessList(ProduceBean produceBean) {
		
		return resultDao.getResultProcessList(produceBean);
	}

}
