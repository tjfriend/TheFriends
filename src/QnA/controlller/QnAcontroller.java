package QnA.controlller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import QnA.model.QnAPage;
import QnA.model.qnawrite;

@Controller
@RequestMapping("/qna")
public class QnAcontroller {

	@Autowired
	QnAPage qp;

	@Autowired
	qnawrite qw;

	@Autowired
	SqlSessionFactory fac;

	// @RequestMapping("/list")
	// public ModelAndView QnAList(@RequestParam(defaultValue = "1") int p) {
	// List lis = qp.GetRnage(p);
	// int size = qp.size();
	// ModelAndView mav = new ModelAndView();
	// mav.addObject("qnadata", lis);
	// mav.addObject("qnasize", size);
	// mav.setViewName("t:qna/qna");
	// return mav;
	// }

	@RequestMapping("/list")
	public ModelAndView QnAList(@RequestParam(defaultValue = "1") int p, @RequestParam(defaultValue = "") String mode) {
		ModelAndView mav = new ModelAndView();
		if (mode.equals("")) {
			List lis = qp.GetRnage(p);
			int size = qp.size();
			mav.addObject("qnadata", lis);
			mav.addObject("qnasize", size);
			mav.setViewName("t:qna/qna");
			return mav;
		} else {
			List lis = qp.GetMode(p, mode);
			int size = qp.size();
			mav.addObject("qnadata", lis);
			mav.addObject("qnasize", size);
			mav.addObject("qnamode", mode);

			mav.setViewName("t:qna/qna");
			return mav;
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
	public ModelAndView detailsqna(@PathVariable(name = "num") int num) {
		HashMap map = new HashMap();
		map.put("num", num);
		SqlSession sql = fac.openSession();
		HashMap data = sql.selectOne("qna.qnadetails", map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("details", data);
		mav.setViewName("t:qna/qnadetails");
		return mav;
	}

	
	@RequestMapping("/commenetlist")
	public ModelAndView commentlist(@RequestParam (defaultValue = "1") int p,@RequestParam(defaultValue = "61")int num){
		ModelAndView mav = new ModelAndView();
		List list = qp.Getcommentpage(p, num);
		int sizecom = qp.commentsize();
		System.out.println("123123"+sizecom+"2");	
		mav.addObject("qnacommentdata", list);
		mav.addObject("qnacommentsize", sizecom);
		mav.setViewName("t:qna/commenttest");
		System.out.println(mav+"list");
		return mav;
		
	}

	
	@RequestMapping("/qnacomment")
	public ModelAndView qnacomment(int num, HttpSession session, String memo) {
		String id = (String) session.getAttribute("id");
		System.out.println(num+"//"+id+"//"+memo);
		int r = qw.comment(num, id, memo);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/qna/details/"+num);
		return mav;

	}
	
	
	
}
