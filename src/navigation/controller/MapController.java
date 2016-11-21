package navigation.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import navigation.model.MapService;

@Controller
public class MapController {
	@Autowired
	MapService mapSrv;
	
	@RequestMapping("/map")
	public ModelAndView map(){
		ModelAndView ma = new ModelAndView("t:navigation/map");
		RestTemplate rt = new RestTemplate();
		LinkedHashMap map = rt.getForObject				
		("https://maps.googleapis.com/maps/api/geocode/json?address=°­³²¿ª&key=AIzaSyAjeEPKUNUAfmGw8M1UZ-Avgdhuoey0oQo"
				, LinkedHashMap.class);
		ma.addObject("location", ((LinkedHashMap)((LinkedHashMap)((ArrayList) map.get("results")).get(0)).get("geometry")).get("location"));
		return ma;
	}
}
