package board.model;

import java.text.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class ContentService {
	@Autowired
	SqlSessionFactory fac;

	public List Content(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> li = sql.selectList("freeboard.freeboarddetails", map);
		sql.close();
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("TIME");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			li.get(i).put("TIME", day);
			li.set(i, li.get(i));
		}
		return li;
	}
	
	public int crystal(int num, String content, String category, String title){
		HashMap map = new HashMap<>();
			map.put("num", num);
			map.put("content", content);
			map.put("category", category);
			map.put("title", title);
		SqlSession sql = fac.openSession();
		int li = sql.update("freeboard.crystal", map);
		sql.close();
		return li;
	}
}
