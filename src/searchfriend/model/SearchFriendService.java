package searchfriend.model;

import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class SearchFriendService {
	@Autowired
	SqlSessionFactory fac;

	public List search(String find, String con, int p, HttpSession session) {
		SqlSession ss = fac.openSession();
		HashMap m = new HashMap<>();
		m.put("ctg2", "%"+con+"%");
		m.put("start", (p*10)-9);
		m.put("end", p*10);
		List<HashMap> li;

		switch(find){
		case "id" :
			li = ss.selectList("searchfriend.page1", m);
			break;
		case "name" : 
			li = ss.selectList("searchfriend.page2", m);
			break;
		case "email" :
			li = ss.selectList("searchfriend.page3", m);
			break;
		default : 
			li = ss.selectList("searchfriend.page4", m);	
		}
		for(int i=0; i<li.size(); i++){
			if(((String)session.getAttribute("id")).equals(li.get(i).get("ID"))){
				li.remove(i);
				break;
			}
		}
		for(int i=0; i<li.size(); i++){
			String friends = (String)li.get(i).get("ID");
			String id = (String)session.getAttribute("id");
			HashMap map = new HashMap();
			map.put("id", id);
			map.put("friends", friends);
			if(ss.selectList("searchfriend.addFriends", map).size()!=0){
				li.get(i).put("add", "add");
			} 
			if(ss.selectList("friends.friends", map).size()!=0){
				li.get(i).put("friend", "friend");
			}
		}
		
		ss.close();
		return li;
	}
	
	
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
