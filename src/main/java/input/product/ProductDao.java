package input.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import input.process.ProcessBean;

@Repository
public class ProductDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addProductInfo(ProductBean productInfoBean) {
		sqlSessionTemplate.insert("product.addProductInfo", productInfoBean);
	}
	
	public List<ProductBean> getProductList() {
		return sqlSessionTemplate.selectList("client.getProductList");
	}
}
