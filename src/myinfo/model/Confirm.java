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

	// 아이디 삭제
	public int Myinfodelete(String id) {
		SqlSession sql = fac.openSession();
		int de = sql.delete("myinfo.addfriendsdelete", id);
		int de1 = sql.delete("myinfo.chargedelete", id);
		int de2= sql.delete("myinfo.chargeusedelete", id);
		int de3= sql.delete("myinfo.emailauthdelete", id);
		int de4= sql.delete("myinfo.eventdelete", id);
		int de5= sql.delete("myinfo.eventcommentdelete", id);
		int de6= sql.delete("myinfo.freeboarddelete", id);
		int de7= sql.delete("myinfo.freeboardcommentdelete", id);
		int de8= sql.delete("myinfo.friendsdelete", id);
		int de9= sql.delete("myinfo.homeboardcommentdelete", id);
		int de10 = sql.delete("myinfo.homeborddelete", id);
		int de11 = sql.delete("myinfo.homepagedelete", id);
		int de12 = sql.delete("myinfo.memaddressdelete", id);
		int de13 = sql.delete("myinfo.memberdelete", id);
		int de14 = sql.delete("myinfo.myinfodelete", id);
		int de15 = sql.delete("myinfo.noticedelete", id);
		int de16 = sql.delete("myinfo.noticecommentdelete", id);
		int de17 = sql.delete("myinfo.pictureboarddelete", id);
		int de18 = sql.delete("myinfo.picturereplydelete", id);
		int de19 = sql.delete("myinfo.profiledelete", id);
		int de20 = sql.delete("myinfo.qnadelete", id);
		int de21 = sql.delete("myinfo.qnacommentdelete", id);
		int de22 = sql.delete("myinfo.shopbuydelete", id);
		int de23 = sql.delete("myinfo.visitorsdelete", id);
		
		sql.close();
		return de+de1+de2+de3+de4+de5+de6+de7+de8+de9+de10+de11+de12+de13+de14+de15+de16+de17+de18+de19+de20+de21+de22+de23;
	}

	// 비밀번호 변경
	public int chagepass(String id, String pass) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("pass", pass);
		int up = sql.update("myinfo.passupdate", map);
		return up;

	}

	// 개인정보수정
	public int changemember(String id,String phone, String birth, String email, String email2, String add01, String add02,
			String checkbox,String post) {
		String email3 = email + "@" + email2;
		
		if(checkbox.contains("Emailoff"))
			email3 = "비공개";
		if(checkbox.contains("Addressoff")){
			add01 = "비공개";add02 = " ";
		}
		if(checkbox.contains("phoneoff"))
			phone = "비공개";
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
