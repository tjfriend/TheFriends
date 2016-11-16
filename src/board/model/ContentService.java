package board.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ContentService {
	@Autowired
	SqlSessionFactory fac;

	public List Content(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List li = sql.selectList("freeboard.freeboarddetails", map);
		sql.close();
		return li;
	}
	
	public int crystal(int num, String content, String category, String title){
		HashMap map = new HashMap<>();
			map.put("num", num);
			map.put("content", content);
			map.put("category", category);
			map.put("title", title);
		SqlSession sql = fac.openSession();
		int li = sql.update("freeboard.crystal", map);
		sql.close();
		return li;
	}
}
