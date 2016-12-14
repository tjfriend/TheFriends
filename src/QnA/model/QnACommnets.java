package QnA.model;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class QnACommnets {

	@Autowired
	SqlSessionFactory fac;

	public int writecomments(String id, String memo, int commentnum,int num) {
		HashMap map = new HashMap();
		map.put("num", commentnum);
		map.put("id", id);
		map.put("memo", memo);
		map.put("qnanum", num);
		try {
			SqlSession sql = fac.openSession();
			int r = sql.insert("qna.qnacomments",map);
			sql.close();
			return r;
		} catch (Exception e) {
			return -1;
		}
	}
	
	public List showcommnets(int commentnum){
		SqlSession sql = fac.openSession();
		List<HashMap> li = sql.selectList("qna.showcomments",commentnum);
		
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			li.get(i).put("DAY", day);
			li.set(i, li.get(i));
		}
		
		sql.close();
		return li;
	}
	public int deletecomments(int commentnum){
		SqlSession sql = fac.openSession();
		int r = sql.delete("qna.commentsdelete",commentnum);
		sql.close();
		return r;
	}

}
