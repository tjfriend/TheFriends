package board.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
public class freeboardwrite {

	@Autowired
	SqlSessionFactory fac;

	public int write(String title, String content, String id) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		System.out.println(title+"//"+id+"//"+content);
		
		try {
			SqlSession sql = fac.openSession();
			int rst = sql.insert("freeboard.write", map);
			
			sql.close();
			return rst;
		} catch (Exception e) {
			
			return -1;
		}
	}
}
