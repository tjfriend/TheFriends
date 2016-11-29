package notice.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class noticepage {
	
	@Autowired
	SqlSessionFactory fac;

		public List noticelist(int p){
			int endpage = 10 * p;
			int startpage = endpage - 9;
			HashMap map = new HashMap();
			map.put("start", startpage);
			map.put("end", endpage);
			SqlSession sql = fac.openSession();
			List<HashMap> li = sql.selectList("notice.pageNum", map);
			sql.close();
			for(int i=0; i<li.size(); i++){
				Date date = (Date)li.get(i).get("TIME");
				SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
				String time = sdf.format(date);
				li.get(i).put("TIME", time);
				li.set(i, li.get(i));
			}
			return li;
		}

		public int size() { // 페이지 숫자
			SqlSession sql = fac.openSession();
			int size = sql.selectOne("notice.pagesize");
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
			map.put("noticenum", num);
			SqlSession sql = fac.openSession();
			List list = sql.selectList("notice.noticecommentlist", map);
			sql.close();
			return list;
		}

		public int commentsize(int num) { // 페이지 숫자
			SqlSession sql = fac.openSession();
			int size = sql.selectOne("notice.commentpagesize", num);
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
			List<HashMap> li = sql.selectList("notice.noticesearch", map);
			sql.close();
			for(int i=0; i<li.size(); i++){
				Date date = (Date)li.get(i).get("TIME");
				SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
				String time = sdf.format(date);
				li.get(i).put("TIME", time);
				li.set(i, li.get(i));
			}
			return li;
		}

		public int searchqnasize(String search) {
			SqlSession sql = fac.openSession();
			String search1 = "%" + search + "%";
			int size = sql.selectOne("notice.searchnoticesize", search1);
			int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
			sql.close();
			return psize;

		}
}
