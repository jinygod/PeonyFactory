package input.process;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProcessDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void addProcessInfo(ProcessBean processInfoBean) {
		sqlSessionTemplate.insert("process.addProcessInfo", processInfoBean);
	}
	
}
