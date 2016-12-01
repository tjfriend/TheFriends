package homepage.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class HomepageService {
	@Autowired
	SqlSessionFactory fac;
	
	public HashMap myHome(String name){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("homepage.myhome", name);
		ss.close();
		return list.get(0);
	}
	
	public HashMap goHome(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("homepage.gohome", id);
		ss.close();
		return list.get(0);
	}
	
	public String uuid(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("homepage.profileView", id);
		ss.close();
		if(list.size()!=0){
			return (String)list.get(0).get("UUID");
		} else {
			return null;
		}
	}
	
	public List music(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("homepage.music", id);
		ss.close();
		return list;
	}
}
