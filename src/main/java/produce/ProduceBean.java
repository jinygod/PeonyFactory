package produce;

public class ProduceBean {
	
	private String order_idx;
	private String order_status;
	private String product_idx;
	private String product_modelno;
	private String order_regdate;
	private String order_deadline;
	private String order_exdate;
	private String order_cnt;
	private String order_unit;
	private String order_unit_price;
	private String order_amt;
	private String order_date;
	
	private String process_name;
	private String orderwork_idx;
	private String orderwork_date;
	private String orderwork_status;
	
	// 생산수량, 진행률
	private int produce_cnt;
	private int produce_rate;
	
	// 생산수량, 생산진행률 초깃값
	public ProduceBean() {
		this.produce_cnt = 0;
		this.produce_rate = 0;
	}
	
	public String getOrder_idx() {
		return order_idx;
	}
	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getProduct_idx() {
		return product_idx;
	}
	public void setProduct_idx(String product_idx) {
		this.product_idx = product_idx;
	}
	public String getProduct_modelno() {
		return product_modelno;
	}
	public void setProduct_modelno(String product_modelno) {
		this.product_modelno = product_modelno;
	}
	public String getOrder_regdate() {
		return order_regdate;
	}
	public void setOrder_regdate(String order_regdate) {
		this.order_regdate = order_regdate;
	}
	public String getOrder_deadline() {
		return order_deadline;
	}
	public void setOrder_deadline(String order_deadline) {
		this.order_deadline = order_deadline;
	}
	public String getOrder_exdate() {
		return order_exdate;
	}
	public void setOrder_exdate(String order_exdate) {
		this.order_exdate = order_exdate;
	}
	public String getOrder_cnt() {
		return order_cnt;
	}
	public void setOrder_cnt(String order_cnt) {
		this.order_cnt = order_cnt;
	}
	public String getOrder_unit() {
		return order_unit;
	}
	public void setOrder_unit(String order_unit) {
		this.order_unit = order_unit;
	}
	public String getOrder_unit_price() {
		return order_unit_price;
	}
	public void setOrder_unit_price(String order_unit_price) {
		this.order_unit_price = order_unit_price;
	}
	public String getOrder_amt() {
		return order_amt;
	}
	public void setOrder_amt(String order_amt) {
		this.order_amt = order_amt;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	public String getProcess_name() {
		return process_name;
	}
	public void setProcess_name(String process_name) {
		this.process_name = process_name;
	}
	public String getOrderwork_idx() {
		return orderwork_idx;
	}
	public void setOrderwork_idx(String orderwork_idx) {
		this.orderwork_idx = orderwork_idx;
	}
	public String getOrderwork_date() {
		return orderwork_date;
	}
	public void setOrderwork_date(String orderwork_date) {
		this.orderwork_date = orderwork_date;
	}
	
	public String getOrderwork_status() {
		return orderwork_status;
	}

	public void setOrderwork_status(String orderwork_status) {
		this.orderwork_status = orderwork_status;
	}

	public int getProduce_cnt() {
		return produce_cnt;
	}
	public void setProduce_cnt(int produce_cnt) {
		this.produce_cnt = produce_cnt;
	}
	
	public int getProduce_rate() {
		return produce_rate;
	}
	public void setProduce_rate(int produce_rate) {
		this.produce_rate = produce_rate;
	}

	
}
