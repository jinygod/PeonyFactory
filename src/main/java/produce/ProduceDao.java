package produce;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProduceDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addOrderworkInfo(String order_idx) {
		sqlSessionTemplate.insert("produce.addOrderworkInfo", order_idx);
	}
	
	public void addOrderchkInfo(ProduceBean approveOrderBean) {
		sqlSessionTemplate.insert("produce.addOrderchkInfo", approveOrderBean);
	}
	//작업지시서
	public List<ProduceBean> getOrderworkList(ProduceBean produceBean, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("produce.getOrderworkList", produceBean, rowBounds);
	}
	// 작업지시서에서 작업요청 -> produce_table에 insert
	public void addProduceInfo(String orderwork_idx) {
		sqlSessionTemplate.insert("produce.addProduceInfo", orderwork_idx);
	}
	// produce_table 생산율 계산 후 업데이트
	public void updateProcessRate(String orderwork_idx) {
		sqlSessionTemplate.update("produce.updateProcessRate", orderwork_idx);
	}
	// 작업지시서에서 작업요청 -> produce_table의 작업상태 '생산진행'으로 update
	public void updateOrderworkStatus(String orderwork_idx) {
		sqlSessionTemplate.update("produce.updateOrderworkStatus", orderwork_idx);
	}
	// 생산현황조회
	public List<ProduceBean> getProducestatusList(ProduceBean produceBean, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("produce.getProducestatusList", produceBean, rowBounds);
	}
	// produce_table에서 입력완료 -> 수량 및 생산상태 update
	public void updateProduceStatus(ProduceBean produceStatusBean) {
		sqlSessionTemplate.update("produce.updateProduceStatus", produceStatusBean);
	}
	public int getProduceContentCnt() {
		return sqlSessionTemplate.selectOne("produce.getProduceContentCnt");
	}
	public int getOrderworkContentCnt() {
		return sqlSessionTemplate.selectOne("produce.getOrderworkContentCnt");
	}
}
