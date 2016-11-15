package board.controller;

import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import board.model.*;


@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	freeboardPage fb;
	
	@Autowired
	freeboardwrite fw;
	
	@RequestMapping("/list")
	public ModelAndView boardList(@RequestParam(defaultValue="1") int p){
		List list = fb.GetRnage(p);
		int size = fb.size();
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboarddata",list);
		mav.addObject("freeboardsize",size);
		mav.setViewName("t:freeboard/board");
		return mav;
	}
	
	@RequestMapping("/write")
	public ModelAndView writequestion(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t:freeboard/write");
		return mav;
	
	}
	
	@RequestMapping("/make")
	public ModelAndView makqna(String title, String content, HttpSession session) {
		String id = (String) session.getAttribute("id");
		int r = fw.write(title, content, id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboardsessionid",r); // Ãß°¡
		mav.setViewName("redirect:/board/list");

		return mav;

	}
	
	
}
