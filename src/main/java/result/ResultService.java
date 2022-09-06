package result;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResultService {

	@Autowired
	private ResultDao resultDao;
	

	// 생산현황조회
	public ResultBean getResultProcessList(ResultBean resultBean) {
		
		return resultDao.getResultProcessList(resultBean);
	}
	
	// 에러현황테이블
	public List<ResultBean> getResultProcessSummary(ResultBean resultBean) {
		
		return resultDao.getResultProcessSummary(resultBean);
	}
	
	// 품목별 총 생산량 조회
	public ResultBean getResultProductTotalCnt(ResultBean resultBean) {
		
		return resultDao.getResultProductTotalCnt(resultBean);
	}
	
	// 품목별 생산량 관련 테이블
	public List<ResultBean> getResultProductTotalSummary(ResultBean resultBean) {
		
		return resultDao.getResultProductTotalSummary(resultBean);
	}
}
