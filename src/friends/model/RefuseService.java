package friends.model;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RefuseService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean refuse(HttpSession session, String name){
		SqlSession ss = fac.openSession();
		String id = (String)session.getAttribute("id");
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		int a =  ss.delete("friends.refuse",map);
		if(a>0){
			ss.close();
			return true;
		}
		ss.close();
		return false;
	}
}
