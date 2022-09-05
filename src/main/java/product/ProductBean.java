package product;

import javax.validation.constraints.NotEmpty;

public class ProductBean {
	
	@NotEmpty
	private String product_idx;
	@NotEmpty
	private String product_div;
	@NotEmpty
	private String product_modelno;
	@NotEmpty
	private String product_name;
	@NotEmpty
	private String product_size;  
	@NotEmpty
	private String product_unit; 
	@NotEmpty
	private String product_info;
	
	public String getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_div() {
		return product_div;
	}
	public void setProduct_div(String product_div) {
		this.product_div = product_div;
	}
	public String getProduct_modelno() {
		return product_modelno;
	}
	public void setProduct_modelno(String product_modelno) {
		this.product_modelno = product_modelno;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_size() {
		return product_size;
	}
	public void setProduct_size(String product_size) {
		this.product_size = product_size;
	}
	public String getProduct_unit() {
		return product_unit;
	}
	public void setProduct_unit(String product_unit) {
		this.product_unit = product_unit;
	}
	public String getProduct_info() {
		return product_info;
	}
	public void setProduct_info(String product_info) {
		this.product_info = product_info;
	}
	
}
