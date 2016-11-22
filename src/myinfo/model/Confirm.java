package myinfo.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
public class Confirm {
	
	@Autowired
	SqlSessionFactory fac;

	public List PassConfirm(String id, String pass){
		HashMap map = new HashMap();
			map.put("id", id);
			map.put("pass", pass);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("myinfo.Confirm",map);
		return list;
		
	}
}
