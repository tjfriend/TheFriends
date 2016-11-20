package searchfriend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.lowagie.text.List;

import searchfriend.model.AddFriendService;

@Controller
@RequestMapping("/search")
public class AddFriendController {
	@Autowired
	AddFriendService afs;
	
	@RequestMapping("/addFriend")
	public ModelAndView addFriend(String friend){
		ModelAndView ma = new ModelAndView("/search/addfriend.jsp");
		ma.addObject("friend",friend);
		return ma;
	}
	
	@RequestMapping("/add/{id}/{friend}")
	@ResponseBody
	public boolean add(@PathVariable(name="id")String id, @PathVariable(name="friend")String friend){
		return afs.add(id, friend);
	}
}
