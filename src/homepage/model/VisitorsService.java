package homepage.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class VisitorsService {
	@Autowired
	SqlSessionFactory fac;
	
	public List visitors(String id, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List<HashMap> list = ss.selectList("homepage.viewVisitors", map);
		ss.close();
		return list;
	}
	
	public List visitors2(String id, String writer, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("writer", writer);
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List<HashMap> list = ss.selectList("homepage.viewVisitors2", map);
		ss.close();
		return list;
	}
	
	public boolean write(String id, String writer, String memo, String mode){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("writer", writer);
		map.put("memo", memo);
		map.put("private", mode);
		try{
			ss.insert("homepage.visitors", map);
			ss.commit();
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
}
