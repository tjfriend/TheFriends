package notice.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class noticewrite {

	@Autowired
	SqlSessionFactory fac;

	public int write(String title, String content, String id) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		
		try {
			SqlSession sql = fac.openSession();
			int rst = sql.insert("notice.write", map);
			
			sql.close();
			return rst;
		} catch (Exception e) {
			
			return -1;
		}
	}
}
