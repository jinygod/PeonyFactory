package produce;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import order.OrderBean;

@Repository
public class ProduceDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<OrderBean> getOrderworkList(OrderBean orderBean) {
		return sqlSessionTemplate.selectList("produce.getOrderworkList");
	}
	
	public void addOrderworkInfo(OrderBean orderWorkBean) {
		sqlSessionTemplate.insert("produce.addOrderworkInfo", orderWorkBean);
	}
}
