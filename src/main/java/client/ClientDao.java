package client;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ClientDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void addClientInfo(ClientBean clientInfoBean) {
		sqlSessionTemplate.insert("client.addClientInfo", clientInfoBean);
	}

	public void deleteClient(String client_idx) {
		sqlSessionTemplate.delete("client.deleteClient", client_idx);
	}


}
