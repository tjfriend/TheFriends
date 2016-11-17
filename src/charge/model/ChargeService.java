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
	
	// �����ϱ�
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
	
	// ��������
	public List chargeAll(String id){
		SqlSession ss = fac.openSession();
		List li = ss.selectList("charge.chargeAll",id);
		ss.close();
		if(li.size()!=0){
			return li;
		}
		return null;
	}
	
	// �������� ������ ó��
	public List page(int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List li = ss.selectList("charge.page",map);
		ss.close();
		return li;
	}

	// �������� ��ü ������
	public int total(){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("charge.total");
		ss.close();
		return a%10==0? a/10 : a/10+1;
	}
	
}
