package board.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
public class freeboardwrite {

	@Autowired
	SqlSessionFactory fac;

	public int write(String title, String content, String id, String category) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("title", title);
		map.put("content", content);
		map.put("id", id);
		map.put("category", category);
		System.out.println("���� : "+map);
		SqlSession sql = fac.openSession();
		try {
			System.out.println("1");
			int rst = sql.insert("freeboard.write", map);
			sql.commit();
			sql.close();
			return rst;
		} catch (Exception e) {
			sql.rollback();
			sql.close();
			return -1;
		}
	}
	
	// ��ȸ�� ����
	public int upinquiry(int num){
		HashMap map = new HashMap();
			map.put("num", num);
		SqlSession sql = fac.openSession();
		int up = sql.update("freeboard.upinqu",map);
		sql.close();
		return up;
				
	}
}
