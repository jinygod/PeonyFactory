package produce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order.OrderBean;

@Service
public class ProduceService {
	
	@Autowired
	private ProduceDao produceDao;
	
	public List<OrderBean> getOrderworkList(OrderBean orderBean){
		return produceDao.getOrderworkList(orderBean);
	}
	
	public void addOrderworkInfo(OrderBean orderWorkBean) {
		produceDao.addOrderworkInfo(orderWorkBean);
	}
}
