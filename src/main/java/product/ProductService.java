package product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Autowired
	private ProductDao productDao;

	public void addProductInfo(ProductBean productInfoBean) {
		productDao.addProductInfo(productInfoBean);
	}
	
	public List<ProductBean> getProductList(ProductBean productBean){
		return productDao.getProductList(productBean);
	}
}
