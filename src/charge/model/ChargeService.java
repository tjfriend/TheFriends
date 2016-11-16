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

}
