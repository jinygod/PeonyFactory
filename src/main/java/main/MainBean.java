package main;

public class MainBean {

	private String order_amt;
	private String produce_cnt;
	private double produce_badrate;
	
	public String getOrder_amt() {
		return order_amt;
	}
	public void setOrder_amt(String order_amt) {
		this.order_amt = order_amt;
	}
	public String getProduce_cnt() {
		return produce_cnt;
	}
	public void setProduce_cnt(String produce_cnt) {
		this.produce_cnt = produce_cnt;
	}
	public double getProduce_badrate() {
		return produce_badrate;
	}
	public void setProduce_badrate(double produce_badrate) {
		this.produce_badrate = produce_badrate;
	}
}
