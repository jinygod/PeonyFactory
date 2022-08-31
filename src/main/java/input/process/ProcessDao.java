package input.process;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import input.order.OrderBean;

@Repository
public class ProcessDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addProcessInfo(ProcessBean processInfoBean) {
		sqlSessionTemplate.insert("process.addProcessInfo", processInfoBean);
	}
	
	public List<ProcessBean> getProcessList() {
		return sqlSessionTemplate.selectList("client.getProcessList");
	}
}
