package notice.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class noticepage {
	

	@Autowired
	SqlSessionFactory fac;
	
	public List GetRnage(int p){ // p = page
		
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap<String, Integer> map = new HashMap<>();
			map.put("start", startpage);
			map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("notice.pageNum",map);
		sql.close();
		return li;
	}
	
	public int size(){ 	// 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("notice.pagesize");
		int psize = size % 10 == 0? size/10 : size/10+1;
	
		return psize;
	}
}