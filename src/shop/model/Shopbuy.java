package shop.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Shopbuy {

	
	@Autowired
	SqlSessionFactory fac;

	public int musicbuy(String id, String title) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("title", title);
		try {
			SqlSession sql = fac.openSession();
			int rst = sql.insert("shopbuy.musicbuy", map);
			sql.close();
			return rst;
		} catch (Exception e) {
			
			return -1;
		}
	}
}
