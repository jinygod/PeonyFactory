package input.client;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import menu.MenuBean;


@Repository
public class ClientDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	

	public void addClientInfo(ClientBean clientInfoBean) {
		sqlSessionTemplate.insert("client.addClientInfo", clientInfoBean);
	}
	

}
