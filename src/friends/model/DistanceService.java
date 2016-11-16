package friends.model;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Component
public class DistanceService {
	@Autowired
	SqlSessionFactory fac;
	
	public double distance(){
		double x1 = 126.970595;
		double y1 = 37.554627;
		double x2 = 127.027675;
		double y2 = 37.498027;

		double theta = x1 - x2;
		double dist = Math.sin(deg2rad(y1)) * Math.sin(deg2rad(y2))
				+ Math.cos(deg2rad(y1)) * Math.cos(deg2rad(y2)) * Math.cos(deg2rad(theta));

		dist = Math.acos(dist);
		dist = rad2deg(dist);
		dist = dist * 60 * 1.1515;

		dist = dist * 1609.344;

		return 0.0;
	}
	static double deg2rad(double deg) {
		return (deg * Math.PI / 180.0);
	}

	static double rad2deg(double rad) {
		return (rad * 180 / Math.PI);
	}
}
