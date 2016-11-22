package homepage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import homepage.model.PictureUploadService;

@Controller
@RequestMapping("/picture")
public class PictureUploadController {
	@Autowired
	PictureUploadService pic;
	
	@RequestMapping("/up")
	public String a(){
		return "t:homepage/homePicture/pictureupload";
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
	
	@RequestMapping("/pictureview")
	public ModelAndView view(HttpSession id, @RequestParam(name="a", defaultValue="2")int a){
		List li = pic.view((String)id.getAttribute("id"));
		ModelAndView ma = new ModelAndView("t:homepage/homePicture/pictureBoard");
		if(li.size() != 0){
			ma.addObject("li",li);
		}else{
			ma.addObject("li","null");
		}
		ma.addObject("a",a);
		return ma;
	}
}
