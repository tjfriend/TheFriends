package event.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import event.model.EventDelete;
import event.model.EventPage;
import event.model.Eventwrite;

@Controller()
@RequestMapping("/event")
public class EventController {

	@Autowired
	EventPage ep;

	@Autowired
	Eventwrite ew;

	@Autowired
	EventDelete ed;

	@RequestMapping("/list")
	public ModelAndView eventList(@RequestParam(defaultValue = "1") int p,
			@RequestParam(defaultValue = "") String search, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("id");
		if (id != null) {
			List nick = ew.membernickname(id);
			mav.addObject("nick", nick);
		}
		if (search.equals("")) {
			List lis = ep.eventlist(p);
			int size = ep.size();
			if (size >= 5) {
				if (p - 2 < 1) {
					size = 3;
				} else if (p + 2 > size) {
					size = size - 2;
				} else {
					size = p;
				}
			}else{
				size = size;
			}
			int bestsize = ep.size();
			mav.addObject("eventbestsize",bestsize);
			System.out.println("컨트:"+bestsize);
			mav.addObject("eventdata", lis);
			mav.addObject("eventsize", size);
			mav.setViewName("t:event/event");
			return mav;
		} else {
			List lis = ep.searchqna(search, p);
			int size = ep.searchqnasize(search);
			mav.addObject("eventdata", lis);
			mav.addObject("eventsize", size);
			mav.addObject("eventsearch", search);
			mav.setViewName("t:event/event");
			return mav;
		}
	}

	@RequestMapping("/make")
	public ModelAndView eventMake(HttpSession session, String title, String content) {
		String id = (String) session.getAttribute("id");
		ModelAndView mav = new ModelAndView();
		int wr = ew.Eventwrite(id, title, content);
		mav.setViewName("redirect:/event/list");
		return mav;
	}

	@RequestMapping("/write")
	public String eventWrite() {
		return "t:event/write";
	}

	// 상세보기
	@RequestMapping("/details/{num}")
	public ModelAndView detailsqna(@PathVariable(name = "num") int num, @RequestParam(defaultValue = "1") int p,
			HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		String id = (String) session.getAttribute("id");

		Cookie[] ar = req.getCookies();
		int n = 0;
		for (Cookie c : ar) {
			if (c.getName().equals("qna#" + num)) {
				n = 1;
				break;
			}
		}
		if (n == 0) {
			int upinq = ew.upinquiry(num);

			Cookie cc = new Cookie("qna#" + num, "qna#" + num);
			cc.setMaxAge(60);
			cc.setPath("/");
			resp.addCookie(cc);
		}
		HashMap map = new HashMap();
		map.put("num", num);
		List list = ep.Getcommentpage(p, num);
		int sizecom = ep.commentsize(num);
		// int upinq = qw.upinquiry(num);'

		HashMap data = ep.eventdetails(num);
		Date date = (Date) data.get("DAY");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String day = sdf.format(date);
		data.put("DAY", day);
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginid", id);
		mav.addObject("details", data);
		mav.addObject("eventcommentda", list);
		mav.addObject("eventcommentsi", sizecom);
		mav.setViewName("t:event/eventdetails");

		return mav;
	}

	// 댓글 수정
	@RequestMapping("/commentupdate")
	public ModelAndView commentupdate(@RequestParam(name = "memo") String memo,
			@RequestParam(name = "commentnum") int commentnum, @RequestParam(name = "num") int num) {
		int r = ew.CommentAdjust(memo, commentnum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/event/details/" + num);

		return mav;

	}

	// 댓글 삭제
	@RequestMapping("/commentdelete")
	public ModelAndView CommentDelete(int commentnum, @RequestParam(defaultValue = "-1") int num) {
		int de = ed.CommentDelete(commentnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentnum", commentnum);
		mav.setViewName("redirect:/event/details/" + num);
		return mav;
	}

	// 게시글 삭제
	@RequestMapping("/eventdelete")
	public ModelAndView qnaDelete(int num) {
		int de = ed.EventDelete(num);
		int da = ed.EventDeletecomment(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.setViewName("redirect:/event/list");
		return mav;
	}

	// 게시글 수정
	@RequestMapping("/eventupdate")
	public ModelAndView QnaUpdate(@RequestParam(name = "num") int num) {
		ModelAndView mav = new ModelAndView();
		List list = ew.num(num);
		mav.addObject("list", list);
		mav.setViewName("t:event/adjust");
		return mav;
	}

	@RequestMapping("/eventadjust")
	public ModelAndView qnaAdjust(int num, String title, String content, HttpSession session) {
		System.out.println("컨트 : " + num + "//" + title + "//" + content);
		int r = ew.Adjust(num, content, title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventadjust", r);
		mav.setViewName("redirect:/event/list");
		return mav;
	}

	// 댓글 등록
	@RequestMapping("/eventcomment")
	public ModelAndView qnacomment(int num, HttpSession session, String memo, @RequestParam(defaultValue = "1") int p) {
		String id = (String) session.getAttribute("id");
		int r = ew.comment(num, id, memo);
		ModelAndView mav = new ModelAndView();
		int si = ep.commentsize(num);
		mav.setViewName("redirect:/event/details/" + num + "?p=" + si);
		return mav;
	}
}
