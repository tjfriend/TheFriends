package friends.model;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.lowagie.text.List;

@Component
public class AcceptService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean accept(String name, HttpSession session){
		SqlSession ss = fac.openSession();
		String id = (String)session.getAttribute("id");
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("name", name);
		if(ss.selectList("friends.accept", map).size()!=0){
			try{
				ss.insert("friends.acceptAdd", map);
				ss.insert("friends.acceptAdd2", map);
				ss.delete("friends.refuse", map);
				ss.commit();
				ss.close();
				return true;
			} catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
				return false;
			}
		} else {
			ss.rollback();
			ss.close();
			return false;
		}
	}
}
