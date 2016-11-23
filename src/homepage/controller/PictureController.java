package homepage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import homepage.model.*;

@Controller
@RequestMapping("/picture")
public class PictureController {
	@Autowired
	PictureService pic;
	@Autowired
	HomepageService hs;
	
	@RequestMapping("/up/{id}")
	public String a(@PathVariable(name="id")String id){
		return "/homepage/homePicture/pictureupload.jsp";
	}
	
	@RequestMapping("/upload")    
	public ModelAndView upload(HttpSession id, String title, String content, 
			@RequestParam(name="picture") MultipartFile picture){
		ModelAndView ma = new ModelAndView("redirect:/picture/pictureview");
		String uuid = pic.execute(picture);
		int a = 0;
		if(uuid != null){
			a = pic.upload((String)id.getAttribute("id"), title, content, picture, uuid);
		}
		ma.addObject("a",a);
		return ma;
	}
	
	@RequestMapping("/pictureview/{id}")
	public ModelAndView view(@PathVariable(name="id")String id, @RequestParam(name="a", defaultValue="2")int a, @RequestParam(name="p", defaultValue="1")  int p){
		List li = pic.view(id, p);
		int size = pic.total();
		String hometype = (String)hs.goHome(id).get("ADDRESS");
		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureBoard.jsp");
		if(li.size() != 0){
			ma.addObject("li",li);
		}else{
			ma.addObject("li","null");
		}
		ma.addObject("a",a);
		ma.addObject("size",size);
		return ma;
	}
	
	// 댓글등록 페이지
	@RequestMapping("/reple")
	public ModelAndView reple(@RequestParam(name="num") int num, @RequestParam(name="file") MultipartFile file){
		ModelAndView ma = new ModelAndView("t:homepage/homePicture/pictureReple");
		
		
		return ma;
		
	}
}
