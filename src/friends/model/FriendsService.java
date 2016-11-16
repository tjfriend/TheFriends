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
	
	public List friends2(String id, int p, String range){
		int endpage = 10*p;
		int startpage = endpage-9;
		SqlSession ss = fac.openSession();
		Map map1 = new HashMap();
		map1.put("id", id);
		map1.put("start", startpage);
		map1.put("end", endpage);
		List<HashMap> list = new Vector<>();
		if(range.equals("방문자순")){
			list = ss.selectList("member.friendsV", map1);
		} else if(range.equals("거리순")){
			list = ss.selectList("member.friendsD", map1);
		} else if(range.equals("이름순")){
			list = ss.selectList("member.friends", map1);
		}
		ss.commit();
		ss.close();
		
		List<Object[]> list2 = new Vector<>();
		for(int i=0; i<list.size(); i++){
			HashMap map = list.get(i);
			Object[] ar = new Object[]{map.get("RNUM")+","+map.get("NICKNAME")+","+map.get("DISTANCE")+","+map.get("VISIT")
															+","+map.get("FRIEND")+","+map.get("ID")+","+map.get("BIRTH")};
			list2.add(ar);
		}
		return list;
	}
}
