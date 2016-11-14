package searchfriend.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import searchfriend.model.SearchFriendService;

@Controller
@RequestMapping("/search")
public class SearchFriendController {

	@Autowired
	SearchFriendService search;
	
	@RequestMapping("/friend/{find}/{con}")
	public ModelAndView search(@PathVariable(name="find")String find, @PathVariable(name="con") String con){
		ModelAndView mav = new ModelAndView("/menu/searchview.jsp");
		List map = search.search(find,con);
		mav.addObject("map",map);
		return mav;
	}
	
	@RequestMapping("/friend")
	public ModelAndView search(){
		ModelAndView ma = new ModelAndView("t:menu/search");
		return ma;
	}
}
