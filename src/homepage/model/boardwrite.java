package homepage.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class boardwrite {

	@Autowired
	SqlSessionFactory fac;

	public int boardwrite(String id, String title, String content) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		try{
			int w = sql.insert("homeboard.write", map);
			sql.commit();
			sql.close();
			return 1;
		} catch (Exception e){
			e.printStackTrace();
			sql.rollback();
			sql.commit();
			return -1;
		}
	}

	// 조회수 증가
	public int upinquiry(int num) {
		HashMap map = new HashMap();
		map.put("num", num);
		SqlSession sql = fac.openSession();
		int up = sql.update("homeboard.upinqu", map);
		sql.close();
		return up;

	}

	// 댓글수정
	public int CommentAdjust(String memo, int commentnum) {
		HashMap map = new HashMap();
		map.put("commentnum", commentnum);
		map.put("memo", memo);
		SqlSession sql = fac.openSession();
		int li = sql.update("homeboard.homebordcommentupdate", map);
		sql.close();
		return li;
	}

	// 게시글 수정
	public List num(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> li = sql.selectList("homeboard.homeborddetails", map);
		sql.close();
		for (int i = 0; i < li.size(); i++) {
			Date date = (Date) li.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String time = sdf.format(date);
			li.get(i).put("DAY", time);
			li.set(i, li.get(i));
		}
		return li;

	}

	public int Adjust(int num, String content, String title) {
		HashMap map = new HashMap();
		map.put("num", num);
		map.put("title", title);
		map.put("content", content);
		SqlSession sql = fac.openSession();
		int li = sql.update("homeboard.homebordadjust", map);
		sql.close();
		return li;
	}

	public int comment(@RequestParam int num, String coid, String memo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("id", coid);
		map.put("memo", memo);
		SqlSession sql = fac.openSession();
		try {
			int rst = sql.insert("homeboard.homebordcomment", map);
			sql.commit();
			sql.close();
			return rst;

		} catch (Exception e) {
			e.printStackTrace();
			sql.rollback();
			sql.close();
			return -1;
		}
	}

}
