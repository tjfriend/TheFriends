package board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;

import board.model.freeboardPage;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	freeboardPage fb;
	
	@RequestMapping("/list")
	public ModelAndView boardList(@RequestParam(defaultValue="1") int p){
		List list = fb.GetRnage(p);
		int size = fb.size();
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboarddata",list);
		mav.addObject("freeboardsize",size);
		mav.setViewName("t:menu/board");
		return mav;
	}
	@RequestMapping("/write")
	public ModelAndView writequestion(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t:freeboard/write");
		return mav;
	
	}
	
	
	
}
