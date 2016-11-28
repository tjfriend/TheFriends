package event.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.*;

@Component
public class Eventwrite {
	
	@Autowired
	SqlSessionFactory fac;
	
	public int Eventwrite(String id , String title,String content){
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		int w = sql.insert("event.question",map);
		sql.close();
		return w;
		
	}
	// 조회수 증가
	public int upinquiry(int num){
		HashMap map = new HashMap();
			map.put("num", num);
		SqlSession sql = fac.openSession();
		int up = sql.update("event.upinqu",map);
		sql.close();
		return up;
				
	}
	// 댓글수정
	public int CommentAdjust(String memo,int commentnum){
		HashMap map = new HashMap();
			map.put("commentnum", commentnum);
			map.put("memo", memo);
		SqlSession sql = fac.openSession();
		int li = sql.update("event.eventcommentupdate",map);
		sql.close();
		return li;
	}
	
	
}
