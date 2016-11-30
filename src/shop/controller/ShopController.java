package shop.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import shop.model.*;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopPage sp;
	
	@Autowired
	ShopWrite sw;
	
	@Autowired
	Shopbuy sb;
	
	@Autowired
	Shopgift sg;

//	@RequestMapping("/list")
//	public ModelAndView shopList(@RequestParam(defaultValue = "1") int p) {
//		List list = sp.GetRnage(p);
//		int size = sp.size();
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("shopdata", list);
//		mav.addObject("shopsize", size);
//		mav.setViewName("t:shop/shop");
//		
//		return mav;
//	}
	@RequestMapping("/list")
	public ModelAndView shopList(@RequestParam(defaultValue = "1") int p, @RequestParam (defaultValue="") String search) {
		ModelAndView mav = new ModelAndView();
			if(search.equals("")){
				List list = sp.GetRnage(p);  
				int size = sp.size();
				mav.addObject("shopdata", list);
				mav.addObject("shopsize", size);
				mav.setViewName("t:shop/shop");
				return mav;
			}else{
				List list = sp.searchshop(search,p);
				int size = sp.searchsizeshop(search);
				mav.addObject("shopdata", list);
				mav.addObject("shopsize", size);
				mav.addObject("shopsearch", search);
				mav.setViewName("t:shop/shop");
				return mav;
			}
	}

	@RequestMapping("/write")
	public ModelAndView shopwrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopwrite.jsp");
		return mav;
	}
	
	@RequestMapping("/upload")
	public ModelAndView shopupload(String title, int money) {
		int r = sw.write(title, money);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/shop/list");
		
		return mav;
	}
	
	@RequestMapping("/shopbuy")
	@ResponseBody
	public boolean shopbuy(String title, HttpSession session) {
		String id = (String) session.getAttribute("id");
		if(sb.musicbuy(id, title, session)>0){
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/shopgift")
	@ResponseBody
	public List shopgift(HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<HashMap> list = sg.friend(id);
		return list;
	}
	
//	@RequestMapping("/shopgift")
//	public ModelAndView shopgift(HttpSession session, String title, String money) {
//		String id = (String) session.getAttribute("id");
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("/shop/shopgift.jsp");
//		List<HashMap> list = sg.friend(id);
//		mav.addObject("list", list);
//		mav.addObject("title", title);
//		mav.addObject("money", money);
//		return mav;
//	}
	
	@RequestMapping("/shopgiftend")
	@ResponseBody
	public boolean shopgiftend(HttpSession session, String title, String money, String gtake) {
		String id = (String) session.getAttribute("id");
		return sg.friendgift(id, title, money, gtake, session);
	}
	
//	@RequestMapping("/shopgiftend")
//	public ModelAndView shopgiftend(HttpSession session, String title, String money, String gtake) {
//		String id = (String) session.getAttribute("id");
//		ModelAndView mav = new ModelAndView();
//		List<HashMap> list = sg.friend(id);
//		mav.addObject("title", title);
//		mav.addObject("money", money);
//		mav.addObject("gtake", gtake);
//		int m = sg.friendgift(id, title, money, gtake);
//		mav.addObject("m", m);
//		mav.setViewName("/shop/shopgiftend.jsp");
//		return mav;
//	}

}
