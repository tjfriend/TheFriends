package friends.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class FriendsService {
	@Autowired
	SqlSessionFactory fac;
	
	public List friends(String id){
		SqlSession ss = fac.openSession();
		List list = ss.selectList("member.friends", id);
		ss.close();
		return list;
	}
}
