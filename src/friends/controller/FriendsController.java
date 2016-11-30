package friends.controller;

import java.util.*;

import javax.servlet.http.*;

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
	@Autowired
	RequestFriendsService rfs;
	@Autowired
	AcceptService as;
	@Autowired
	RefuseService rs;
	
	@RequestMapping("/home/{id}")
	@ResponseBody
	public List homeFriends(@PathVariable(name="id")String id){
		return fs.homeFriends(id);
	}
	
	@RequestMapping("/{id}")
	public ModelAndView friends(@PathVariable(name="id")String id, @RequestParam(defaultValue="1", name="page")int p){
		ModelAndView mav = new ModelAndView("t:friends/friends");
		mav.addObject("list", fs.friends(id, p));
		mav.addObject("size", fs.size(id));
		mav.addObject("requestList", rfs.requestFriends2(id, p, "ÀÌ¸§¼ø"));
		mav.addObject("requestSize", rfs.size(id));
		return mav;
	}
	
	@RequestMapping("/{id}/{range}")
	@ResponseBody
	public List range(@PathVariable(name="id")String id, @PathVariable(name="range")String range, @RequestParam(defaultValue="1", name="page")int p){
		return fs.friends2(id, p, range);
	}
	
	@RequestMapping("/request/{id}/{range}")
	@ResponseBody
	public List<HashMap> requestFriends(@PathVariable(name="id")String id, @PathVariable(name="range")String range, @RequestParam(defaultValue="1", name="page")int p){
		return rfs.requestFriends2(id, p, range);
	}
	
	@RequestMapping("/accept/{name}")
	@ResponseBody
	public boolean accept(@PathVariable(name="name")String name, HttpSession session){
		return as.accept(name, session);
	}
	
	@RequestMapping("/refuse/{name}")
	@ResponseBody
	public boolean refuse(HttpSession session, @PathVariable(name="name") String name){
		return rs.refuse(session, name);
	}
}
