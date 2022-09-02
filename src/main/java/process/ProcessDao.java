package process;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	
	public List<ProcessBean> getProcessList(ProcessBean processListBean) {
		return sqlSessionTemplate.selectList("process.getProcessList", processListBean);
	}
	
	public List<ProcessBean> getProcessInfo(ProcessBean processInfoBean, RowBounds rowBounds) {
		return sqlSessionTemplate.selectList("process.getProcessInfo", processInfoBean, rowBounds);
	}
	
	public int getContentCnt() {
		return sqlSessionTemplate.selectOne("process.getContentCnt");
	}
}
