package friends.model;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class RequestFriendsService {
	@Autowired
	SqlSessionFactory fac;
	
	public List<HashMap> requestFriends(String id){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		List<HashMap> list = ss.selectList("friends.request", id);
		ss.close();
		return list;
	}
	
	public int size(String id){ 	// 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("friends.friendsSize", id);
		int psize = size % 10 == 0? size/10 : size/10+1;
		sql.close();
		return psize;
	}
	
	public List requestFriends2(String id, int p, String range){
		int endpage = 10*p;
		int startpage = endpage-9;
		SqlSession ss = fac.openSession();
		Map map1 = new HashMap();
		map1.put("id", id);
		map1.put("start", startpage);
		map1.put("end", endpage);
		List<HashMap> list = new Vector<>();
		if(range.equals("방문자순")){
			list = ss.selectList("friends.requestV", map1);
		} else if(range.equals("날짜순")){
			list = ss.selectList("friends.requestD", map1);
		} else if(range.equals("이름순")){
			list = ss.selectList("friends.requestN", map1);
		}
		ss.commit();
		ss.close();
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("ADDDATE");
			Date birth = (Date)list.get(i).get("BIRTH");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			String bday = sdf.format(birth);
			list.get(i).put("ADDDATE", day);
			list.get(i).put("BIRTH", bday);
			list.set(i, list.get(i));
		}
		return list;
	}
	
}
