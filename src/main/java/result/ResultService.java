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
	public List<ProduceBean> getResultProcess07List(ProduceBean produceBean) {
		
		return resultDao.getResultProcess07List(produceBean);
	}
	
	// 생산현황조회
	public List<ProduceBean> getResultProcess08List(ProduceBean produceBean) {
		
		return resultDao.getResultProcess08List(produceBean);
	}
	
	// 생산현황조회
	public List<ProduceBean> getResultProcess09List(ProduceBean produceBean) {
		
		return resultDao.getResultProcess09List(produceBean);
	}

}
