package board.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class DeleteService {
	@Autowired
	SqlSessionFactory fac;


	public int delete(int num){
		HashMap map = new HashMap<>();
			map.put("num", num);
		SqlSession sql = fac.openSession();
		int li = sql.delete("freeboard.delete", map);
		sql.close();
		return li;
	}
}
