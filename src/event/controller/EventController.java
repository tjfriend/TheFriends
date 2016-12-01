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
			} else {
				size = size;
			}
			int bestsize = ep.size();
			mav.addObject("eventbestsize", bestsize);
			mav.addObject("eventdata", lis);
			mav.addObject("eventsize", size);
			mav.setViewName("t:event/event");
			return mav;
		} else {
			List lis = ep.searchqna(search, p);
			int size = ep.searchqnasize(search);
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
			int bestsize = ep.searchqnasize(search);
			mav.addObject("eventbestsize", bestsize);
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

	// �󼼺���
	@RequestMapping("/details/{num}")
	public ModelAndView detailsqna(@PathVariable(name = "num") int num, @RequestParam(defaultValue = "1") int p,
			HttpServletRequest req, HttpServletResponse resp, HttpSession session,
			@RequestParam(defaultValue = "5") int paging) {
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
		int bestsizecom = ep.commentsize(num);

		if (sizecom > paging) {
			sizecom = paging;
		}
		mav.addObject("eventbestsizecom", bestsizecom);

		mav.addObject("p",p);
		mav.addObject("loginid", id);
		mav.addObject("details", data);
		mav.addObject("eventcommentda", list);
		mav.addObject("eventcommentsi", sizecom);
		mav.setViewName("t:event/eventdetails");

		return mav;
	}

	// ��� ����
	@RequestMapping("/commentupdate")
	public ModelAndView commentupdate(@RequestParam(name = "memo") String memo,
			@RequestParam(name = "commentnum") int commentnum, @RequestParam(name = "num") int num,
			@RequestParam(defaultValue="1")int p,@RequestParam(defaultValue = "5")int paging) {
		int r = ew.CommentAdjust(memo, commentnum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/event/details/"+ num+"?p="+p+"&paging="+paging);

		return mav;

	}

	// ��� ����
	@RequestMapping("/commentdelete")
	public ModelAndView CommentDelete(int commentnum, @RequestParam(defaultValue = "-1") int num) {
		int de = ed.CommentDelete(commentnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentnum", commentnum);
		mav.setViewName("redirect:/event/details/" + num);
		return mav;
	}

	// �Խñ� ����
	@RequestMapping("/eventdelete")
	public ModelAndView qnaDelete(int num) {
		int de = ed.EventDelete(num);
		int da = ed.EventDeletecomment(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.setViewName("redirect:/event/list");
		return mav;
	}

	// �Խñ� ����
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
		int r = ew.Adjust(num, content, title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("eventadjust", r);
		mav.setViewName("redirect:/event/list");
		return mav;
	}

	// ��� ���
	@RequestMapping("/eventcomment")
	public ModelAndView qnacomment(int num, HttpSession session, String memo, @RequestParam(defaultValue = "1") int p,
			@RequestParam(defaultValue ="5")int paging) {
		String id = (String) session.getAttribute("id");
		int r = ew.comment(num, id, memo);
		ModelAndView mav = new ModelAndView();
		int si = ep.commentsize(num);
		mav.setViewName("redirect:/event/details/" + num + "?p="+si+"&paging="+paging);
		return mav;
	}
}
