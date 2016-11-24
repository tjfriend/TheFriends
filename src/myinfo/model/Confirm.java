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
	public List PassConfirm(String id, String pass) {
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		SqlSession sql = fac.openSession();
		List list = sql.selectList("myinfo.Confirm", map);

		sql.close();
		return list;

	}

	public List Myinfo(String id) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		List lis = sql.selectList("myinfo.myinfotable", map);
		sql.close();
		return lis;

	}

	// ���̵� ����
	public int Myinfodelete(String id) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("myinfo.memberdelete", id);
		int de1 = sql.delete("myinfo.myinfodelete", id);
		sql.close();
		return de + de1;
	}

	// ��й�ȣ ����
	public int chagepass(String id, String pass) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		int up = sql.update("myinfo.passupdate", map);
		return up;

	}

	// ������������
	public int changemember(String id,String phone, String birth, String email, String email2, String add01, String add02,
			String checkbox,String post) {
		String email3 = email + "@" + email2;
		
		if(checkbox.contains("Emailoff"))
			email3 = "�����";
		if(checkbox.contains("Addressoff")){
			add01 = "�����";add02 = " ";
		}
		if(checkbox.contains("phoneoff"))
			phone = "�����";
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("email", email3);
		map.put("add01", add01);
		map.put("add02", add02);
		map.put("post", post);
		map.put("phone", phone);
		
		SqlSession sql = fac.openSession();
		if(checkbox.contains("Birthoff")){
			int upda = sql.update("myinfo.changemembercheckboxbirth", map);
			sql.close();
			return upda;
		}else{
			map.put("birth", birth);
			int upda = sql.update("myinfo.changemember", map);
			sql.close();
			return upda;
		}
		
	}
	public int changemyinfo(String id,String phone, String birth, String email, String email2, String add01, String add02,
			String checkbox) {
		
		String email4 = email + "@" + email2;
		
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("email", email4);
		map.put("add01", add01);
		map.put("add02", add02);
		map.put("birth", birth);
		map.put("phone", phone);
		SqlSession sql = fac.openSession();
		int upmy = sql.update("myinfo.changemyinfo", map);
		
		sql.close();
		return upmy;
	}
}
