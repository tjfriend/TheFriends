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
	
	public int modesize(String mode){
		SqlSession sql = fac.openSession();
		int size = sql.selectOne("qna.modesize",mode);
		int psize = size % 10 == 0? size/10 : size/10+1;
		
		return psize;

	}
	
	public List GetMode(int p,String mode){
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap map = new HashMap();
			map.put("start", startpage);
			map.put("end", endpage);
			map.put("mode", mode);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("qna.modeNum",map);
		sql.close();
		return li;
	}
		
//	댓글보기
	
	public List Getcommentpage(int p,int num){
		System.out.println("서비스 페이지"+p);
		int endpage = 10*p;
		int startpage = endpage-9;
		HashMap map = new HashMap();
			map.put("start",startpage);
			map.put("end", endpage);
		System.out.println("서비스"+endpage);
			map.put("qnanum", num);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("qna.qnacommentlist",map);
		sql.close();
		
		return list;
	
	}
	
	public int commentsize(int num){ 	// 페이지 숫자
		SqlSession sql = fac.openSession();	
		int size = sql.selectOne("qna.commentpagesize",num);	
		int psize = size % 10 == 0? size/10 : size/10+1;
	
		return psize;
	}
	
}
