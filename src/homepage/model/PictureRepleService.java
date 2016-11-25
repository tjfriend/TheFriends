package homepage.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class PictureRepleService {
	@Autowired
	SqlSessionFactory fac;
	
	// ��� �ۼ�
	public int reple(int num, String writer, String content){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("num", num);
		map.put("writer", writer);
		map.put("content", content);
		try{
			ss.insert("picture.reple",map);
			ss.commit();
			ss.close();
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return 0;
		}
	}   
	
	// ��ü ��� ������
	public List page(int num, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("num", num);
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List li = ss.selectList("picture.replepage",map);
		return li;
	}
	
	// ��� ��ü ���
	public int total(int num){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("picture.total2",num);
		return a%10==0 ? a/10 : a/10+1;
	}
	
	// ��� ����
	public int update(int replynum, String content){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("replynum", replynum);
		map.put("content", content);
		int a = ss.update("picture.modify",map);
		return a;
	}
	
	// ��� ����
	public int delete(int replynum){
		SqlSession ss = fac.openSession();
		int a = ss.delete("picture.delete",replynum);
		return a;
	}
}
