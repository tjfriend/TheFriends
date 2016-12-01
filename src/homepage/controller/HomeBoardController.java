package homepage.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import homepage.model.*;

@Controller
@RequestMapping("/homeBoard")
public class HomeBoardController {
	@Autowired
	HomepageService hs;

	@Autowired
	boardwrite bw;

	@Autowired
	boardpage bp;

	@Autowired
	boarddelete bd;

	@RequestMapping("/{id}")
	public ModelAndView homeBoard(@PathVariable(name = "id") String id, @RequestParam(defaultValue = "1") int p,
			HttpSession session, @RequestParam(defaultValue = "") String search) {
		String loginid = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		if (search.equals("")) {
			List lis = bp.homeboardlist(p, id);
			int size = bp.size(id);
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
			int bestsize = bp.size(id);
			mav.addObject("homebestsize", bestsize);
			mav.addObject("homeboarddata", lis);
			mav.addObject("homeboardsize", size);
		} else {
			List lis = bp.searchhome(search, p, id);
			int size = bp.searchhomesize(search, id);
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
			int bestsize = bp.searchhomesize(search, id);
			mav.addObject("homebestsize", bestsize);
			
			mav.addObject("homeboarddata", lis);
			mav.addObject("homeboardsize", size);
			mav.addObject("homeboardsearch",search);
		}
		String homeType = (String) hs.goHome(id).get("ADDRESS");
		switch (homeType) {
		case "homeType1":
			mav.setViewName("t:homepage1/homeBoard/board");
			break;
		case "homeType2":
			mav.setViewName("t:homepage2/homeBoard/board");
			break;
		case "homeType3":
			mav.setViewName("t:homepage3/homeBoard/board");
			break;
		case "homeType4":
			mav.setViewName("t:homepage4/homeBoard/board");
			break;
		}
		mav.addObject("loginid", loginid);

		return mav;
	}

	@RequestMapping("/homeboardWrite/{id}")
	public ModelAndView homeboardWrite(@PathVariable(name = "id") String id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/homepage/homeBoard/write.jsp");
		return mav;
	}

	@RequestMapping("/upload/{id}")
	public ModelAndView makqna(String title, String content, @PathVariable(name = "id") String id) {
		int r = bw.boardwrite(id, title, content);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/common.jsp");

		return mav;
	}

	@RequestMapping("/details/{id}/{num}")
	public ModelAndView details(@PathVariable(name = "num") int num, @RequestParam(defaultValue = "1") int p,
			HttpServletRequest req, HttpServletResponse resp, @PathVariable(name = "id") String id,HttpSession session
			,@RequestParam(defaultValue = "5") int paging) {
		String loginid = (String)session.getAttribute("id");
		Cookie[] ar = req.getCookies();
		int n = 0;
		for (Cookie c : ar) {
			if (c.getName().equals("homeboard#" + num)) {
				n = 1;
				break;
			}
		}
		if (n == 0) {
			int upinq = bw.upinquiry(num);

			Cookie cc = new Cookie("homeboard#" + num, "homeboard#" + num);
			cc.setMaxAge(60);
			cc.setPath("/");
			resp.addCookie(cc);
		}
		HashMap map = new HashMap();
		map.put("num", num);
		List list = bp.Getcommentpage(p, num);
		int sizecom = bp.commentsize(num);

		HashMap data = bp.homepagedetails(num);
		Date date = (Date) data.get("DAY");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String time = sdf.format(date);
		data.put("DAY", time);
		ModelAndView mav = new ModelAndView();
		
		
		
		int bestsizecom = bp.commentsize(num);

		if (sizecom > paging) {
			sizecom = paging;
		}
		mav.addObject("homepagebestsizecom", bestsizecom);
		
		
		
		mav.addObject("p",p);
		mav.addObject("id", id);
		mav.addObject("loginid",loginid);
		mav.addObject("details", data);
		mav.addObject("homepagecommentda", list);
		mav.addObject("homepagecommentsi", sizecom);
		String homeType = (String) hs.goHome(id).get("ADDRESS");
		switch (homeType) {
		case "homeType1":
			mav.setViewName("t:homepage1/homeBoard/boarddetails");
			break;
		case "homeType2":
			mav.setViewName("t:homepage2/homeBoard/boarddetails");
			break;
		case "homeType3":
			mav.setViewName("t:homepage3/homeBoard/boarddetails");
			break;
		case "homeType4":
			mav.setViewName("t:homepage4/homeBoard/boarddetails");
			break;
		}

		return mav;
	}

	// 댓글 수정
	@RequestMapping("/commentupdate")
	public ModelAndView commentupdate(@RequestParam(name = "memo") String memo,
			@RequestParam(name = "commentnum") int commentnum, @RequestParam(name = "num") int num,
			@RequestParam(name = "id") String id,@RequestParam(defaultValue="1")int p,@RequestParam(defaultValue = "5")int paging) {
		int r = bw.CommentAdjust(memo, commentnum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/homeBoard/details/" + id + "/" + num+"?p="+p+"&paging="+paging);

		return mav;

	}

	// 댓글 삭제
	@RequestMapping("/commentdelete")
	public ModelAndView CommentDelete(int commentnum, @RequestParam(defaultValue = "-1") int num,
			@RequestParam(name = "id") String id) {
		int de = bd.CommentDelete(commentnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentnum", commentnum);
		mav.setViewName("redirect:/homeBoard/details/" + id + "/" + num);
		return mav;
	}

	// 게시글 삭제
	@RequestMapping("/homeBoarddelete")
	public ModelAndView qnaDelete(int num, @RequestParam(name = "id") String id) {
		int de = bd.homeboardDelete(num);
		int da = bd.homeboardDeletecomment(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.setViewName("redirect:/homeBoard/" + id);
		return mav;
	}

	// 게시글 수정
	@RequestMapping("/homeBoardupdate")
	public ModelAndView QnaUpdate(@RequestParam(name = "num") int num) {
		ModelAndView mav = new ModelAndView();
		List list = bw.num(num);
		mav.addObject("list", list);
		mav.setViewName("/homepage/homeBoard/adjust.jsp");
		return mav;
	}

	@RequestMapping("/homeBoardadjust")
	public ModelAndView qnaAdjust(int num, String title, String content, HttpSession session) {
		int r = bw.Adjust(num, content, title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("homeboardadjust", r);
		mav.setViewName("/common.jsp");
		return mav;
	}

	// 댓글 등록
	@RequestMapping("/homeBoardcomment")
	public ModelAndView qnacomment(int num, HttpSession session, String memo, @RequestParam(defaultValue = "1") int p,
			@RequestParam(name = "id") String id,@RequestParam(defaultValue ="5")int paging) {
		String coid = (String) session.getAttribute("id");
		int r = bw.comment(num, coid, memo);
		ModelAndView mav = new ModelAndView();
		int si = bp.commentsize(num);
		mav.setViewName("redirect:/homeBoard/details/" + id + "/" + num + "?p=" + si+"&paging="+paging);
		return mav;
	}

}
