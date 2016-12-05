package QnA.model;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.*;
import java.util.*;

@Component
public class qnawrite {

	@Autowired
	SqlSessionFactory fac;

	public int write(String title, String content, String id, String category) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		map.put("category", category);

		SqlSession sql = fac.openSession();
		try {
			int rst = sql.insert("qna.question", map);
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

	public int comment(@RequestParam int num, String id, String memo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("id", id);
		map.put("memo", memo);
		SqlSession sql = fac.openSession();
		try {
			int rst = sql.insert("qna.qnacomment", map);
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

	// 글수정
	public List num(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> li = sql.selectList("qna.qnadetails", map);
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
	
	public int Adjust(int num, String content,String category,String title){
		HashMap map = new HashMap();
			map.put("num", num);
			map.put("title", title);
			map.put("content", content);
			map.put("category", category);
		SqlSession sql = fac.openSession();
		int li = sql.update("qna.qnaadjust",map);
		sql.commit();
		sql.close();
		return li;
	}
	
	// 댓글 수정 
	
	public int CommentAdjust(String memo,int commentnum){
		HashMap map = new HashMap();
			map.put("commentnum", commentnum);
			map.put("memo", memo);
		SqlSession sql = fac.openSession();
		int li = sql.update("qna.qnacommentupdate",map);
		sql.commit();
		sql.close();
		return li;
	}
	
	// 조회수 증가
	public int upinquiry(int num){
		HashMap map = new HashMap();
			map.put("num", num);
		SqlSession sql = fac.openSession();
		int up = sql.update("qna.upinqu",map);
		sql.commit();
		sql.close();
		return up;
				
	}
}
