package order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import client.ClientBean;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 주문등록
	public void addOrderInfo(OrderBean orderInfoBean) {
		sqlSessionTemplate.insert("order.addOrderInfo", orderInfoBean);
	}
	
	// 거래처조회
	public List<ClientBean> getClientList(ClientBean clientBean) {
		return sqlSessionTemplate.selectList("order.getClientList", clientBean);
	}
	// 주문승인(미승인)
	public List<OrderBean> getUnapprovedOrderList(OrderBean orderBean) {
		return sqlSessionTemplate.selectList("order.getUnapprovedOrderList", orderBean);
	}
	// 주문조회(승인완료)
	public List<OrderBean> getApprovedOrderList(OrderBean orderBean) {
		return sqlSessionTemplate.selectList("order.getApprovedOrderList", orderBean);
	}
	
	// 주문승인(미승인->승인)
	public void approveOrder(String order_idx) {
		sqlSessionTemplate.update("order.approveOrder", order_idx);
	}
	// 주문승인(미승인->거절)
	public void refuseOrder(String order_idx) {
		sqlSessionTemplate.update("order.refuseOrder", order_idx);
	}
	// 주문승인(미승인->전체승인)
	public void approveAllOrder(OrderBean approveOrderBean) {
		sqlSessionTemplate.update("order.approveAllOrder", approveOrderBean);
	}
	// 주문승인(미승인->전체거절)
	public void refuseAllOrder(OrderBean approveOrderBean) {
		sqlSessionTemplate.update("order.refuseAllOrder", approveOrderBean);
	}
}
