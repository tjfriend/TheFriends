package board.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ContentService {
	@Autowired
	SqlSessionFactory fac;
	
	public List Content(int num){
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List li = sql.selectList("freeboard.freeboarddetails",map);
		return li;
	}
}
