package homepage.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import homepage.model.*;

@Controller
@RequestMapping("/visits")
public class HomeVisitsController {
	@Autowired
	HomepageService hs;
	@Autowired
	VisitorsService vs;
	
	@RequestMapping("/{id}")
	public ModelAndView visit(@PathVariable(name="id")String id, HttpSession session, @RequestParam(name="p", defaultValue="1")int p){
		ModelAndView mav = new ModelAndView();
		String homeType = (String)hs.goHome(id).get("ADDRESS");
		List list;
		if(id.equals((String)session.getAttribute("id"))){
			list = vs.visitors(id, p);
		} else {
			list = vs.visitors2(id, (String)session.getAttribute("id"), p);
		}
		mav.setViewName("/homepage/homeVisits/visitors.jsp");
		mav.addObject("owner", id);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/priv/{id}/{priv}")
	@ResponseBody
	public List priv(@PathVariable(name="id")String id, @PathVariable(name="priv")String priv, @RequestParam(name="p", defaultValue="1")int p){
		return vs.priv(id, priv, p);
	}
	
	@RequestMapping("/modify/{num}/{memo}")
	@ResponseBody
	public boolean modify(@PathVariable(name="num")String num, @PathVariable(name="memo")String memo){
		return vs.modify(num, memo);
	}
	
	@RequestMapping("/del/{num}")
	@ResponseBody
	public boolean del(@PathVariable(name="num")String num){
		return vs.del(num);
	}
}
