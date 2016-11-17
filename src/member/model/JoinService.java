package member.model;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Component
public class JoinService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean join(String id, String password, String name, String birth, String phone, String add01, String add02, String email, String email2, @RequestParam(required=false) String recommender,
									String nickname, String key, HttpSession session){
		SqlSession ss = fac.openSession();
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("id", id);
		memberMap.put("password", password);
		memberMap.put("name", name);
		memberMap.put("birth", birth);
		memberMap.put("phone", phone);
		memberMap.put("address", add01+add02);
		memberMap.put("email", email+"@"+email2);
		memberMap.put("nickname", nickname);
		memberMap.put("recommender", recommender);
		
		HashMap<String, String> emailMap = new HashMap<>();
		emailMap.put("id", id);
		emailMap.put("uuid", key);
		emailMap.put("email", email+"@"+email2);
		
		HashMap<String, String> homeMap = new HashMap<>();
		homeMap.put("id", id);
		homeMap.put("name", name);

		try{
			ss.insert("member.join", memberMap);
			ss.insert("member.emailAuth", emailMap);
			ss.insert("member.homepage", homeMap);
			ss.commit();
			if(recommender!="admin"){
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
