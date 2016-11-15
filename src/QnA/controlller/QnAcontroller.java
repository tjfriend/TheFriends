package QnA.controlller;

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

@RequestMapping("/")
public class QnAcontroller {

	@Autowired
	QnAPage qp;

	@Autowired
	qnawrite qw;

	@RequestMapping("/qna")
	public ModelAndView QnAList(@RequestParam(defaultValue = "1") int p) {
		List lis = qp.GetRnage(p);
		int size = qp.size();
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnadata", lis);
		mav.addObject("qnasize", size);
		mav.setViewName("t:menu/qna");
		return mav;
	}

	@RequestMapping("/question")
	public ModelAndView QnAquestion() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t:qna/question");
		return mav;

	}

	@RequestMapping("/qna/make")
	public ModelAndView makqna(String title, String content, HttpSession session) {
		String id = (String) session.getAttribute("id");
		int r = qw.write(title, content, id);
		System.out.println(session+"/////"+id+".....");
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnasessionid",r); // 추가
		mav.setViewName("redirect:/qna");

		return mav;

	}

	/*
	 * id 입력
	 * 
	 * @RequestMapping("/qna/make") public ModelAndView makqna(String title,
	 * String content, String id) {
	 * 
	 * 
	 * int r = qw.write(title, content, id); System.out.println(id);
	 * ModelAndView mav = new ModelAndView(); mav.setViewName("redirect:/qna");
	 * 
	 * return mav;
	 * 
	 * }
	 */
}
