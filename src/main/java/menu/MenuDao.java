package menu;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.softcampus.beans.BoardInfoBean;

@Repository
public class MenuDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// mapper 안에 들어있는 namespace.id 넣어줌
	public List<BoardInfoBean> getTopMenuList(){
		List<BoardInfoBean> topMenuList = sqlSessionTemplate.selectList("topmenu.get_topmenu_list");
		return topMenuList;
}
