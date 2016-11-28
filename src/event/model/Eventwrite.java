package event.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class Eventwrite {

	@Autowired
	SqlSessionFactory fac;

	public int Eventwrite(String id, String title, String content) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		int w = sql.insert("event.question", map);
		sql.close();
		return w;

	}

	// 조회수 증가
	public int upinquiry(int num) {
		HashMap map = new HashMap();
		map.put("num", num);
		SqlSession sql = fac.openSession();
		int up = sql.update("event.upinqu", map);
		sql.close();
		return up;

	}

	// 댓글수정
	public int CommentAdjust(String memo, int commentnum) {
		HashMap map = new HashMap();
		map.put("commentnum", commentnum);
		map.put("memo", memo);
		SqlSession sql = fac.openSession();
		int li = sql.update("event.eventcommentupdate", map);
		sql.close();
		return li;
	}

	// 게시글 수정
	public List num(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> li = sql.selectList("event.eventdetails", map);
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
	public int Adjust(int num, String content,String title){
		HashMap map = new HashMap();
			map.put("num", num);
			map.put("title", title);
			map.put("content", content);
		SqlSession sql = fac.openSession();
		int li = sql.update("event.eventadjust",map);
		sql.close();
		return li;
	}
	
	public int comment(@RequestParam int num, String id, String memo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("id", id);
		map.put("memo", memo);
		try {
			SqlSession sql = fac.openSession();
			int rst = sql.insert("event.eventcomment", map);
			sql.close();
			return rst;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	// 관리자 찾기
	public List membernickname(String id){
		SqlSession sql = fac.openSession();
		System.out.println("섭 : "+id);
		List r = sql.selectList("event.member",id);
		System.out.println("서비 "+r);
		sql.close();
		return r;
	}

}
