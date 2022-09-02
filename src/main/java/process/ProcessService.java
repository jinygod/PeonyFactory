package process;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ProcessService {
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	@Autowired
	private ProcessDao processDao;

	public void addProcessInfo(ProcessBean processInfoBean) {
		processDao.addProcessInfo(processInfoBean);
	}
	
	public List<ProcessBean> getProcessList(ProcessBean processListBean){
		return processDao.getProcessList(processListBean);
	}
	
	public List<ProcessBean> getProcessInfo(ProcessBean processInfoBean, int page){
		
		int start = (page - 1) * page_listcnt;
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		
		return processDao.getProcessInfo(processInfoBean, rowBounds);
	}
	public PageBean getContentCnt(int currentPage) {
		
		int content_cnt = processDao.getContentCnt();
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
}
