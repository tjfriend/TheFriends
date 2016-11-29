package event.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EventPage {
	
	@Autowired
	SqlSessionFactory fac;

		public List eventlist(int p){
			int endpage = 10 * p;
			int startpage = endpage - 9;
			HashMap map = new HashMap();
			map.put("start", startpage);
			map.put("end", endpage);
			SqlSession sql = fac.openSession();
			List<HashMap> li = sql.selectList("event.pageNum", map);
			sql.close();
			for(int i=0; i<li.size(); i++){
				Date date = (Date)li.get(i).get("DAY");
				SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
				String day = sdf.format(date);
				li.get(i).put("DAY", day);
				li.set(i, li.get(i));
			}
			return li;
		}

		public int size() { // 페이지 숫자
			SqlSession sql = fac.openSession();
			int size = sql.selectOne("event.pagesize");
			int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
			sql.close();
			return psize;
		}
		
		// 댓글보기

		public List Getcommentpage(int p, int num) {
			int endpage = 10 * p;
			int startpage = endpage - 9;
			HashMap map = new HashMap();
			map.put("start", startpage);
			map.put("end", endpage);
			map.put("eventnum", num);
			SqlSession sql = fac.openSession();
			List list = sql.selectList("event.eventcommentlist", map);
			sql.close();
			return list;
		}

		public int commentsize(int num) { // 페이지 숫자
			SqlSession sql = fac.openSession();
			int size = sql.selectOne("event.commentpagesize", num);
			int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
			sql.close();
			return psize;
		}
		
		public List searchqna(String search, int p) {
			int endpage = 10 * p;
			int startpage = endpage - 9;
			String search1 = "%" + search + "%";
			HashMap map = new HashMap();
			map.put("search", search1);
			map.put("start", startpage);
			map.put("end", endpage);
			SqlSession sql = fac.openSession();
			List<HashMap> li = sql.selectList("event.eventsearch", map);
			sql.close();
			for(int i=0; i<li.size(); i++){
				Date date = (Date)li.get(i).get("DAY");
				SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
				String day = sdf.format(date);
				li.get(i).put("DAY", day);
				li.set(i, li.get(i));
			}
			return li;
		}

		public int searchqnasize(String search) {
			SqlSession sql = fac.openSession();
			String search1 = "%" + search + "%";
			int size = sql.selectOne("event.searcheventsize", search1);
			int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
			sql.close();
			return psize;

		}
		public HashMap eventdetails(int num){
			SqlSession sql = fac.openSession();
			HashMap data = sql.selectOne("event.eventdetails", num);
			sql.close();
			return data;
		}
}
