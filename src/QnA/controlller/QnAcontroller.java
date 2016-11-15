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

	@RequestMapping("/list")
	public ModelAndView QnAList(@RequestParam(defaultValue = "1") int p) {
		List lis = qp.GetRnage(p);
		int size = qp.size();
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnadata", lis);
		mav.addObject("qnasize", size);
		mav.setViewName("t:qna/qna");
		return mav;
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
		int r = qw.write(title, content, id,category);
		System.out.println(session+"/////"+id+"....."+category);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnasessionid",r); // Ãß°¡
		mav.setViewName("redirect:/qna");

		return mav;

	}

	@RequestMapping("/qnadetails")
	public ModelAndView detailsqna(@RequestParam(defaultValue="-1") int num){
		HashMap map = new HashMap();
			map.put("num", num);
		SqlSession sql = fac.openSession();
		List li = sql.selectList("qna.qnadetails",map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnadetailsdata",li);
		mav.setViewName("t:qna/qnadetails");
		return mav;	
	}
}
