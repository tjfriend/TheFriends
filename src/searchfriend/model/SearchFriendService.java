package searchfriend.model;

import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SearchFriendService {
	@Autowired
	SqlSessionFactory fac;

	public List search(String find,String con) {
		SqlSession ss = fac.openSession();
		HashMap m = new HashMap<>();
		List map = new Vector<>();
		m.put("ctg", find);
		m.put("ctg2", "%"+con+"%");
		map = ss.selectList("searchfriend.search",m);
		ss.close();
		return map;
	}
}
