package navigation.controller;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/navi")
public class MapController {

	@RequestMapping("/map")
	public ModelAndView map(){
		ModelAndView ma = new ModelAndView("t:navigation/navigation");
		HashMap map = new HashMap();
		map.put("location", "·Ôµ¥¿ùµå");
		map.put("locX", 37.511131);
		map.put("locY", 127.098180 );
		ma.addObject("target", map);
		return ma;
	}
	
}
