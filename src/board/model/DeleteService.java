package board.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class DeleteService {
	@Autowired
	SqlSessionFactory fac;

//게시물 삭제
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
// 댓글만
	public int CommentDelete(int commentnum){
		SqlSession sql = fac.openSession();
			int de = sql.delete("freeboard.freeboardcommentdelete",commentnum);
		sql.close();
		return de;
	}
}
