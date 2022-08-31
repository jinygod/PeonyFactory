package input.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	
	@Autowired
	private OrderDao orderDao;

	public void addOrderInfo(OrderBean orderInfoBean) {
		orderDao.addOrderInfo(orderInfoBean);
	}
}
