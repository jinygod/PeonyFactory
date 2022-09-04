package order;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import client.ClientBean;
import menu.MenuBean;
import process.PageBean;

@Service
public class OrderService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	@Autowired
	private OrderDao orderDao;

	// 메뉴정보 불러오기(menuservice로 보낼 예정)
	public String getMenuInfo(MenuBean menuBean) {
		return orderDao.getMenuInfo(menuBean);
	}
	
	// 주문번호 시퀀스 생성(select)
	public Integer getOrderSeq(OrderBean orderBean) {
		return orderDao.getOrderSeq(orderBean);
	}
	
	// 주문등록
	public void addOrderInfo(OrderBean orderInfoBean) {
		orderDao.addOrderInfo(orderInfoBean);
	}
	// 거래처조회
	public List<ClientBean> getClientList(ClientBean clientBean){
		return orderDao.getClientList(clientBean);
	}
	// 주문승인(미승인)
	public List<OrderBean> getUnapprovedOrderList(OrderBean orderBean){
		return orderDao.getUnapprovedOrderList(orderBean);
	}
	
	// 주문조회(승인완료)
	public List<OrderBean> getApprovedOrderList(OrderBean orderBean, int page){
		
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return orderDao.getApprovedOrderList(orderBean, rowBounds);
	}
	
	public PageBean getContentCnt(int currentPage) {
		
		int content_cnt = orderDao.getContentCnt();
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
	
}
