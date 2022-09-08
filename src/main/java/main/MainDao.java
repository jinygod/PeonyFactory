package main;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MainBean getMainResult(MainBean mainBean){
		return sqlSessionTemplate.selectOne("main.getMainResult", mainBean);
}
	
}
