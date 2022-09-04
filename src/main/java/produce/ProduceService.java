package produce;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import order.OrderBean;
import process.PageBean;

@Service
public class ProduceService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	@Autowired
	private ProduceDao produceDao;
	
	public void addOrderworkInfo(ProduceBean approveOrderBean) {
		produceDao.addOrderworkInfo(approveOrderBean);
	}
	
	public void addOrderchkInfo(ProduceBean approveOrderBean) {
		produceDao.addOrderchkInfo(approveOrderBean);
	}
	
	// 주문승인(미승인->승인)
	public void approveOrder(ProduceBean approveProduceBean) {
		produceDao.approveOrder(approveProduceBean);
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
	public List<ProduceBean> getProducestatusList(ProduceBean produceBean, int page) {
		
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return produceDao.getProducestatusList(produceBean, rowBounds);
	}
	public void updateProduceStatus(ProduceBean produceStatusBean) {
		produceDao.updateProduceStatus(produceStatusBean);
	}
	public PageBean getContentCnt(int currentPage) {
		
		int content_cnt = produceDao.getContentCnt();
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
}
