package friends.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import friends.model.*;

@Controller
@RequestMapping("/friends")
public class FriendsController {
	@Autowired
	FriendsService fs;
	
	@RequestMapping("/{id}")
	public ModelAndView friends(@PathVariable(name="id")String id){
		ModelAndView mav = new ModelAndView("t:friends/friends");
		mav.addObject("list", fs.friends(id));
		return mav;
	}
}
