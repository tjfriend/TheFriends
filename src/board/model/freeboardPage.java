package board.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.*;

@Component
public class freeboardPage {
	

	@Autowired
	SqlSessionFactory fac;
	
	public List GetRnage(int p){ // p = page
		
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap<String, Integer> map = new HashMap<>();
			map.put("start", startpage);
			map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("freeboard.pageNum",map);
		sql.close();
		return li;
	}
	
	public int size(){ 	// ������ ����
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("freeboard.pagesize");
		int psize = size % 10 == 0? size/10 : size/10+1;
	
		return psize;
	}
}
