package friends.model;

import java.text.*;
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
//		for(HashMap map : list){			//테스트 끝나면 주석 풀어야함!!!!
//			double distance = ds.distance(id, (String)map.get("FRIEND"));
//			HashMap map2 = new HashMap();
//			map2.put("friend", (String)map.get("FRIEND"));
//			map2.put("distance", distance);
//			ss.update("member.distance", map2);
//		}		//여기까지 주석 풀어야함!!!!
		ss.commit();
		list = ss.selectList("member.friends", map1);
		ss.close();
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("BIRTH");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			list.get(i).put("BIRTH", day);
			list.set(i, list.get(i));
		}
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
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("BIRTH");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			list.get(i).put("BIRTH", day);
			list.set(i, list.get(i));
		}
		return list;
	}
	
	public int size(){ 	// 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("member.friendsSize");
		int psize = size % 10 == 0? size/10 : size/10+1;
		return psize;
	}
}
