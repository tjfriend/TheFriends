package QnA.model;

import org.apache.ibatis.jdbc.SQL;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.*;

import javax.servlet.http.HttpSession;

@Component
public class QnAPage {

	@Autowired
	SqlSessionFactory fac;

	public List GetRnage(int p) { // p = page

		int endpage = 10 * p;
		int startpage = endpage - 9;
		HashMap map = new HashMap();
		map.put("start", startpage);
		map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("qna.pageNum", map);
		sql.close();
		return li;
	}

	public int size() { // 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("qna.pagesize");
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;
	}

	public int modesize(String mode) {
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("qna.modesize", mode);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;

	}

	public List GetMode(int p, String mode) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		HashMap map = new HashMap();
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("mode", mode);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("qna.modeNum", map);
		sql.close();
		return li;
	}

	// 댓글보기

	public List Getcommentpage(int p, int num) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		HashMap map = new HashMap();
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("qnanum", num);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("qna.qnacommentlist", map);
		sql.close();

		return list;

	}

	public int commentsize(int num) { // 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("qna.commentpagesize", num);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;
	}

	// 검색

	public List searchqna(String search, int p) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("search", search1);
		map.put("start", startpage);
		map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("qna.qnasearch", map);
		sql.close();
		return li;
	}

	public int searchqnasize(String search) {
		SqlSession sql = fac.openSession();
		String search1 = "%" + search + "%";
		int size = sql.selectOne("qna.searchqnasize", search1);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;

	}

	public List searchqnamode(String search, int p, String mode) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("search", search1);
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("mode", mode);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("qna.qnasearchmode", map);
		sql.close();
		return li;
	}

	public int searchqnasizemode(String search, String mode) {
		SqlSession sql = fac.openSession();
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("mode", mode);
		map.put("search", search1);
		int size = sql.selectOne("qna.qnasearchmodesize", map);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;

	}

}
