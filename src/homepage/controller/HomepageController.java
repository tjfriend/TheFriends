package homepage.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import homepage.model.*;

@Controller
@RequestMapping("/homepage")
public class HomepageController {
	@Autowired
	HomepageService hs;
	@Autowired
	VisitService vs;
	
	@RequestMapping("/myhome/{id}")
	@ResponseBody
	public String myHome(@PathVariable(name="id")String id, HttpSession session){
		String address = hs.myHome(id);
		if(!session.getAttribute("id").equals(id)){
			vs.visit(id);
		}
		return address;
	}
	
	@RequestMapping("/{homeType}")
	public String homeType(@PathVariable(name="homeType")String homeType){
		String page = "t:"+homeType;
		return page;
	}
}
