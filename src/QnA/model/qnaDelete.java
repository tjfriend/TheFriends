package QnA.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class qnaDelete {
 
	@Autowired
	SqlSessionFactory fac;
	
	public int QnaDelete(int num){
		SqlSession sql = fac.openSession();
			int de = sql.delete("qna.qnadelete",num);
		sql.close();
		return de;
	}
	public int QnaDeletecomment(int num){
		SqlSession sql = fac.openSession();
			int de = sql.delete("qna.qnadeletecomment",num);
		sql.close();
		return de;
	}
	
	public int CommentDelete(int commentnum){
		SqlSession sql = fac.openSession();
			int de = sql.delete("qna.commentdelete",commentnum);
		sql.close();
		return de;
	}
	
	
	
	
}
