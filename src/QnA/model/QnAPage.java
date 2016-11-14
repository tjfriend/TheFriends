package QnA.model;

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
	
	public List GetRnage(int p){ // p = page
		
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap map = new HashMap();
			map.put("start", startpage);
			map.put("end", endpage);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("qna.pageNum",map);
		sql.close();
		return li;
	}
	
	public int size(){ 	// 페이지 숫자
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("qna.pagesize");
		int psize = size % 10 == 0? size/10 : size/10+1;
	
		return psize;
	}
	
	// qna글쓰기
	public boolean makeqna(String title,String content, String id){
		System.out.println(title+"/"+content+"/"+id);
		SqlSession sql = fac.openSession();
		HashMap<String, String> map = new HashMap<> ();
			map.put("title", title);
			map.put("content", content);
			map.put("id", id);
		try{
			 sql.insert("qna.question",map);
			 sql.commit();
			 sql.close();
			 return true;
		}catch(Exception e){
			sql.rollback();
			sql.close();
			e.printStackTrace();
			return false;
		}
	}
	
		
}
