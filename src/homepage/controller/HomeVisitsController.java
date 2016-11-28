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
	public ModelAndView visit(@PathVariable(name="id")String id, HttpSession session){
		ModelAndView mav = new ModelAndView();
		String homeType = (String)hs.goHome(id).get("ADDRESS");
		List list;
		if(id.equals((String)session.getAttribute("id"))){
			list = vs.visitors(id, 1);
		} else {
			list = vs.visitors2(id, (String)session.getAttribute("id"), 1);
		}
		mav.setViewName("/homepage/homeVisits/visitors.jsp");
		mav.addObject("owner", id);
		mav.addObject("list", list);
		return mav;
	}
}
