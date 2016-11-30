package shop.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Shopgift {
	@Autowired
	SqlSessionFactory fac;

	public List friend(String id) {
		SqlSession ss = fac.openSession();
		return ss.selectList("friends.friendSearch", id);
	}

	public boolean friendgift(String id, String title, String money, String gtake) {
		HashMap<String, Object> map = new HashMap<>();
		 map.put("id", gtake);
		 map.put("title", title);
		SqlSession sql = fac.openSession();
		try {
			List list = sql.selectList("shopbuy.musiccheck", map);
			List<HashMap> list2 = sql.selectList("shopbuy.musicmoney", map);
			List<HashMap> list3 = sql.selectList("shopbuy.mypoint", map);
			int musicmoney = ((BigDecimal) list2.get(0).get("MONEY")).intValue();
			int mypoint = ((BigDecimal) list3.get(0).get("POINT")).intValue();
			if (list.size() == 0) {
				if (musicmoney <= mypoint) {
					HashMap<String, Object> pmap = new HashMap<>();
					pmap.put("id", id);
					pmap.put("money", musicmoney);
					sql.update("shopbuy.cash", pmap);
					sql.insert("shopbuy.musicbuy", map);
					sql.commit();
					sql.close();
					return true;
				} else {
					sql.rollback();
					sql.close();
					return false;
				}
			} else {
				sql.rollback();
				sql.close();
				return false;
			}
		} catch (Exception e) {
			System.out.println(e);
			sql.rollback();
			sql.close();
			return false;

		}
	}

}
