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
		System.out.println(id+"/"+list);
		ss.close();
		return list.get(0);
	}
}
