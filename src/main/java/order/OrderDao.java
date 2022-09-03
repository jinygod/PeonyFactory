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
	
}
