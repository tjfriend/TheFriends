package main.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
public class MainController {

	@RequestMapping("/")
	public ModelAndView index(@CookieValue(name = "remember", required = false) String cooId) {
		ModelAndView mav = new ModelAndView("t:index");
		if (cooId != null) {
			mav.addObject("remember", cooId);
		}
		return mav;
	}

	@RequestMapping("/join")
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("t:member/join");
		return mav;
	}
	
	@RequestMapping("/joinAuth/{id}/{email}/{email2}/{name}/{birth}/{phone}/{key}")
	public ModelAndView joinAuth(@PathVariable(name="id")String id, @PathVariable(name="email")String email, @PathVariable(name="email2")String email2,
													@PathVariable(name="name")String name, @PathVariable(name="birth")String birth, @PathVariable(name="phone")String phone,
													@PathVariable(name="key")String key) {
		ModelAndView mav = new ModelAndView("t:member/joinAuth");
		mav.addObject("id", id);
		mav.addObject("email", email);
		mav.addObject("email2", email2);
		mav.addObject("name", name);
		mav.addObject("birth", birth);
		mav.addObject("phone", phone);
		mav.addObject("key", key);
		return mav;
	}

	@RequestMapping("/myinfo")
	public ModelAndView myInfo() {
		ModelAndView mav = new ModelAndView("t:member/myInfo");
		return mav;
	}

	@RequestMapping("/myhome")
	public ModelAndView myHome() {
		ModelAndView mav = new ModelAndView("t:homepage/myHome");
		return mav;
	}

	@RequestMapping("/charge")
	public ModelAndView charge() {
		ModelAndView mav = new ModelAndView("t:menu/charge");
		return mav;
	}

	@RequestMapping("/event")
	public ModelAndView event() {
		ModelAndView mav = new ModelAndView("t:menu/event");
		return mav;
	}

	@RequestMapping("/search")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("t:menu/search");
		return mav;
	}

	@RequestMapping("/navigation")
	public ModelAndView navigation() {
		ModelAndView mav = new ModelAndView("t:menu/navigation");
		return mav;
	}

	@RequestMapping("/shop")
	public ModelAndView shop() {
		ModelAndView mav = new ModelAndView("t:menu/shop");
		return mav;
	}

}
