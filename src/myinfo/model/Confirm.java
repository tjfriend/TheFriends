package myinfo.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import java.util.*;

@Component
public class Confirm {
	
	@Autowired
	SqlSessionFactory fac;

	// 개인정보 
	public List PassConfirm(String id, String pass){
		HashMap map = new HashMap();
			map.put("id", id);
			map.put("pass", pass);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("myinfo.Confirm",map);
		sql.close();
		return list;
		
	}
	// 아이디 삭제
	public int Myinfodelete(String id){
		SqlSession sql = fac.openSession();
		int de = sql.delete("myinfo.memberdelete",id);
		int de1 = sql.delete("myinfo.myinfodelete",id);
		sql.close();
		return de+de1;
	}
	// 비밀번호 변경
	public int chagepass(String id,String pass){
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		int up = sql.update("myinfo.passupdate", map);
		return up;
		
	}
}
