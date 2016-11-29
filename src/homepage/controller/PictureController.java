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
@RequestMapping("/picture")
public class PictureController {
	@Autowired
	PictureService pic;
	@Autowired
	HomepageService hs;
	
	// 기본 뷰
	@RequestMapping("/up/{id}")
	public String a(@PathVariable(name="id")String id){
		return "/homepage/homePicture/pictureupload.jsp";
	}
	
	// 사진 업로드
	@RequestMapping("/upload/{id}")    
	public ModelAndView upload(@PathVariable(name="id") String id, String title, String content, 
			@RequestParam(name="picture") MultipartFile picture, String open){
		ModelAndView ma = new ModelAndView("redirect:/picture/pictureview/{id}");
		String uuid = pic.execute(picture);
		int a = 0;
		if(uuid != null){
			a = pic.upload(id, title, content, picture, uuid, open);
		}
		ma.addObject("a",a);
		return ma;
	}
	
	// 사진 전체목록
//	@RequestMapping("/pictureview/{id}")
//	public ModelAndView view(@PathVariable(name="id")String id, @RequestParam(name="a", defaultValue="2")int a, 
//			@RequestParam(name="p", defaultValue="1") int p, HttpSession session){
//		String open;
//		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureBoard3.jsp");
//		if(pic.find((String)session.getAttribute("id"), id).size() != 0){
//			ma.addObject("friend", true);
//		}else{
//			ma.addObject("friend", false);
//		}
//		List li = pic.view(id, p);
//		int size = pic.total(id);
//		String hometype = (String)hs.goHome(id).get("ADDRESS");
//		if(li.size() != 0){
//			ma.addObject("li",li);
//		}else{
//			ma.addObject("li","null");
//		}
//		ma.addObject("a",a);
//		ma.addObject("size",size);
//		return ma;
//	}
	
	@RequestMapping("/pictureview/{id}")
	public ModelAndView view(@PathVariable(name="id")String id, @RequestParam(name="a", defaultValue="2")int a, 
			@RequestParam(name="p", defaultValue="1") int p, HttpSession session){
		ModelAndView mav = new ModelAndView("/homepage/homePicture/pictureBoard3.jsp");
		if(a!=2){
			mav.setViewName("/common.jsp");
		}
		String loginId = (String)session.getAttribute("id");
		List<HashMap> friend = pic.find(id, loginId);
		List list;
		if(id.equals(loginId)){
			list = pic.view(id, p);
		} else if(friend.size()!=0){
			list = pic.viewFriend(id, p);
		} else {
			list = pic.viewAll(id, p);
		}
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("/pictureview/ajax/{id}")
	@ResponseBody
	public List ajaxView(@PathVariable(name="id")String id, HttpSession session, @RequestParam(name="p", defaultValue="1") int p){
		String loginId = (String)session.getAttribute("id");
		List<HashMap> friend = pic.find(id, loginId);
		List list;
		if(id.equals(loginId)){
			list = pic.view(id, p);
		} else if(friend.size()!=0){
			list = pic.viewFriend(id, p);
		} else {
			list = pic.viewAll(id, p);
		}
		return list;
	}
	
	// 좋아요
	@RequestMapping("/good")
	@ResponseBody
	public int good(int num){
		pic.good(num);
		int a = pic.goodcount(num);
		return a;
	}
}
