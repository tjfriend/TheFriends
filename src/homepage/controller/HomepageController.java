package homepage.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import homepage.model.*;

@Controller
@RequestMapping("/homepage")
public class HomepageController {
	@Autowired
	HomepageService hs;
	@Autowired
	VisitService vs;
	@Autowired
	PictureService pic;
	
	@RequestMapping("/myhome/{name}")
	@ResponseBody
	public String myHome(@PathVariable(name="name")String name, HttpSession session){
		HashMap map = hs.myHome(name);
		String id = (String)map.get("ID");
		if(session.getAttribute("id")!=null){
			if(!session.getAttribute("id").equals(id)){
				vs.visit(id);
			}
		}
		return (String)map.get("ID");
	}
	
	@RequestMapping("/{id}")
	public ModelAndView homeType(@PathVariable(name="id")String id){
		ModelAndView mav = new ModelAndView();
		HashMap map = hs.goHome(id);
		String page = "t:"+map.get("ADDRESS");
		mav.setViewName(page);
		mav.addObject("uuid", hs.uuid(id));
		return mav;
	}
	
	@RequestMapping("/home/{id}")
	public String home(@PathVariable(name="id")String id){
		String homeType = (String)(hs.goHome(id).get("ADDRESS"));
		return "/"+homeType+"/article.jsp";
	}

	@RequestMapping("/board/{id}")
	public String board(@PathVariable(name="id")String id){
		String homeType = (String)(hs.goHome(id).get("ADDRESS"));
		// return "/homepage/homeBoard/board.jsp";
		return "redirect:/homeBoard/"+id;
	}
	
	@RequestMapping("/picture/{id}")
	public String picture(@PathVariable(name="id")String id, HttpSession session){
		String homeType = (String)(hs.goHome(id).get("ADDRESS"));
		String sessionId = (String)session.getAttribute("id");
		return "redirect:/picture/pictureview/"+id;
	}
	
	@RequestMapping("/visitors/{id}")
	public String visitors(@PathVariable(name="id")String id){
		String homeType = (String)(hs.goHome(id).get("ADDRESS"));
		return "redirect:/visits/"+id;
	}

	@RequestMapping("/setting/{id}")
	public String setting(@PathVariable(name="id")String id){
		String homeType = (String)(hs.goHome(id).get("ADDRESS"));
		return "redirect:/settings/"+id;
	}
	
	@RequestMapping("/music/{id}")
	@ResponseBody
	public List<HashMap> music(@PathVariable(name="id")String id){
		return hs.music(id);
	}
}
