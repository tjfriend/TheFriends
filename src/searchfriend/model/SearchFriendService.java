package searchfriend.model;

import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SearchFriendService {
	@Autowired
	SqlSessionFactory fac;

	public List search(String find,String con) {
		SqlSession ss = fac.openSession();
		List map = new Vector<>();
		switch (find) {
		case "id":
			map = ss.selectList("searchfriend.searchId", "%"+con+"%");
			break;
		case "name":
			map = ss.selectList("searchfriend.searchName", "%"+con+"%");
			break;
		case "address":
			map = ss.selectList("searchfriend.searchAdd", "%"+con+"%");
			break;
		default:
			map = ss.selectList("searchfriend.searchPhone","%"+con+"%");
		}
		ss.close();
		return map;
	}
}
