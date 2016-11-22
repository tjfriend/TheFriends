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

	@Autowired
	ContentService cs;
	
	@Autowired
	DeleteService ds;

	// @RequestMapping("/list")
	// public ModelAndView boardList(@RequestParam(defaultValue="1") int p){
	// List list = fb.GetRnage(p);
	// int size = fb.size();
	// ModelAndView mav = new ModelAndView();
	// mav.addObject("freeboarddata",list);
	// mav.addObject("freeboardsize",size);
	// mav.setViewName("t:freeboard/board");
	// return mav;
	// }

//	@RequestMapping("/list")
//	public ModelAndView boardList(@RequestParam(defaultValue = "1") int p,
//			@RequestParam(defaultValue = "") String mode) {
//		ModelAndView mav = new ModelAndView();
//
//		if (mode.equals("")) {
//			List list = fb.GetRnage(p);
//			int size = fb.size();
//			mav.addObject("freeboarddata", list);
//			mav.addObject("freeboardsize", size);
//			mav.setViewName("t:freeboard/board");
//			return mav;
//		} else {
//			List list = fb.GetMode(p, mode);
//			int size = fb.casize(mode);
//			mav.addObject("freeboarddata", list);
//			mav.addObject("freeboardsize", size);
//			mav.addObject("freeboardmode", mode);
//			mav.setViewName("t:freeboard/board");
//			return mav;
//		}
//	}

	@RequestMapping("/list")
	public ModelAndView boardList(@RequestParam(defaultValue = "1") int p, @RequestParam(defaultValue = "") String mode
			, @RequestParam (defaultValue="") String search) {
		ModelAndView mav = new ModelAndView();
		if (mode.equals("")) {
			if(search.equals("")){
				List list = fb.GetRnage(p);  
				int size = fb.size();
				mav.addObject("freeboarddata", list);
				mav.addObject("freeboardsize", size);
				mav.setViewName("t:freeboard/board");
				return mav;
			}else{
				List list = fb.searchfreeboard(search,p);
				int size = fb.searchfreeboardsize(search);
				mav.addObject("freeboarddata", list);
				mav.addObject("freeboardsize", size);
				mav.addObject("freeboardsearch", search);
				mav.setViewName("t:freeboard/board");
				return mav;
		
			}
		} else {
			if(search.equals("")){
			List list = fb.GetMode(p, mode);
			int size = fb.casize(mode); 
			mav.addObject("freeboarddata", list);
			mav.addObject("freeboardsize", size);
			mav.addObject("freeboardmode", mode);
			mav.setViewName("t:freeboard/board");
			return mav;
			}else{
				List list = fb.searchfreeboardmode(search, p, mode);
				int size = fb.searchfreeboardsizemode(search, mode);
				mav.addObject("freeboarddata", list);
				mav.addObject("freeboardsize", size);
				mav.addObject("freeboardsearch", search);
				mav.addObject("freeboardmode", mode);
				mav.setViewName("t:freeboard/board");
				return mav;
			}
		}
	}
	
	@RequestMapping("/write")
	public ModelAndView writeboard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t:freeboard/write");
		return mav;

	}

	@RequestMapping("/make")
	public ModelAndView makfreeboard(String title, String content, HttpSession session, String category) {
		String id = (String) session.getAttribute("id");
		int r = fw.write(title, content, id, category);
		ModelAndView mav = new ModelAndView();
		mav.addObject("freeboardsessionid", r); // 추가
		mav.setViewName("redirect:/board/list");

		return mav;

	}

	@RequestMapping("/freeboarddetails")
	public ModelAndView detailsboard(@RequestParam(defaultValue = "-1") int num, HttpSession session, HttpServletRequest req, HttpServletResponse resp) {
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		List list = cs.Content(num);
		
		Cookie[] ar = req.getCookies();
		int n = 0;
		for(Cookie c : ar){
			if(c.getName().equals("board#"+num)){
				n = 1;
				break;
			}
		}
		if(n==0){
			fw.upinquiry(num);
			Cookie cc = new Cookie("board#"+num, "board#"+num);
			cc.setMaxAge(60*30);
			cc.setPath("/");
			resp.addCookie(cc);
		}
		
		mav.addObject("freeboarddetailsdata", list);
		mav.addObject("freeboarddetailsdata2", id);
		mav.setViewName("t:freeboard/freeboarddetails");
		return mav; 
		
	}

	@RequestMapping("/freeboardupdate")
	public ModelAndView writecrystal(@RequestParam(name = "num") int num) {
		ModelAndView mav = new ModelAndView();
		List<HashMap> list = cs.Content(num);
		mav.setViewName("t:freeboard/crystal");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/crystal")
	public ModelAndView make2board(int num, String title, String content, HttpSession session, String category) {
		int r = cs.crystal(num, content, category, title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("make2sessionid", r); // 추가
		mav.setViewName("redirect:/board/list");
		return mav;

	}
	
	@RequestMapping("/freeboarddelete")
	public ModelAndView writedelete(@RequestParam(name = "num") int num) {
		ModelAndView mav = new ModelAndView();
		List<HashMap> list = cs.Content(num);
		mav.setViewName("t:freeboard/delete");
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/delete")
	public ModelAndView deleteboard(int num) {
		int r = ds.delete(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("deletesessionid", r); // 추가
		mav.setViewName("redirect:/board/list");
		return mav;

	}
	


}
