package order;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import client.ClientBean;
import menu.MenuBean;

@Repository
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 메뉴정보(index)
	public String getMenuInfo(MenuBean menuBean) {
		return sqlSessionTemplate.selectOne("menu.getMenuInfo", menuBean);
	}
	
	// 주문번호 자동시퀀스생성하여 보이기
	public Integer getOrderSeq(OrderBean orderBean) {
		return sqlSessionTemplate.selectOne("order.getOrderSeq", orderBean);
	}
	
	// 주문등록
	public void addOrderInfo(OrderBean orderInfoBean) {
		sqlSessionTemplate.insert("order.addOrderInfo", orderInfoBean);
	}
	
	// 거래처조회
	public List<ClientBean> getClientList(ClientBean clientBean) {
		return sqlSessionTemplate.selectList("order.getClientList", clientBean);
	}
	// 주문승인(미승인)
	public List<OrderBean> getUnapprovedOrderList(OrderBean orderBean) {
		return sqlSessionTemplate.selectList("order.getUnapprovedOrderList", orderBean);
	}
	// 주문조회(승인완료)
	public List<OrderBean> getApprovedOrderList(OrderBean orderBean, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("order.getApprovedOrderList", orderBean, rowBounds);
	}
	
	// 페이징처리
	public int getContentCnt() {
		return sqlSessionTemplate.selectOne("order.getContentCnt");
	}
	
}
