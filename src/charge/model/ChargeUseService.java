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

	// 선물하기
	public int gift(String id, String take, int point) {
		SqlSession ss = fac.openSession();
//		HashMap map1 = new HashMap<>();
//		map1.put("id", id);
//		map1.put("point", point);
//			
//		HashMap map2 = new HashMap<>();
//		map2.put("id", take);
//		map2.put("point", point);
//		
//		HashMap map3 = new HashMap<>();
//		map3.put("id", take);
//		map3.put("takeid", id);
//		map3.put("point", point);
//		
//		HashMap map4 = new HashMap<>();
//		map4.put("id", id);
//		map4.put("takeid", take);
//		map4.put("point", point);
		
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("takeid", take);
		map.put("point", point);
		
		try{
			int a = ss.update("charge.gift1",map);
			if(a==1){
				int b = ss.update("charge.gift2",map);
				if(b==1){
					int c = ss.insert("charge.gift3",map);
					if(c==1){
						int d = ss.insert("charge.gift4",map);
					}else{
						ss.rollback();
						ss.close();
						return 0;
					}
				} else {
					ss.rollback();
					ss.close();
					return 0;
				}
			}else{
				ss.rollback();
				ss.close();
				return 0;
			}
			ss.commit();
			ss.close();
			return 1;
		}catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return 0;
		}
	}
	
	// 사용내역
	public List chargeuse(String id){
		SqlSession ss = fac.openSession();
		List li = ss.selectList("charge.chargeuse",id);
		if(li == null){
			return null;
		}
		return li;
	}
}
