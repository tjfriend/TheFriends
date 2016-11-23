package homepage.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PictureRepleService {
	@Autowired
	SqlSessionFactory fac;
	
	// ´ñ±Û ÀÛ¼º
	public int reple(String num, String writer, String content){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("num", num);
		map.put("writer", writer);
		map.put("content", content);
		try{
			ss.insert("picture.reple",map);
			ss.commit();
			ss.close();
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return 0;
		}
	}   
	
	// ÀüÃ¼ ´ñ±Û ÆäÀÌÁö
	public List page(String id, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List li = ss.selectList("picture.replepage",map);
		return li;
	}
	
	// ´ñ±Û ÀüÃ¼ ¸ñ·Ï
	public int total(){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("picture.total2");
		return a/10==0 ? a%10 : a%10+1;
	}
}
