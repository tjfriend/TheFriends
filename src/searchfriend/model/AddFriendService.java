package searchfriend.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AddFriendService {
	@Autowired
	SqlSessionFactory fac;
	  
	public List page(int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
//		map.put("ctg", value);
//		map.put("ctg2", value)
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List li = ss.selectList("searchfriend.page",map);
		ss.close();
		return li;
	}
	
	public int total(){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("searchfriend.total");
		ss.close();
		return a%10==0? a/10 : a/10+1;
	}
	
	public boolean add(String id, String friend){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("friend", friend);
		try{
			ss.insert("friends.add", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return false;
		}
	}
}

