package member.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class AuthCheckService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean authCheck(String id, String key){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("key", key);
		List<HashMap> list = ss.selectList("member.authCheck", map);
		ss.close();
		if(list.size()!=0){
			return true;
		} else {
			return false;
		}
	}
}
