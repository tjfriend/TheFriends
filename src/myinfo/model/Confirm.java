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

	// �������� 
	public List PassConfirm(String id, String pass){
		HashMap map = new HashMap();
			map.put("id", id);
			map.put("pass", pass);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("myinfo.Confirm",map);
		
		sql.close();
		return list;
		
	}
	// ���̵� ����
	public int Myinfodelete(String id){
		SqlSession sql = fac.openSession();
		int de = sql.delete("myinfo.memberdelete",id);
		int de1 = sql.delete("myinfo.myinfodelete",id);
		sql.close();
		return de+de1;
	}
	// ��й�ȣ ����
	public int chagepass(String id,String pass){
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		int up = sql.update("myinfo.passupdate", map);
		return up;
		
	}
	// ������������
		public int changemyinfo(String id,String birth,String email,String email2, String add01,String add02,
				String Eamiloff,String addressoff,String birthoff){
			System.out.println("���� id: "+id+"//birth//"+birth+"//ema//"+email+"//ema2//"+email2+"//add//"
						+add01+"//qwr//"+add02+"//eaof//"+Eamiloff+"//adof//"+addressoff+"//birof//"+birthoff);
				String email3 = email+"@"+email2;
				String add03 = add01+" "+add02;
				if(Eamiloff != null)
					email3 = "�����";
				if(addressoff != null)
					add03 = "�����";
				if(birthoff != null)
					birth = "�����";
			HashMap map = new HashMap();
				map.put("id", id);
				map.put("email", email3);
				map.put("address", add03);
				map.put("birth", birth);
				System.out.println("map : "+map);
			SqlSession sql = fac.openSession();
			int upda = sql.update("myinfo.changemyinfo",map);
			System.out.println("up : "+upda);
			sql.close();
			return upda;
		}
}
