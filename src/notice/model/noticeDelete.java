package notice.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class noticeDelete {

	@Autowired
	SqlSessionFactory fac;

	// ��۸� ����
	public int CommentDelete(int commentnum) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("notice.noticecommentdelete", commentnum);
		sql.commit();
		sql.close();
		return de;
	}

	// �Խñ�+ ��� ����
	public int noticeDelete(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("notice.noticedelete", num);
		sql.commit();
		sql.close();
		return de;
	}

	public int noticeDeletecomment(int num) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("notice.noticedeletecomment", num);
		sql.commit();
		sql.close();
		return de;
	}

}
