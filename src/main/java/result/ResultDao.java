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
	
	// 07월 불량+손실수량 합계 select
	public List<ProduceBean> getResultProcess07List(ProduceBean produceBean) {
		return sqlSessionTemplate.selectList("result.getResultProcess07List", produceBean);
	}
	
	// 08월 불량+손실수량 합계 select
	public List<ProduceBean> getResultProcess08List(ProduceBean produceBean) {
		return sqlSessionTemplate.selectList("result.getResultProcess08List", produceBean);
	}
	
	// 09월 불량+손실수량 합계 select
	public List<ProduceBean> getResultProcess09List(ProduceBean produceBean) {
		return sqlSessionTemplate.selectList("result.getResultProcess09List", produceBean);
	}
	
}
