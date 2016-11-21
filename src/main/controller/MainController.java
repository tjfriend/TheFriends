package main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeFriendsService;
import navigation.model.NaviService;

@Controller
public class MainController {
	@Autowired
	ChargeFriendsService cfs;
	
	@Autowired
	NaviService navi;

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
	
	@RequestMapping("/joinAuth/{id}/{email}/{email2}/{name}/{birth}/{phone}/{nickname}/{key}")
	public ModelAndView joinAuth(@PathVariable(name="id")String id, @PathVariable(name="email")String email, @PathVariable(name="email2")String email2,
													@PathVariable(name="name")String name, @PathVariable(name="birth")String birth, @PathVariable(name="phone")String phone,
													@PathVariable(name="nickname")String nickname, @PathVariable(name="key")String key) {
		ModelAndView mav = new ModelAndView("t:member/joinAuth");
		mav.addObject("id", id);
		mav.addObject("email", email);
		mav.addObject("email2", email2);
		mav.addObject("name", name);
		mav.addObject("birth", birth);
		mav.addObject("phone", phone);
		mav.addObject("nickname", nickname);
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
	public ModelAndView charge(HttpSession session) {
		String id = (String)session.getAttribute("id");
		List<HashMap> list = cfs.chargeFriend(id);
		ModelAndView mav = new ModelAndView("t:charge/charge");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/search")
	public ModelAndView search() {
		ModelAndView mav = new ModelAndView("t:search/search");
		return mav;
	}

	@RequestMapping("/navigation")
	public ModelAndView navigation(HttpSession id) {
		ModelAndView mav = new ModelAndView("t:navigation/navigation");
		String my = navi.navi((String)id.getAttribute("id"));
		if(my.contains("(")){
			my = my.substring(0,my.lastIndexOf("("));
		}
		HashMap map = new HashMap();
		map.put("location", "·Ôµ¥¿ùµå");
		map.put("locX", 37.511131);
		map.put("locY", 127.098180 );
		mav.addObject("target", map);
		mav.addObject("my",my);
		return mav;
	}

	@RequestMapping("/shop")
	public ModelAndView shop() {
		ModelAndView mav = new ModelAndView("t:shop/shop");
		return mav;
	}

}
