package charge.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChargeFriendsService {
	@Autowired
	SqlSessionFactory fac;
	
	public List chargeFriend(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("member.chargeFriends", id);
		return list;
	}
}
