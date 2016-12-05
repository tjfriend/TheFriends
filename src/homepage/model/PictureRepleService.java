package homepage.model;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

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
		List<HashMap> li = ss.selectList("picture.replepage",map);
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			li.get(i).put("DAY", day);
			li.set(i, li.get(i));
		}
		ss.close();
		return li;
	}
	
	// ��� ��ü ���
	public int total(int num){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("picture.total2",num);
		ss.close();
		return a%10==0 ? a/10 : a/10+1;
	}
	
	// ��� ����
	public int update(int replynum, String content){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("replynum", replynum);
		map.put("content", content);
		int a = ss.update("picture.modify",map);
		ss.commit();
		ss.close();
		return a;
	}
	
	// ��� ����
	public int delete(int replynum){
		SqlSession ss = fac.openSession();
		int a = ss.delete("picture.delete",replynum);
		ss.commit();
		ss.close();
		return a;
	}
}
