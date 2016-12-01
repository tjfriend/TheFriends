package notice.controller;

import java.text.SimpleDateFormat;
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
	noticepage np;
	
	@Autowired
	noticewrite nw;
	
	@Autowired
	noticeDelete nd;
	
	@RequestMapping("/list")
	public ModelAndView noticeList(@RequestParam(defaultValue = "1") int p, @RequestParam (defaultValue="") String search,
		HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("id");
		if(id!=null){
		List nick = nw.membernickname(id);
		mav.addObject("nick",nick);
		}
		if(search.equals("")){
		List lis = np.noticelist(p);
		int size = np.size();
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
		int bestsize = np.size();
		mav.addObject("noticebestsize", bestsize);
		mav.addObject("noticedata", lis);
		mav.addObject("noticesize", size);
		mav.setViewName("t:notice/notice");
		return mav;
		}else{
			List lis = np.searchqna(search,p);
			int size = np.searchqnasize(search);
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
			int bestsize = np.searchqnasize(search);
			mav.addObject("noticebestsize", bestsize);
			mav.addObject("noticedata", lis);
			mav.addObject("noticesize", size);
			mav.addObject("noticesearch", search);
			mav.setViewName("t:notice/notice");
			return mav;
		}
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
		int r = nw.noticewrite(id, title, content);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/notice/list");

		return mav;

	}

	// 상세보기
	@RequestMapping("/details/{num}")
	public ModelAndView detailsqna(@PathVariable(name = "num") int num, @RequestParam(defaultValue = "1") int p,
			HttpServletRequest req, HttpServletResponse resp,HttpSession session,@RequestParam(defaultValue ="5")int paging) {
		String id = (String) session.getAttribute("id");

		Cookie[] ar = req.getCookies();
		int n = 0;
		for (Cookie c : ar) {
			if (c.getName().equals("notice#" + num)) {
				n = 1;
				break;
			}
		}
		if (n == 0) {
			int upinq = nw.upinquiry(num);

			Cookie cc = new Cookie("notice#" + num, "notice#" + num);
			cc.setMaxAge(60*30);
			cc.setPath("/");
			resp.addCookie(cc);
		}
		HashMap map = new HashMap();
		map.put("num", num);
		List list = np.Getcommentpage(p, num);
		int sizecom = np.commentsize(num);
		// int upinq = qw.upinquiry(num);
		
		HashMap data = np.noticedetails(num);
		Date date = (Date) data.get("TIME");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String time = sdf.format(date);
		data.put("TIME", time);
		ModelAndView mav = new ModelAndView();
		
		int bestsizecom = np.commentsize(num);
		
		if(sizecom>paging){
			sizecom = paging;
			}
		mav.addObject("noticebestsizecom",bestsizecom);
		
		
		mav.addObject("loginid",id);
		mav.addObject("details", data);
		mav.addObject("noticecommentda", list);
		mav.addObject("noticecommentsi", sizecom);
		mav.setViewName("t:notice/noticedetails");

		return mav;
	}

	// 댓글 수정
	@RequestMapping("/commentupdate")
	public ModelAndView commentupdate(@RequestParam(name = "memo") String memo,
			@RequestParam(name = "commentnum") int commentnum, @RequestParam(name = "num") int num,
			@RequestParam(defaultValue="1")int p,@RequestParam(defaultValue = "5")int paging) {
		int r = nw.CommentAdjust(memo, commentnum);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/notice/details/"+ num+"?p="+p+"&paging="+paging);

		return mav;

	}

	// 댓글 삭제
	@RequestMapping("/commentdelete")
	public ModelAndView CommentDelete(int commentnum, @RequestParam(defaultValue = "-1") int num) {
		int de = nd.CommentDelete(commentnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentnum", commentnum);
		mav.setViewName("redirect:/notice/details/" + num);
		return mav;
	}

	// 게시글 삭제
	@RequestMapping("/noticedelete")
	public ModelAndView qnaDelete(int num) {
		int de = nd.noticeDelete(num);
		int da = nd.noticeDeletecomment(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.setViewName("redirect:/notice/list");
		return mav;
	}
	
	// 게시글 수정
	@RequestMapping("/noticeupdate")
	public ModelAndView QnaUpdate(@RequestParam(name = "num") int num) {
		ModelAndView mav = new ModelAndView();
		List list = nw.num(num);
		mav.addObject("list", list);
		mav.setViewName("t:notice/adjust");
		return mav;
	}
	
	@RequestMapping("/noticeadjust")
	public ModelAndView qnaAdjust(int num, String title, String content, HttpSession session) {
		int r = nw.Adjust(num, content, title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("noticeadjust", r);
		mav.setViewName("redirect:/notice/list");
		return mav;
	}
	
	// 댓글 등록
	@RequestMapping("/noticecomment")
	public ModelAndView qnacomment(int num, HttpSession session, String memo, @RequestParam(defaultValue = "1") int p
			,@RequestParam(defaultValue ="5")int paging) {
		String id = (String) session.getAttribute("id");
		int r = nw.comment(num, id, memo);
		ModelAndView mav = new ModelAndView();
		int si = np.commentsize(num);
		mav.setViewName("redirect:/notice/details/" + num + "?p="+si+"&paging="+paging);
		return mav;
	}
}
