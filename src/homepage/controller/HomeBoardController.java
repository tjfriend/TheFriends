package homepage.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import homepage.model.*;

@Controller
@RequestMapping("/homeBoard")
public class HomeBoardController {
	@Autowired
	HomepageService hs;
	
	@RequestMapping("/{id}")
	public ModelAndView homeBoard(@PathVariable(name="id")String id){
		ModelAndView mav = new ModelAndView();
		String homeType = (String)hs.goHome(id).get("ADDRESS");
		switch(homeType){
		case "homeType1":
			mav.setViewName("t:homepage1/homeBoard/board");
			break;
		case "homeType2":
			mav.setViewName("t:homepage2/homeBoard/board");
			break;
		case "homeType3":
			mav.setViewName("t:homepage3/homeBoard/board");
			break;
		case "homeType4":
			mav.setViewName("t:homepage4/homeBoard/board");
			break;
		}
		return mav;
	}
}
