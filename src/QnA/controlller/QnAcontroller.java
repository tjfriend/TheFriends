package QnA.controlller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import java.text.*;
import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import QnA.model.*;

@Controller
@RequestMapping("/qna")
public class QnAcontroller {

	@Autowired
	QnAPage qp;

	@Autowired
	qnawrite qw;

	@Autowired
	qnaDelete qd;


	@RequestMapping("/test")
	public ModelAndView test() {
		ModelAndView mav = new ModelAndView("t:qna/test");
		return mav;
	}


	// 조회수 많은거3개 , 리스트 들
	@RequestMapping("/list")
	public ModelAndView QnAList(@RequestParam(defaultValue = "1") int p, @RequestParam(defaultValue = "") String mode
			, @RequestParam (defaultValue="") String search,@RequestParam(defaultValue ="5")int paging) {
		ModelAndView mav = new ModelAndView();
		
			
		if (mode.equals("")) {
			if(search.equals("")){
				List lis = qp.GetRnage(p);
				int size = qp.size();
				List best = qp.qnabest();
				
				mav.addObject("qnabest",best);
				if(size>paging){
				size = paging;
				}
				int bestsize = qp.size();
				mav.addObject("qnabestsize", bestsize);
				mav.addObject("qnadata", lis);
				mav.addObject("qnasize", size);
				mav.setViewName("t:qna/qna");
				return mav;
			}else{
				List lis = qp.searchqna(search,p);
				int size = qp.searchqnasize(search);
				mav.addObject("qnadata", lis);
				mav.addObject("qnasize", size);
				mav.addObject("qnasearch", search);
				mav.setViewName("t:qna/qna");
				return mav;
		
			}
		} else {
			if(search.equals("")){
			List lis = qp.GetMode(p, mode);
			int size = qp.modesize(mode);
			mav.addObject("qnadata", lis);
			mav.addObject("qnasize", size);
			mav.addObject("qnamode", mode);
			mav.setViewName("t:qna/qna");
			return mav;
			}else{
				List lis = qp.searchqnamode(search, p, mode);
				int size = qp.searchqnasizemode(search, mode);
				mav.addObject("qnadata", lis);
				mav.addObject("qnasize", size);
				mav.addObject("qnasearch", search);
				mav.addObject("qnamode", mode);
				mav.setViewName("t:qna/qna");
				return mav;
			}
		}
	}

	@RequestMapping("/write")
	public ModelAndView QnAquestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t:qna/question");
		return mav;

	}

	@RequestMapping("/make")
	public ModelAndView makqna(String title, String content, HttpSession session, String category) {
		String id = (String) session.getAttribute("id");
		int r = qw.write(title, content, id, category);
		ModelAndView mav = new ModelAndView();

		mav.setViewName("redirect:/qna/list");

		return mav;

	}

	
	@RequestMapping("/details/{num}")
	public ModelAndView detailsqna(@PathVariable(name = "num") int num, @RequestParam(defaultValue = "1") int p,
			HttpSession session,HttpServletRequest req, HttpServletResponse resp ) {
		String id = (String) session.getAttribute("id");
		
		Cookie[] ar = req.getCookies();
		int n =0;
		for(Cookie c : ar){
			if(c.getName().equals("qna#"+num)){
				n=1;
				break;
			}
		}
		if(n==0){
			int upinq = qw.upinquiry(num);  
			
			Cookie cc = new Cookie("qna#"+num,"qna#"+num );
			cc.setMaxAge(60);
			cc.setPath("/");
			resp.addCookie(cc);
		}
		HashMap map = new HashMap();
		map.put("num", num);
		List list = qp.Getcommentpage(p, num);
		int sizecom = qp.commentsize(num);
//		int upinq = qw.upinquiry(num);
		
		HashMap data = qp.qnadetails(num);
		
		Date date = (Date)data.get("TIME");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String day = sdf.format(date);
		data.put("TIME", day);
		ModelAndView mav = new ModelAndView();
		mav.addObject("loginid", id);
		mav.addObject("details", data);
		mav.addObject("qnacommentda", list);
		mav.addObject("qnacommentsi", sizecom);
		mav.setViewName("t:qna/qnadetails");

		return mav;
	}

	@RequestMapping("/qnacomment")
	public ModelAndView qnacomment(int num, HttpSession session, String memo, @RequestParam(defaultValue = "1") int p) {
		String id = (String) session.getAttribute("id");
		int r = qw.comment(num, id, memo);
		ModelAndView mav = new ModelAndView();
		int si = qp.commentsize(num);
		mav.setViewName("redirect:/qna/details/" + num + "?p="+si);
		return mav;
	}

	@RequestMapping("/qnaupdate")
	public ModelAndView QnaUpdate(@RequestParam(name = "num") int num) {
		ModelAndView mav = new ModelAndView();
		List list = qw.num(num);
		mav.addObject("list", list);
		mav.setViewName("t:qna/adjust");
		return mav;
	}

	@RequestMapping("/qnaadjust")
	public ModelAndView qnaAdjust(String category, int num, String title, String content, HttpSession session) {
		int r = qw.Adjust(num, content, category, title);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaadjust", r);
		mav.setViewName("redirect:/qna/list");
		return mav;
	}

	@RequestMapping("/qnadelete")
	public ModelAndView qnaDelete(int num) {
		int de = qd.QnaDelete(num);
		int da = qd.QnaDeletecomment(num);
		ModelAndView mav = new ModelAndView();
		mav.addObject("num", num);
		mav.setViewName("redirect:/qna/list");
		return mav;
	}


	@RequestMapping("/commentdelete")
	public ModelAndView CommentDelete(int commentnum,@RequestParam (defaultValue="-1") int num) {
		int de = qd.CommentDelete(commentnum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("commentnum", commentnum);
		mav.setViewName("redirect:/qna/details/"+num);
		return mav;
	}
	
	// 댓글 수정
	@RequestMapping("/commentupdate")
	public ModelAndView commentupdate(@RequestParam(name = "memo")String memo,@RequestParam(name = "commentnum") int commentnum,@RequestParam(name = "num") int num){
		int r = qw.CommentAdjust(memo, commentnum);
		ModelAndView mav = new ModelAndView();
			mav.setViewName("redirect:/qna/details/"+num);
			
		return mav;
		
	}
	
	

	
}
