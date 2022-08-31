package input.order;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addOrderInfo(OrderBean orderInfoBean) {
		sqlSessionTemplate.insert("order.addOrderInfo", orderInfoBean);
	}
	
}
