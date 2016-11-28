package event.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class EventDelete {

	@Autowired
	SqlSessionFactory fac;

	// ��۸� ����
	public int CommentDelete(int commentnum) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("event.eventcommentdelete", commentnum);
		sql.close();
		return de;
	}

	// �Խñ�+ ��� ����
	public int EventDelete(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("event.eventdelete", num);
		sql.close();
		return de;
	}

	public int EventDeletecomment(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("event.eventdeletecomment", num);
		sql.close();
		return de;
	}

}
