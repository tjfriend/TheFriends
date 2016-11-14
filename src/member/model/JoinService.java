package member.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Component
public class JoinService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean join(String id, String password, String name, String birth, String phone, String add01, String add02, String email, String email2, @RequestParam(required=false) String recommender){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		map.put("name", name);
		map.put("birth", birth);
		map.put("phone", phone);
		map.put("address", add01+add02);
		map.put("email", email+"@"+email2);
		map.put("recommender", recommender);
		try{
			ss.insert("member.join", map);
			ss.commit();
			if(recommender!=null){
				ss.update("member.pointup", id);
				id = recommender;
				ss.update("member.pointup", id);
				ss.commit();
			}
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
	
	public List idcheck(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.idcheck", id);
		return list;
	}
}
