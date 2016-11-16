package board.controller;

import java.util.*;

import javax.servlet.http.*;

import org.apache.ibatis.session.*;
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
	
	@Autowired
	SqlSessionFactory fac;
	
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
	public ModelAndView makfreeboard(String title, String content, HttpSession session, String category) {
		String id = (String) session.getAttribute("id");
		int r = fw.write(title, content, id,category);
		System.out.println(session+"/////"+id+"....."+category);
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboardsessionid",r); // Ãß°¡
		mav.setViewName("redirect:/board/list");

		return mav;

	}

	@RequestMapping("/freeboarddetails")
	public ModelAndView detailsboard(@RequestParam(defaultValue="-1") int num){
		HashMap map = new HashMap();
			map.put("num", num);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("freeboard.freeboarddetails",map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboarddetailsdata",li);
		mav.setViewName("t:freeboard/freeboarddetails");
		return mav;	
	}
	
}
