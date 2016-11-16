package friends.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class FriendsService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	DistanceService ds;
	
	public List friends(String id, int p){
		int endpage = 10*p;
		int startpage = endpage-9;
		SqlSession ss = fac.openSession();
		Map map1 = new HashMap();
		map1.put("id", id);
		map1.put("start", startpage);
		map1.put("end", endpage);
		List<HashMap> list = ss.selectList("member.friends", map1);
		for(HashMap map : list){
			double distance = ds.distance(id, (String)map.get("FRIEND"));
			HashMap map2 = new HashMap();
			map2.put("friend", (String)map.get("FRIEND"));
			map2.put("distance", distance);
			ss.update("member.distance", map2);
		}
		ss.commit();
		list = ss.selectList("member.friends", map1);
		ss.close();
		return list;
	}
}
