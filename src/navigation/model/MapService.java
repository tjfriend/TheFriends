package navigation.model;

import java.util.HashMap;
import java.util.LinkedHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class MapService {
	public HashMap coordinate(){
		HashMap m = new HashMap();
		RestTemplate rt = new RestTemplate();
		LinkedHashMap map = rt.getForObject				
		("https://maps.googleapis.com/maps/api/geocode/json?address=°­³²¿ª&key=AIzaSyAjeEPKUNUAfmGw8M1UZ-Avgdhuoey0oQo"
				, LinkedHashMap.class);
//		map.get("GeocodeResponse").get("result").get("geometry");
		
		//Integer lng = (Integer)((LinkedHashMap) ((LinkedHashMap) ((LinkedHashMap) ((LinkedHashMap) map.get("GeocodeResponse")).get("result")).get("geometry")).get("location")).get("lng");
		// m.put("lat", lat);
		// m.put("lng", lng);
		return m;
	}
}
