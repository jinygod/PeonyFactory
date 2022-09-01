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
	
	// 주문승인(미승인->승인)
	public void approveOrder(String order_idx) {
		orderDao.approveOrder(order_idx);
	}

	// 주문승인(미승인->거절)
	public void refuseOrder(String order_idx) {
		orderDao.refuseOrder(order_idx);
	}

	// 주문승인(미승인->전체승인)
	public void approveAllOrder(OrderBean approveOrderBean) {
		orderDao.approveAllOrder(approveOrderBean);
	}

	// 주문승인(미승인->전체거절)
	public void refuseAllOrder(OrderBean approveOrderBean) {
		orderDao.refuseAllOrder(approveOrderBean);
	}
}
