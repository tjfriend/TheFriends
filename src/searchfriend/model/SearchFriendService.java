package searchfriend.model;

import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class SearchFriendService {
	@Autowired
	SqlSessionFactory fac;

	public List search(String find, String con, int p) {
		SqlSession ss = fac.openSession();
		HashMap m = new HashMap<>();
//		m.put("ctg", find);
		m.put("ctg2", "%"+con+"%");
		m.put("start", (p*10)-9);
		m.put("end", p*10);
		List<HashMap> li = ss.selectList("searchfriend.page",m);
		ss.close();
		return li;
	}
	
	
	// 페이지 처리
	
	// 전체페이지 수 
	public int total(){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("searchfriend.total");
		ss.close();
		return a%10==0? a/10 : a/10+1;
	}
	
	/*public int test(String find, String con){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("ctg", find);
		map.put("ctg2", con);
		List li = ss.selectList("searchfriend.search",map);
		ss.close();
		if(li.size() != 0){
			return 1;
		}
		return 0;
	}*/
}
