package searchfriend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/search")
public class AddFriendController {

	@RequestMapping("/addfriend")
	public ModelAndView add(String friend){
		ModelAndView ma = new ModelAndView("t:search/addfriend");
		ma.addObject("friend",friend);
		return ma;
	}
}
