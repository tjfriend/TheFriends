package homepage.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class boarddelete {

	@Autowired
	SqlSessionFactory fac;

	// 댓글만 삭제
	public int CommentDelete(int commentnum) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("homeboard.homebordcommentdelete", commentnum);
		sql.close();
		return de;
	}

	// 게시글+ 댓글 삭제
	public int homeboardDelete(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("homeboard.homeborddelete", num);
		sql.close();
		return de;
	}

	public int homeboardDeletecomment(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("homeboard.homeborddeletecomment", num);
		sql.close();
		return de;
	}
}
