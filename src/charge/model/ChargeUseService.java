package charge.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChargeUseService {
	@Autowired
	SqlSessionFactory fac;

	
	// 결제해서 선물하기
	public int cash(String id, String take, int point){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", take);
		map.put("point", point);
		map.put("take",id);
		int a = ss.update("charge.chargeUp",map);
		if(a==1){
			try{
				ss.insert("charge.chgift",map);
				ss.commit();
				ss.close();
				return 1;
			}catch(Exception e){
				e.printStackTrace();
				ss.rollback();
				ss.close();
				return 0;
			}
		}else{
			return 0;
		}
	}
	
	
	
	// 내포인트 선물하기
	public int gift(String id, String take, int point) {
		SqlSession ss = fac.openSession();

		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("takeid", take);
		map.put("point", point);

		try {
			int a = ss.update("charge.gift1", map);
			int b = ss.update("charge.gift2", map);
			int c = ss.insert("charge.gift3", map);
			int d = ss.insert("charge.gift4", map);
			if (a == 1 && b == 1 && c == 1 && d == 1)
				ss.commit();
			else
				ss.rollback();
			ss.close();
			return 1;
		} catch (Exception e) {
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return 0;
		}
	}

	// 사용내역 페이지 처리
	public List page(int p, String id){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		map.put("id", id);
		List li = ss.selectList("charge.page2",map);
		ss.close();
		return li;
	}

	// 사용내역 전체 페이지
	public int total(){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("charge.total2");
		ss.close();
		return a%10==0? a/10 : a/10+1;
	}
	
}
