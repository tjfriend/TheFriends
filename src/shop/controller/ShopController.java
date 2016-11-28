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
		if(sb.musicbuy(id, title)>0){
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/shopgift")
	public ModelAndView shopgift() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/shop/shopgift.jsp");
		
		return mav;
	}

}
