package member.model;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.*;

@Component
public class JoinService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean join(String id, String password, String name, String birth, String phone, String add01, String add02, String email, String email2, @RequestParam(required=false) String recommender,
									String nickname, String key, HttpSession session, String post){
		SqlSession ss = fac.openSession();
		HashMap<String, String> memberMap = new HashMap<>();
		memberMap.put("id", id);
		memberMap.put("password", password);
		memberMap.put("name", name);
		memberMap.put("birth", birth);
		memberMap.put("phone", phone);
		memberMap.put("add01", add01);
		memberMap.put("add02", add02);
		memberMap.put("email", email+"@"+email2);
		memberMap.put("nickname", nickname);
		memberMap.put("recommender", recommender);
		memberMap.put("post", post);
		
		HashMap<String, String> emailMap = new HashMap<>();
		emailMap.put("id", id);
		emailMap.put("uuid", key);
		emailMap.put("email", email+"@"+email2);
		
		HashMap<String, String> homeMap = new HashMap<>();
		homeMap.put("id", id);
		homeMap.put("name", name);
		
		HashMap<String, String> infoMap = new HashMap<>();
		infoMap.put("id", id);
		infoMap.put("phone", phone);
		infoMap.put("email", email+"@"+email2);
		infoMap.put("birth", birth);
		infoMap.put("add01", add01);
		infoMap.put("add02", add02);
		
		List<HashMap> memList = ss.selectList("member.idcheck", id);
		String addr = add01+add02;
		if(addr.contains("(")){
			addr = addr.substring(0, addr.indexOf('('));
		}
		RestTemplate rt = new RestTemplate();
		String url = "https://maps.googleapis.com/maps/api/geocode/json?address="+addr+"&key=AIzaSyCDR-huxTUPDmTznn7No15RNAOKOW9xHoY";
		LinkedHashMap addrMap = rt.getForObject(url, LinkedHashMap.class);
		LinkedHashMap liAddrMap = (LinkedHashMap)((LinkedHashMap)(((LinkedHashMap)((ArrayList)addrMap.get("results")).get(0)).get("geometry"))).get("location");
		// id�� x��ǥ
		double dd = (double)liAddrMap.get("lat");
		String lat1 = (String.valueOf((double)liAddrMap.get("lat"))).substring(0, (String.valueOf((double)liAddrMap.get("lat"))).indexOf('.'));
		lat1 += String.valueOf((double)liAddrMap.get("lat")).substring((String.valueOf((double)liAddrMap.get("lat"))).indexOf('.'), (String.valueOf((double)liAddrMap.get("lat")).indexOf('.'))+7);
		// id�� y��ǥ
		String lng1 = (String.valueOf((double)liAddrMap.get("lng"))).substring(0, (String.valueOf((double)liAddrMap.get("lng"))).indexOf('.'));
		lng1 += String.valueOf((double)liAddrMap.get("lng")).substring((String.valueOf((double)liAddrMap.get("lng"))).indexOf('.'), (String.valueOf((double)liAddrMap.get("lng")).indexOf('.'))+7);

		try{
			ss.insert("member.join", memberMap);
			ss.insert("member.emailAuth", emailMap);
			ss.insert("member.homepage", homeMap);
			ss.insert("member.myinfo", infoMap);
			
			HashMap insertMap = new HashMap();
			insertMap.put("id", id);
			insertMap.put("x", lat1);
			insertMap.put("y", lng1);
			ss.insert("member.memLocation", insertMap);
			
			ss.commit();
			
			if(recommender!="admin"){
				ss.update("member.pointup", id);
				id = recommender;
				ss.update("member.pointup", id);
				ss.commit();
			}
			
			ss.close();
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
	
	public List idcheck(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.idcheck", id);
		return list;
	}
}
