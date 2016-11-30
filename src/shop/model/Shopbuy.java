package shop.model;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Shopbuy {

	
	@Autowired
	SqlSessionFactory fac;

	public int musicbuy(String id, String title, HttpSession session) {
		HashMap<String, Object> map  = new HashMap<>();
		map.put("id", id);
		map.put("title", title);
		SqlSession sql = fac.openSession();
		try {
			List list = sql.selectList("shopbuy.musiccheck", map);
			List<HashMap> list2 = sql.selectList("shopbuy.musicmoney", map);
			List<HashMap> list3 = sql.selectList("shopbuy.mypoint", map);
			int musicmoney = ((BigDecimal)list2.get(0).get("MONEY")).intValue();
			int mypoint = ((BigDecimal)list3.get(0).get("POINT")).intValue();
			if(list.size() == 0) {
				if(musicmoney <= mypoint) {
					HashMap<String, Object> pmap  = new HashMap<>();
						pmap.put("id", id);
						pmap.put("money", musicmoney);
					sql.update("shopbuy.cash", pmap);
					sql.insert("shopbuy.musicbuy", map);
					sql.commit();
					sql.close();
					session.setAttribute("point", mypoint-musicmoney);
					return 1;
				}else {
					sql.rollback();
					sql.close();
					return -1;
				}
			}else {
				sql.rollback();
				sql.close();
				return -1;
			}
		} catch (Exception e) {
			System.out.println(e);
			sql.rollback();
			sql.close();
			return -1;
	
		}
	}

}