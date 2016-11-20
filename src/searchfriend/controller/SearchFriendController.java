package searchfriend.controller;

import java.util.List;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import searchfriend.model.AddFriendService;
import searchfriend.model.SearchFriendService;

@Controller
@RequestMapping("/search")
public class SearchFriendController {

	@Autowired
	SearchFriendService search;
	
	@Autowired
	AddFriendService add;
	
	@RequestMapping("/friend/{find}/{con}")
	public ModelAndView search(@RequestParam(defaultValue="1") int p, @PathVariable(name="find") String find, @PathVariable(name="con") String con, HttpSession session){
		ModelAndView mav = new ModelAndView("/search/searchview.jsp");
		int size = search.total();
		List li = search.search(find,con,p, session);

		if(li.size() != 0){
			mav.addObject("li",li);
			mav.addObject("size",size);
			mav.addObject("find",find);
			mav.addObject("con",con);
		}
		return mav;
	}
	
	@RequestMapping("/friend")
	public ModelAndView search(){
		ModelAndView ma = new ModelAndView("t:menu/search/search");
		return ma;
	}
}
