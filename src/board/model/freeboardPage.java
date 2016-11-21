package board.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.*;

@Component
public class freeboardPage {
	

	@Autowired
	SqlSessionFactory fac;
	
	public List GetRnage(int p){ // p = page
		
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap<String, Integer> map = new HashMap<>();
			map.put("start", startpage);
			map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("freeboard.pageNum",map);
		sql.close();
		return li;
	}
	
	public List GetMode(int p,String mode){
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap map = new HashMap();
			map.put("start", startpage);
			map.put("end", endpage);
			map.put("mode", mode);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("freeboard.modeNum",map);
		sql.close();
		return li;
	}
		
	
	public int size(){ 	// 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("freeboard.pagesize");
		int psize = size % 10 == 0? size/10 : size/10+1;
		sql.close();
		return psize;
	}
	
	public int casize(String mode){ 	// 카테고리 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("freeboard.capagesize",mode);
		int psize = size % 10 == 0? size/10 : size/10+1;
		sql.close();
		return psize;
	}
	
	// 검색

	public List searchfreeboard(String search, int p) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("search", search1);
		map.put("start", startpage);
		map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("freeboard.freeboardsearch", map);
		sql.close();
		return li;
	}

	public int searchfreeboardsize(String search) {
		SqlSession sql = fac.openSession();
		String search1 = "%" + search + "%";
		int size = sql.selectOne("freeboard.searchfreeboardsize", search1);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;

	}

	public List searchfreeboardmode(String search, int p, String mode) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("search", search1);
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("mode", mode);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("freeboard.freeboardsearchmode", map);
		sql.close();
		return li;
	}

	public int searchfreeboardsizemode(String search, String mode) {
		SqlSession sql = fac.openSession();
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("mode", mode);
		map.put("search", search1);
		int size = sql.selectOne("freeboard.freeboardsearchmodesize", map);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;

	}
	

	
}
