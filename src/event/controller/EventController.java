package event.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import event.model.EventPage;
import event.model.Eventwrite;

@Controller()
@RequestMapping("/event")
public class EventController {

	@Autowired
	SqlSessionFactory fac;
		
	@Autowired
	EventPage ep;
	
	@Autowired
	Eventwrite ew;
	
	@RequestMapping("/list")
	public ModelAndView eventList(@RequestParam(defaultValue = "1") int p) {
		ModelAndView mav = new ModelAndView();
		List lis = ep.eventlist(p);
		int size = ep.size();
		mav.addObject("eventdata", lis);
		mav.addObject("eventsize", size);
		mav.setViewName("t:event/event");
		return mav;
	}

	@RequestMapping("/make")
	public ModelAndView eventMake(HttpSession session,String title,String content) {
		String id = (String) session.getAttribute("id");
		System.out.println("컨트 : "+id+"./"+title+"ll:"+content);
		ModelAndView mav = new ModelAndView();
		int wr = ew.Eventwrite(id, title, content);
		System.out.println("컨 : "+wr);
		mav.setViewName("redirect:/event/list");
		return mav;
	}
	
	@RequestMapping("/write")
	public String eventWrite(){
		return "t:event/write";
	}
	
//	상세보기
	@RequestMapping("/details/{num}")
	public ModelAndView detailsqna(@PathVariable(name = "num") int num, @RequestParam(defaultValue = "1") int p,
			HttpServletRequest req, HttpServletResponse resp ) {
		
		Cookie[] ar = req.getCookies();
		int n =0;
		for(Cookie c : ar){
			if(c.getName().equals("qna#"+num)){
				n=1;
				break;
			}
		}
		if(n==0){
			int upinq = ew.upinquiry(num);  
			
			Cookie cc = new Cookie("qna#"+num,"qna#"+num );
			cc.setMaxAge(60);
			cc.setPath("/");
			resp.addCookie(cc);
		}
		HashMap map = new HashMap();
		map.put("num", num);
		List list = ep.Getcommentpage(p, num);
		int sizecom = ep.commentsize(num);
//		int upinq = qw.upinquiry(num);
		SqlSession sql = fac.openSession();
		HashMap data = sql.selectOne("event.eventdetails", map);
		Date date = (Date)data.get("DAY");
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		String day = sdf.format(date);
		data.put("DAY", day);
		ModelAndView mav = new ModelAndView();
		mav.addObject("details", data);
		mav.addObject("eventcommentda", list);
		mav.addObject("eventcommentsi", sizecom);
		mav.setViewName("t:event/eventdetails");

		return mav;
	}
	
	// 댓글 수정
		@RequestMapping("/commentupdate")
		public ModelAndView commentupdate(@RequestParam(name = "memo")String memo,
				@RequestParam(name = "commentnum") int commentnum,@RequestParam(name = "num") int num){
			System.out.println("컨트 : "+memo+"//"+commentnum+".,l"+num);
			int r = ew.CommentAdjust(memo, commentnum);
			ModelAndView mav = new ModelAndView();
				mav.setViewName("redirect:/event/details/"+num);
				
			return mav;
			
		}
}
