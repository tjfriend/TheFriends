package board.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class DeleteService {
	@Autowired
	SqlSessionFactory fac;

//�Խù� ����
	public int delete(int num){
		HashMap map = new HashMap<>();
			map.put("num", num);
		SqlSession sql = fac.openSession();
		int li = sql.delete("freeboard.delete", map);
		sql.close();
		return li;
	}
	public int freeboardDeletecomment(int num){
		SqlSession sql = fac.openSession();
			int de = sql.delete("freeboard.boardcommentdelete",num);
		sql.close();
		return de;
	}
// ��۸�
	public int CommentDelete(int commentnum){
		SqlSession sql = fac.openSession();
			int de = sql.delete("freeboard.freeboardcommentdelete",commentnum);
		sql.close();
		return de;
	}
}
