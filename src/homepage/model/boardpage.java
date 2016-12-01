package homepage.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class boardpage {

	@Autowired
	SqlSessionFactory fac;

	public List homeboardlist(int p,String id) {
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("homeboard.pagesize",id);
		p=p-1;
		int check = p*10;
		
		int endpage = size-check;
		int startpage = endpage - 9;
		HashMap map = new HashMap();
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("id", id);
		List<HashMap> li = sql.selectList("homeboard.pageNum", map);
		sql.close();
		for (int i = 0; i < li.size(); i++) {
			Date date = (Date) li.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			li.get(i).put("DAY", day);
			li.set(i, li.get(i));
		}
		return li;
	}

	public int size(String id) { // 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("homeboard.pagesize",id);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;
	}
	
	public HashMap homepagedetails(int num){
		SqlSession sql = fac.openSession();
		HashMap data = sql.selectOne("homeboard.homeborddetails", num);
		sql.close();
		return data;
		
	}
	
	//댓글
	public List Getcommentpage(int p, int num) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		HashMap map = new HashMap();
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("homenum", num);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("homeboard.homebordcommentlist", map);
		sql.close();
		return list;
	}

	public int commentsize(int num) { // 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("homeboard.commentpagesize", num);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;
	}
	
	// 검색
	public List searchhome(String search, int p,String id) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("search", search1);
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("id", id);
		SqlSession sql = fac.openSession();
		List<HashMap> li = sql.selectList("homeboard.homebordsearch", map);
		sql.close();
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String time = sdf.format(date);
			li.get(i).put("DAY", time);
			li.set(i, li.get(i));
		}
		return li;
	}

	public int searchhomesize(String search,String id) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		String search1 = "%" + search + "%";
		map.put("search", search1);
		map.put("id", id);
		int size = sql.selectOne("homeboard.searchhomebordsize", map);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;

	}

}
