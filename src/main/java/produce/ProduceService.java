package produce;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import order.OrderBean;

@Service
public class ProduceService {
	
	@Autowired
	private ProduceDao produceDao;
	
	public void addOrderworkInfo(ProduceBean approveOrderBean) {
		produceDao.addOrderworkInfo(approveOrderBean);
	}
	
	// 주문승인(미승인->승인)
	public void approveOrder(String produce_idx) {
		produceDao.approveOrder(produce_idx);
	}

	// 주문승인(미승인->거절)
	public void refuseOrder(String produce_idx) {
		produceDao.refuseOrder(produce_idx);
	}

	// 주문승인(미승인->전체승인)
	public void approveAllOrder(ProduceBean approveProduceBean) {
		produceDao.approveAllOrder(approveProduceBean);
	}

	// 주문승인(미승인->전체거절)
	public void refuseAllOrder(ProduceBean approveProduceBean) {
		produceDao.refuseAllOrder(approveProduceBean);
	}
	// 작업지시서
	public List<ProduceBean> getOrderworkList(ProduceBean produceBean){
		
		return produceDao.getOrderworkList(produceBean);
	}
	// produce_table insert
	public void addProduceInfo(ProduceBean orderWorkBean) {
		produceDao.addProduceInfo(orderWorkBean);
	}
	// 작업지시서에서 작업요청 -> produce_table의 작업상태 '생산진행'으로 update
	public void updateOrderworkStatus(String orderwork_idx) {
		produceDao.updateOrderworkStatus(orderwork_idx);
	}
	// 생산현황조회
	public List<ProduceBean> getProducestatusList(ProduceBean produceBean) {
		return produceDao.getProducestatusList(produceBean);
	}
}
