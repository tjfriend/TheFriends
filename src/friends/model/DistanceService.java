package friends.model;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.client.*;

@Component
public class DistanceService {
	@Autowired
	SqlSessionFactory fac;
	
	public double distance(String id, String friend){
		SqlSession ss = fac.openSession();
		
		List<HashMap> list1 = ss.selectList("member.latlng", id);
		List<HashMap> list2 = ss.selectList("member.latlng", friend);
		
		double x1 = Double.parseDouble((String)list1.get(0).get("X")); 
		double y1 = Double.parseDouble((String)list1.get(0).get("Y"));
		double x2 = Double.parseDouble((String)list2.get(0).get("X"));
		double y2 = Double.parseDouble((String)list2.get(0).get("Y"));
		
		double theta = x1 - x2;
		double dist = Math.sin(deg2rad(y1)) * Math.sin(deg2rad(y2))
				+ Math.cos(deg2rad(y1)) * Math.cos(deg2rad(y2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;

		dist = dist * 1609.344;

		return dist;
	}
	static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}
}
