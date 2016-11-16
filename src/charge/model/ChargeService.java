package charge.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChargeService {
	@Autowired
	SqlSessionFactory fac;
	
	// 충전하기
	public int charge(String id, int point){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id",id);
		map.put("point", point);
		int a = ss.update("charge.chargeUp",map);
		if(a==1){
			try{
				int b = ss.insert("charge.charge", map);
				if(b==0){
					return 0;
				}
				ss.commit();
				ss.close();
				return 1;
			} catch(Exception e){
				ss.rollback();
				ss.close();
				return 0;
			}
		}
		return 0;
	}
	
	// 충전내역
	public List chargeAll(String id){
		SqlSession ss = fac.openSession();
		List li = ss.selectList("charge.chargeAll",id);
		ss.close();
		if(li!=null){
			return li;
		}
		return null;
	}
	
	// 충전내역 페이지 처리
	public List page(int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("start", (p-1)*5+1);
		map.put("end", p*5);
		List li = ss.selectList("charge.page",map);
		ss.close();
		return li;
	}

	// 충전내역 전체 페이지
	public int total(){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("charge.total");
		ss.close();
		return a%5==0? a/5 : a/5+1;
	}
	
}
