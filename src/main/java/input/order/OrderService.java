package input.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import input.client.ClientBean;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;

	public void addOrderInfo(OrderBean orderInfoBean) {
		orderDao.addOrderInfo(orderInfoBean);
	}
	
	public List<OrderBean> getOrderList(){
		return orderDao.getOrderList();
	}
}
