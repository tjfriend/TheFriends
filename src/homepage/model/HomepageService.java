package homepage.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class HomepageService {
	@Autowired
	SqlSessionFactory fac;
	
	public String myHome(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("homepage.myhome", id);
		ss.close();
		return (String) list.get(0).get("ADDRESS");
	}
}
