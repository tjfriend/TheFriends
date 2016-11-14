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
		ModelAndView mav = new ModelAndView("t:menu/join");
		return mav;
	}

	@RequestMapping("/myinfo")
	public ModelAndView myInfo() {
		ModelAndView mav = new ModelAndView("t:menu/myInfo");
		return mav;
	}

	@RequestMapping("/myhome")
	public ModelAndView myHome() {
		ModelAndView mav = new ModelAndView("t:menu/myHome");
		return mav;
	}

	@RequestMapping("/charge")
	public ModelAndView charge() {
		ModelAndView mav = new ModelAndView("t:menu/charge");
		return mav;
	}

	@RequestMapping("/notice")
	public ModelAndView notice() {
		ModelAndView mav = new ModelAndView("t:menu/notice");
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
