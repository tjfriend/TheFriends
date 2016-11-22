package navigation.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import navigation.model.NaviService;

@Controller
@RequestMapping("/navi")
public class NaviController {
	@Autowired
	NaviService navi;
	
	
	@RequestMapping("/find")
	public ModelAndView find(String friend){
		ModelAndView ma = new ModelAndView("/navigation/findrst.jsp");
		List li = navi.find(friend);
		ma.addObject("li",li);
		return ma;
	}
	
	// ÁÂÇ¥
	@RequestMapping("/coordinate")
	@ResponseBody
	public HashMap coordinate(@RequestParam(name="name") String name, @RequestParam(name="address") String address){
		HashMap map = navi.coordinate(name, address);
		return map;
	}
}
