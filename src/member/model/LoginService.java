package member.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class LoginService {
	@Autowired
	SqlSessionFactory fac;
	
	public List Login(String id, String password){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("password", password);
		List<HashMap> list = ss.selectList("member.login", map);
		ss.close();
		return list;
	}
}
