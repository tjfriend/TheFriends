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
	
	public List homeFriends(String id){
		SqlSession ss = fac.openSession();
		return ss.selectList("friends.homeFriends", id);
	}
	
	public List friends(String id, int p){
		int endpage = 10*p;
		int startpage = endpage-9;
		SqlSession ss = fac.openSession();
		Map map1 = new HashMap();
		map1.put("id", id);
		map1.put("start", startpage);
		map1.put("end", endpage);
		List<HashMap> list = ss.selectList("member.friends", map1);
		for(HashMap map : list){			//�׽�Ʈ ������ �ּ� Ǯ�����!!!!
			double distance = ds.distance(id, (String)map.get("FRIEND"));
			HashMap map2 = new HashMap();
			map2.put("id", id);
			map2.put("friend", (String)map.get("FRIEND"));
			map2.put("distance", distance);
			ss.update("member.distance", map2);
			map2.put("id", (String)map.get("FRIEND"));
			map2.put("friend", id);
			map2.put("distance", distance);
			ss.update("member.distance", map2);
		}		//������� �ּ� Ǯ�����!!!!
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
		if(range.equals("�湮�ڼ�")){
			list = ss.selectList("member.friendsV", map1);
		} else if(range.equals("�Ÿ���")){
			list = ss.selectList("member.friendsD", map1);
		} else if(range.equals("�̸���")){
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
	
	public int size(String id){ 	// ������ ����
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("member.friendsSize", id);
		int psize = size % 10 == 0? size/10 : size/10+1;
		return psize;
	}
}
