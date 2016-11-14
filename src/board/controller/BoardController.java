package board.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@RequestMapping("/write")
	public ModelAndView write(){
		ModelAndView mav = new ModelAndView("t:menu/freeboard/write");
		return mav;
	}

}
