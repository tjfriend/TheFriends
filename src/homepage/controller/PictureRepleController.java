package homepage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import homepage.model.PictureRepleService;

@Controller
@RequestMapping("/picture")
public class PictureRepleController {
	@Autowired
	PictureRepleService pic;
	
	// 댓글등록 페이지
	@RequestMapping("/reple")
	public ModelAndView reple(String uuid) {
		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureReple.jsp");
		ma.addObject("uuid",uuid);
		return ma;
	}
	
	@RequestMapping("/reup")
	public int repleup(int num, HttpSession session, String content){
		int a = pic.reple(num, (String)session.getAttribute("id"), content);
		return a;
	}

	
	
}
