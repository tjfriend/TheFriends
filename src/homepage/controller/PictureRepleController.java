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

@Controller
@RequestMapping("/picture")
public class PictureRepleController {
	@Autowired
	PictureRepleService pic;
	
	@RequestMapping("/view")
	public ModelAndView view(String uuid, int num, @RequestParam(defaultValue="1") int p){
		ModelAndView ma = new ModelAndView("/homepage/homePicture/view.jsp");
		List li = pic.page(num, p);
		ma.addObject("li",li);
		return ma;
	}
	
	// ��۵�� ������
	@RequestMapping("/reple")
	public ModelAndView reple(String uuid, int num, @RequestParam(defaultValue="1") int p) {
		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureReple.jsp");
		List li = pic.page(num, p);
		int size = pic.total(num);
		ma.addObject("uuid",uuid);
		ma.addObject("num",num);
		ma.addObject("li",li);
		ma.addObject("size",size);
		return ma;
	}
	
	// ��� ���
	@RequestMapping("/reup")
	public ModelAndView repleup(int num, HttpSession session, String content){
		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureReple.jsp");
		int a = pic.reple(num, (String)session.getAttribute("id"), content);
		ma.addObject("a",a);
		return ma;
	}
	
	// ��ü ���
	@RequestMapping("/replyAll")
	public ModelAndView replyAll(int num, @RequestParam(defaultValue="1") int p){
		ModelAndView ma = new ModelAndView("/homepage/homePicture/pictureReple.jsp");
		List li = pic.page(num, p);
		int size = pic.total(num);
		ma.addObject("li",li);
		ma.addObject("size",size);
		return ma;
	}

	
	
}
