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
	
	public List friends(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.friends", id);
		for(HashMap map : list){
			double distance = ds.distance(id, (String)map.get("NAME"));
			Map map2 = new HashMap();
			map2.put("friend", (String)map.get("NAME"));
			map2.put("distance", distance);
			int a = ss.update("member.distance", map2);
			if(a==1){
			}
		}
		ss.commit();
		list = ss.selectList("member.friends", id);
		ss.close();
		return list;
	}
}
