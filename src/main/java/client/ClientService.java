package client;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientService {
	
	@Autowired
	private ClientDao clientDao;

	public void addClientInfo(ClientBean clientInfoBean) {
		clientDao.addClientInfo(clientInfoBean);
	}
	

}
