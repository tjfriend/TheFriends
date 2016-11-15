package notice.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import board.model.*;
import notice.model.*;

@Controller
@RequestMapping("/notice")
public class noticeController {

	@Autowired
	noticepage nb;
	
	@Autowired
	noticewrite nw;
	
	@RequestMapping("/list")
	public ModelAndView noticeList(@RequestParam(defaultValue="1") int p){
		List list = nb.GetRnage(p);
		int size = nb.size();
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticedata",list);
		mav.addObject("noticesize",size);
		mav.setViewName("t:notice/notice");
		return mav;
	}
	
	@RequestMapping("/write")
	public ModelAndView writenotice(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t:notice/write");
		return mav;
	
	}
	
	@RequestMapping("/make")
	public ModelAndView makqna(String title, String content, HttpSession session) {
		String id = (String) session.getAttribute("id");
		int r = nw.write(title, content, id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticesessionid",r); // Ãß°¡
		mav.setViewName("redirect:/notice/list");

		return mav;

	}
	
}