package QnA.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
public class qnawrite {

	@Autowired
	SqlSessionFactory fac;

	public int write(String title, String content, String id, String category) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		map.put("category", category);
		
		try {
			SqlSession sql = fac.openSession();
			int rst = sql.insert("qna.question", map);
			
			sql.close();
			return rst;
		} catch (Exception e) {
			
			return -1;
		}
	}
}
