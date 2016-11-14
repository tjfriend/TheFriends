package QnA.controlller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;

import QnA.model.QnAPage;

@Controller
@RequestMapping("/")
public class QnAcontroller {

	@Autowired
	QnAPage qp;
	
	@RequestMapping("/qna")
	public ModelAndView QnAList(@RequestParam(defaultValue="1") int p){
		List lis = qp.GetRnage(p);
		int size = qp.size();
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnadata",lis);
		mav.addObject("qnasize",size);
		mav.setViewName("t:menu/qna");
		return mav;
	}
	@RequestMapping("/question")
	public ModelAndView QnAquestion(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("t:qna/question");
		return mav;	
	
	}
	@RequestMapping("/makeqna")
	public boolean makeqna(String title, String content, String id){
			System.out.println(title+"/"+content+"/"+id);
		return qp.makeqna(title, content, id);
	}
	
}
