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
	
	// 주문승인(미승인->승인)
	public void approveOrder(String order_idx) {
		sqlSessionTemplate.update("produce.approveOrder", order_idx);
	}
	// 주문승인(미승인->거절)
	public void refuseOrder(String order_idx) {
		sqlSessionTemplate.update("produce.refuseOrder", order_idx);
	}
	// 주문승인(미승인->전체승인)
	public void approveAllOrder(ProduceBean approveOrderBean) {
		sqlSessionTemplate.update("produce.approveAllOrder", approveOrderBean);
	}
	// 주문승인(미승인->전체거절)
	public void refuseAllOrder(ProduceBean approveOrderBean) {
		sqlSessionTemplate.update("produce.refuseAllOrder", approveOrderBean);
	}
	//작업지시서
	public List<ProduceBean> getOrderworkList(ProduceBean produceBean) {
		return sqlSessionTemplate.selectList("produce.getOrderworkList");
	}
	// 작업지시서에서 작업요청 -> produce_table에 insert
	public void addProduceInfo(ProduceBean orderWorkBean) {
		sqlSessionTemplate.insert("produce.addProduceInfo", orderWorkBean);
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
	public int getContentCnt() {
		return sqlSessionTemplate.selectOne("produce.getContentCnt");
	}
}
