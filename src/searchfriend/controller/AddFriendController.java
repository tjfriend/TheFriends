package searchfriend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.List;

import searchfriend.model.AddfriendService;

@Controller
@RequestMapping("/search")
public class AddFriendController {
	
	@RequestMapping("/addfriend")
	public ModelAndView add(String friend){
		ModelAndView ma = new ModelAndView("/search/addfriend.jsp");
		ma.addObject("friend",friend);
		return ma;
	}
	
	
}
