package shop.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ShopWrite {
	@Autowired
	SqlSessionFactory fac;

	public int write(String title, int money) {
		
		HashMap map = new HashMap();
		map.put("title", title);
		map.put("money", money);
		try {
			SqlSession sql = fac.openSession();
			int rst = sql.insert("Shop.shopwrite", map);
			sql.close();
			return rst;
		} catch (Exception e) {
			
			return -1;
		}
	}
}
