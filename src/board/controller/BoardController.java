
package board.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.model.ContentService;
import board.model.DeleteService;
import board.model.freeboardPage;
import board.model.freeboardwrite;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	freeboardPage fb;

	@Autowired
	freeboardwrite fw;

	@Autowired
	ContentService cs;

	@Autowired
	DeleteService ds;

	@RequestMapping("/list")
	public ModelAndView boardList(@RequestParam(defaultValue = "1") int p, @RequestParam(defaultValue = "") String mode,
			@RequestParam(defaultValue = "") String search) {
		ModelAndView mav = new ModelAndView();
		if (mode.equals("")) {
			if (search.equals("")) {
				List list = fb.GetRnage(p);
				int size = fb.size();
				if (size >= 5) {
					if (p - 2 < 1) {
						size = 3;
					} else if (p + 2 > size) {
						size = size - 2;
					} else {
						size = p;
					}
				} else {
					size = size;
				}
				int bestsize = fb.size();
				mav.addObject("freeboardbestsize", bestsize);
				mav.addObject("freeboarddata", list);
				mav.addObject("freeboardsize", size);
				mav.addObject("freeboardsetlist", p);
				mav.setViewName("t:freeboard/board");
				return mav;
			} else {
				List list = fb.searchfreeboard(search, p);
				int size = fb.searchfreeboardsize(search);
				if (size >= 5) {
					if (p - 2 < 1) {
						size = 3;
					} else if (p + 2 > size) {
						size = size - 2;
					} else {
						size = p;
					}
				} else {
					size = size;
				}
				int bestsize = fb.searchfreeboardsize(search);
				mav.addObject("freeboardbestsize", bestsize);
				mav.addObject("freeboarddata", list);
				mav.addObject("freeboardsize", size);
				mav.addObject("freeboardsearch", search);
				mav.setViewName("t:freeboard/board");
				return mav;

			}
		} else {
			if (search.equals("")) {
				List list = fb.GetMode(p, mode);
				int size = fb.casize(mode);
				if (size >= 5) {
					if (p - 2 < 1) {
						size = 3;
					} else if (p + 2 > size) {
						size = size - 2;
					} else {
						size = p;
					}
				} else {
					size = size;
				}
				int bestsize = fb.casize(mode);
				mav.addObject("freeboardbestsize", bestsize);
				mav.addObject("freeboarddata", list);
				mav.addObject("freeboardsize", size);
				mav.addObject("freeboardmode", mode);
				mav.setViewName("t:freeboard/board");
				return mav;
			} else {
				List list = fb.searchfreeboardmode(search, p, mode);
				int size = fb.searchfreeboardsizemode(search, mode);
				if (size >= 5) {
					if (p - 2 < 1) {
						size = 3;
					} else if (p + 2 > size) {
						size = size - 2;
					} else {
						size = p;
					}
				} else {
					size = size;
				}
				int bestsize = fb.searchfreeboardsizemode(search, mode);
				mav.addObject("freeboardbestsize", bestsize);
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

	@RequestMapping("/freeboarddetails/{num}")
	public ModelAndView detailsboard(@PathVariable(name="num") int num, HttpSession session, HttpServletRequest req, HttpServletResponse resp,
			@RequestParam(defaultValue ="5")int paging	,@RequestParam(defaultValue = "1") int p, @RequestParam(defaultValue = "1") int pn) {
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		List list = cs.Content(num);
		mav.addObject("pn", pn);
		Cookie[] ar = req.getCookies();
		int n = 0;
		for (Cookie c : ar) {
			if (c.getName().equals("board#" + num)) {
				n = 1;
				break;
			}
		}
		if (n == 0) {
			fw.upinquiry(num);
			Cookie cc = new Cookie("board#" + num, "board#" + num);
			cc.setMaxAge(60 * 30);
			cc.setPath("/");
			resp.addCookie(cc);
		}
		HashMap map = new HashMap();
		map.put("num", num);
		List list2 = fb.Getcommentpage(p, num);
		int sizecom = fb.commentsize(num);
		HashMap data = fb.freeboarddetails(num);
		Date date = (Date) data.get("TIME");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String time = sdf.format(date);
		data.put("TIME", time);
		
		int bestsizecom =  fb.commentsize(num);
		
		if(sizecom>paging){
			sizecom = paging;
			}
		
		mav.addObject("freeboardbestsizecom",bestsizecom);
		mav.addObject("p",p);
		mav.addObject("loginid",id);	
		mav.addObject("details", data);
		mav.addObject("freeboardcommentda", list2);
		mav.addObject("freeboardcommentsi", sizecom);
		mav.addObject("freeboarddetailsdata", list.get(0));
		mav.addObject("freeboarddetailsdata2", id);
		
		mav.setViewName("t:freeboard/freeboarddetails");
		return mav;

	}

	@RequestMapping("/freeboardupdate")
	public ModelAndView writecrystal(@RequestParam(name = "num") int num, @RequestParam(defaultValue = "1") int pn) {
		ModelAndView mav = new ModelAndView();
		List<HashMap> list = cs.Content(num);
		mav.setViewName("t:freeboard/crystal");
		mav.addObject("pn", pn);
		mav.addObject("list", list);
		return mav;
	}

	@RequestMapping("/crystal")
	public ModelAndView make2board(int num, String title, String content, HttpSession session, String category, @RequestParam(defaultValue = "1") int pn) {
		int r = cs.crystal(num, content, category, title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("make2sessionid", r); // 추가
		mav.setViewName("redirect:/board/freeboarddetails/"+num+"?pn="+pn);
		return mav;

	}

	@RequestMapping("/freeboarddelete")
	public ModelAndView writedelete(@RequestParam(name = "num") int num, @RequestParam(defaultValue = "1") int pn) {
		ModelAndView mav = new ModelAndView();
		int freeboard = ds.delete(num);
		int freeboardcomment = ds.freeboardDeletecomment(num);
		mav.setViewName("redirect:/board/list?p="+pn);
		return mav;
	}

	@RequestMapping("/commentdelete")
	public ModelAndView CommentDelete(int commentnum, @RequestParam(defaultValue = "-1") int num, @RequestParam(defaultValue = "1") int pn) {
		int de = ds.CommentDelete(commentnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentnum", commentnum);
		mav.setViewName("redirect:/board/freeboarddetails/" + num+"?pn="+pn);
		return mav;
	}
	
	// 댓글 등록
	@RequestMapping("/freeboardcomment")
	public ModelAndView freeboardcomment(int num, HttpSession session, String memo, @RequestParam(defaultValue = "1") int p,@RequestParam(defaultValue ="5")int paging, @RequestParam(defaultValue = "1") int pn) {
		String id = (String) session.getAttribute("id");
		int r = fw.comment(num, id, memo);
		ModelAndView mav = new ModelAndView();
		int si = fb.commentsize(num);
		mav.setViewName("redirect:/board/freeboarddetails/"+ num + "?p="+si+"&paging="+paging+"&pn="+pn);
		return mav;
	}
	
	// 댓글 수정              
		@RequestMapping("/commentupdate")
		public ModelAndView commentupdate(@RequestParam(name = "memo") String memo,
				@RequestParam(name = "commentnum") int commentnum, @RequestParam(name = "num") int num,
				@RequestParam(defaultValue = "1")int p,@RequestParam(defaultValue = "5")int paging, @RequestParam(defaultValue = "1") int pn) {
			int r = fw.CommentAdjust(memo, commentnum);
			ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/board/freeboarddetails/" + num+"?p="+p+"&paging="+paging+"&pn="+pn);
			return mav;
		}

}
