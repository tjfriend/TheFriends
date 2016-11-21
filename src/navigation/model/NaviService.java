package navigation.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NaviService {
	@Autowired
	SqlSessionFactory fac;
	
	// 내주소
	public String navi(String id){
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("navi.myhome",id);
		String my = (String)map.get("ADDRESS");
		ss.close();
		return my;
	}
	
	// 주소 검색
	public List find(String friend){
		SqlSession ss = fac.openSession();
		List li = ss.selectList("navi.friendhome","%"+friend+"%");
		ss.close();
		return li;
	}
	
	// 좌표검색
	public HashMap coordinate(String name, String address){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("name", name);
		map.put("address", "%"+address+"%");
		List<HashMap> li = ss.selectList("navi.dis",map);
		for(int i=0; i<li.size(); i++){
			map.put("X", Double.parseDouble((String) li.get(i).get("X")));
			map.put("Y", Double.parseDouble((String) li.get(i).get("Y")));
		}
		ss.close();
		return map;
	}
	
	// 사용자 좌표
	public HashMap mydis(String id){
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("navi.mdis",id);
		ss.close();
		return map;
	}
}
