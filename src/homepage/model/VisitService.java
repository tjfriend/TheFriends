package homepage.model;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class VisitService {
	@Autowired
	SqlSessionFactory fac;
	
	public void visit(String id){
		SqlSession ss = fac.openSession();
		int a = ss.update("homepage.visit", id);
		if(a==1){
			ss.commit();
		} else {
			ss.rollback();
		}
		ss.close();
	}
}
