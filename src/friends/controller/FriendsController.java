package friends.controller;

import java.util.*;
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
	public ModelAndView friends(@PathVariable(name="id")String id, @RequestParam(defaultValue="1", name="page")int p){
		ModelAndView mav = new ModelAndView("t:friends/friends");
		mav.addObject("list", fs.friends(id, p));
		mav.addObject("size", fs.size(id));
		return mav;
	}
	
	@RequestMapping("/{id}/{range}")
	@ResponseBody
	public List range(@PathVariable(name="id")String id, @PathVariable(name="range")String range, @RequestParam(defaultValue="1", name="page")int p){
		return fs.friends2(id, p, range);
	}
}
