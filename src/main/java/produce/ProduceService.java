package produce;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import process.PageBean;

@Service
public class ProduceService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	@Autowired
	private ProduceDao produceDao;
	
	public void addOrderworkInfo(String order_idx) {
		produceDao.addOrderworkInfo(order_idx);
	}
	
	public void addOrderchkInfo(ProduceBean approveOrderBean) {
		produceDao.addOrderchkInfo(approveOrderBean);
	}
	// 작업지시서
	public List<ProduceBean> getOrderworkList(ProduceBean produceBean, int page){
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		return produceDao.getOrderworkList(produceBean, rowBounds);
	}
	// produce_table insert
	public void addProduceInfo(String orderwork_idx) {
		produceDao.addProduceInfo(orderwork_idx);
	}
	// produce_table에 생산율 업데이트
	public void updateProcessRate(String orderwork_idx) {
		produceDao.updateProcessRate(orderwork_idx);
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
	public PageBean getProduceContentCnt(int currentPage) {
		
		int content_cnt = produceDao.getProduceContentCnt();
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
	public PageBean getOrderworkContentCnt(int currentPage) {
		
		int content_cnt = produceDao.getOrderworkContentCnt();
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
}
