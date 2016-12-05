package homepage.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class boarddelete {

	@Autowired
	SqlSessionFactory fac;

	// ��۸� ����
	public int CommentDelete(int commentnum) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("homeboard.homebordcommentdelete", commentnum);
		sql.commit();
		sql.close();
		return de;
	}

	// �Խñ�+ ��� ����
	public int homeboardDelete(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("homeboard.homeborddelete", num);
		sql.commit();
		sql.close();
		return de;
	}

	public int homeboardDeletecomment(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("homeboard.homeborddeletecomment", num);
		sql.commit();
		sql.close();
		return de;
	}
}
