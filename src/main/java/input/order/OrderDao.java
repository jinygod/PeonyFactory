package input.order;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import input.client.ClientBean;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addOrderInfo(OrderBean orderInfoBean) {
		sqlSessionTemplate.insert("order.addOrderInfo", orderInfoBean);
	}
	
	public List<OrderBean> getOrderList() {
		return sqlSessionTemplate.selectList("client.getOrderList");
	}
}
