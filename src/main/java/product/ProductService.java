package product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ProductService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	@Autowired
	private ProductDao productDao;

	public void addProductInfo(ProductBean productInfoBean) {
		productDao.addProductInfo(productInfoBean);
	}
	
	public List<ProductBean> getProductList(ProductBean productBean){
		return productDao.getProductList(productBean);
	}
	
	public void deleteProduct(String product_idx) {
		productDao.deleteProduct(product_idx);
	}
}
