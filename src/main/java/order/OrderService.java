package order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import client.ClientBean;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;

	// 주문등록
	public void addOrderInfo(OrderBean orderInfoBean) {
		orderDao.addOrderInfo(orderInfoBean);
	}
	// 거래처조회
	public List<ClientBean> getClientList(ClientBean clientBean){
		return orderDao.getClientList(clientBean);
	}
	// 주문승인(미승인)
	public List<OrderBean> getUnapprovedOrderList(OrderBean orderBean){
		return orderDao.getUnapprovedOrderList(orderBean);
	}
	// 주문조회(승인완료)
	public List<OrderBean> getApprovedOrderList(OrderBean orderBean){
		return orderDao.getApprovedOrderList(orderBean);
	}
	
}
