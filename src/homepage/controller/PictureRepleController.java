package homepage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import homepage.model.PictureRepleService;
import homepage.model.PictureService;

@Controller
@RequestMapping("/picture")
public class PictureRepleController {
	@Autowired
	PictureRepleService pic;
	@Autowired
	PictureService service;
	
	@RequestMapping("/view")
	public ModelAndView view(int num, @RequestParam(defaultValue="1") int p){
		ModelAndView ma = new ModelAndView("/homepage/homePicture/view.jsp");
		List li = pic.page(num, p);
		ma.addObject("li",li);
		return ma;
	}
	
	// ´ñ±Ûµî·Ï ÆäÀÌÁö
	@RequestMapping("/reple")
	public ModelAndView reple(String uuid, int num, @RequestParam(defaultValue="1") int p) {
		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureReple.jsp");
		service.count(num);
		List li = pic.page(num, p);
		int size = pic.total(num);
		ma.addObject("uuid",uuid);
		ma.addObject("num",num);
		ma.addObject("li",li);
		ma.addObject("size",size);
		return ma;
	}
	
	// ´ñ±Û µî·Ï
//	@RequestMapping("/reup")
//	public ModelAndView repleup(int num, HttpSession session, String content){
//		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureReple.jsp");
//		int a = pic.reple(num, (String)session.getAttribute("id"), content);
//		ma.addObject("a",a);
//		return ma;
//	}
	@RequestMapping("/reup")
	@ResponseBody
	public int repleup(int num, HttpSession session, String content){
		return pic.reple(num, (String)session.getAttribute("id"), content);
	}
	
	// ÀüÃ¼ ´ñ±Û
	@RequestMapping("/replyAll")
	public ModelAndView replyAll(int num, @RequestParam(defaultValue="1") int p){
		ModelAndView ma = new ModelAndView("/homepage/homePicture/view.jsp");
		List li = pic.page(num, p);
		int size = pic.total(num);
		ma.addObject("li",li);
		ma.addObject("size",size);
		return ma;
	}
	
	// ´ñ±Û ¼öÁ¤
//	@RequestMapping("/modify")
//	public ModelAndView modify(int replynum, String content){
//		int a = pic.update(replynum, content);
//		ModelAndView ma = new ModelAndView("/homepage/homePicture/view.jsp");
//		return ma;
//	}
	@RequestMapping("/modify")
	@ResponseBody
	public int modify(int replynum, String content){
		return pic.update(replynum, content);
	}
	
	// ´ñ±Û »èÁ¦
//	@RequestMapping("/delete")
//	public ModelAndView delete(int replynum){
//		ModelAndView ma = new ModelAndView("/homepage/homePicture/view.jsp");
//		int a = pic.delete(replynum);
//		return ma;
//	}
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int replynum){
		return pic.delete(replynum);
	}
	
	
}
