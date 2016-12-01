package homepage.model;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

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
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			list.get(i).put("DAY", day);
			list.set(i, list.get(i));
		}
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
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			list.get(i).put("DAY", day);
			list.set(i, list.get(i));
		}
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
	
	public List priv(String id, String priv, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List<HashMap> list = new ArrayList<>();
		if(priv.equals("전체공개")){
			list = ss.selectList("homepage.viewVisitors", map);
		} else if(priv.equals("비공개")){
			list = ss.selectList("homepage.priv", map);
		}
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			list.get(i).put("DAY", day);
			list.set(i, list.get(i));
		}
		ss.close();
		return list;
	}
	
	public boolean modify(String num, String memo){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("num", num);
		map.put("memo", memo);
		int n = ss.update("homepage.modify", map);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
	
	public boolean del(String num){
		SqlSession ss = fac.openSession();
		int n = ss.delete("homepage.del", num);
		if(n>0){
			ss.commit();
			ss.close();
			return true;
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
}
