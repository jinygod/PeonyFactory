package result;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import produce.ProduceBean;

@Repository
public class ResultDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 
	public List<ProduceBean> getResultProcessList(ProduceBean produceBean) {
		return sqlSessionTemplate.selectList("result.getResultProcessList", produceBean);
	}
	
}
