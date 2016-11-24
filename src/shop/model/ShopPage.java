package shop.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ShopPage {
	
	@Autowired
	SqlSessionFactory fac;
	
	public List GetRnage(int p) {
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap map = new HashMap();
			map.put("start", startpage);
			map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("Shop.pageNum",map);
		sql.close();
		return li;
	} 
	
	public int size(){ 	
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("Shop.pagesize");
		int psize = size % 10 == 0? size/10 : size/10+1;
		sql.close();
		return psize;
	}
	
	public List searchshop(String search, int p) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("search", search1);
		map.put("start", startpage);
		map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("Shop.searchshop", map);
		sql.close();
		return li;
	}

	public int searchsizeshop(String search) {
		SqlSession sql = fac.openSession();
		String search1 = "%" + search + "%";
		int size = sql.selectOne("Shop.searchsizeshop", search1);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;

	}
}
