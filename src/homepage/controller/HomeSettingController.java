package homepage.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;

import homepage.model.*;

@Controller
@RequestMapping("/settings")
public class HomeSettingController {
	@Autowired
	HomepageService hs;
	@Autowired
	SettingService set;
	
	@RequestMapping("/{id}")
	public ModelAndView setting(@PathVariable(name="id")String id){
		ModelAndView mav = new ModelAndView("/homepage/homeSetting/setting.jsp");
		List<HashMap> list = set.music(id);
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/{id}/{homeType}")
	@ResponseBody
	public boolean layout(@PathVariable(name="id")String id, @PathVariable(name="homeType")String homeType){
		return set.layout(id, homeType);
	}
	
	@RequestMapping("/musicDelete/{id}")
	@ResponseBody
	public boolean musicDelete(@PathVariable(name="id")String id, @RequestParam(name="music", required=false)String music){
		return set.musicDelete(id, music);
	}
	
	@RequestMapping("/profile")
	public ModelAndView profile(HttpSession session, @RequestParam(name="profile")MultipartFile file){
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		boolean b = set.profile(id, file);
		String address = (String)hs.goHome(id).get("ADDRESS");
		mav.setViewName("t:"+address);
		mav.addObject("profile", b);
		return mav;
	}
	
	@RequestMapping("/initial/{id}")
	@ResponseBody
	public boolean initial(@RequestParam(name="board", required=false)String board, @RequestParam(name="picture", required=false)String picture, 
									@RequestParam(name="visitors", required=false)String visitors, @PathVariable(name="id")String id){
		return set.initial(id, board, picture, visitors);
	}
}
