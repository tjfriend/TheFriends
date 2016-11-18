package charge.model;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

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
		List<HashMap> li = ss.selectList("charge.chargeAll",id);
		ss.close();
		for(int i=0; i<li.size(); i++){
			HashMap map = li.get(i);
			Date date = (Date)map.get("CHARGEDATE");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			System.out.println(map.get("CHARGEDATE"));
			map.put("CHARGEDATE", day);
			li.set(i, map);
		}
		return li;
	}
	
	// �������� ������ ó��
	public List page(int p, String id){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		map.put("id", id);
		List<HashMap> li = ss.selectList("charge.page",map);
		for(int i=0; i<li.size(); i++){
			HashMap map2 = li.get(i);
			Date date = (Date)map2.get("CHARGEDATE");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			map2.put("CHARGEDATE", day);
			li.set(i, map2);
		}
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
