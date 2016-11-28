package shop.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Shopgift {
	@Autowired
	SqlSessionFactory fac;
	
	public List friend(String id){
		SqlSession ss = fac.openSession();
		return ss.selectList("friends.friendSearch", id);
	}
}
