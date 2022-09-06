package result;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResultDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ResultBean getResultProcessList(ResultBean resultBean) {
		return sqlSessionTemplate.selectOne("result.getResultProcessList", resultBean);
	}
	
	public List<ResultBean> getResultProcessSummary(ResultBean resultBean) {
		return sqlSessionTemplate.selectList("result.getResultProcessSummary", resultBean);
	}
	
	public ResultBean getResultProductTotalCnt(ResultBean resultBean) {
		return sqlSessionTemplate.selectOne("result.getResultProductTotalCnt", resultBean);
	}
	
	public List<ResultBean> getResultProductTotalSummary(ResultBean resultBean) {
		return sqlSessionTemplate.selectList("result.getResultProductTotalSummary", resultBean);
	}
}
