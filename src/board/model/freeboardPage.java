package board.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.File;
import java.text.*;
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
		List<HashMap> li = sql.selectList("freeboard.pageNum",map);
		sql.close();
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("TIME");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			li.get(i).put("TIME", day);
			li.set(i, li.get(i));
		}
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
		List<HashMap> li = sql.selectList("freeboard.modeNum",map);
		sql.close();
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("TIME");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			li.get(i).put("TIME", day);
			li.set(i, li.get(i));
		}
		return li;
	}
		
	// ��ۺ���

	public List Getcommentpage(int p, int num) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		HashMap map = new HashMap();
		map.put("start", startpage);
		map.put("end", endpage);
		map.put("freeboardnum", num);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("freeboard.freeboardcommentlist", map);
		sql.close();
		return list;
	}

	public int commentsize(int num) { // ������ ����
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("freeboard.commentpagesize", num);
		int psize = size % 10 == 0 ? size / 10 : size / 10 + 1;
		sql.close();
		return psize;
	}
	
	public HashMap freeboarddetails(int num){
		SqlSession sql = fac.openSession();
		HashMap data = sql.selectOne("freeboard.freeboarddetails", num);
		sql.close();
		return data;
		
	}
	
	public int size(){ 	// ������ ����
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("freeboard.pagesize");
		int psize = size % 10 == 0? size/10 : size/10+1;
		sql.close();
		return psize;
	}
	
	public int casize(String mode){ 	// ī�װ� ������ ����
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("freeboard.capagesize",mode);
		int psize = size % 10 == 0? size/10 : size/10+1;
		sql.close();
		return psize;
	}
	
	// �˻�

	public List searchfreeboard(String search, int p) {
		int endpage = 10 * p;
		int startpage = endpage - 9;
		String search1 = "%" + search + "%";
		HashMap map = new HashMap();
		map.put("search", search1);
		map.put("start", startpage);
		map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List<HashMap> li = sql.selectList("freeboard.freeboardsearch", map);
		sql.close();
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("TIME");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			li.get(i).put("TIME", day);
			li.set(i, li.get(i));
		}
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
