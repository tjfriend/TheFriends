package homepage.controller;

import java.text.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import homepage.model.*;

@Controller
@RequestMapping("/visitors")
public class VisitorsController {
	@Autowired
	VisitorsService vs;
	
	@RequestMapping("/{id}")
	public ModelAndView visitors(HttpSession session, @PathVariable(name="id")String id, @RequestParam(name="p", defaultValue="1")int p){
		String writer = (String)session.getAttribute("id");
		ModelAndView mav = new ModelAndView("/homepage/homeVisits/visitors.jsp");
		List<HashMap> list;
		if(writer.equals(id)){
			list = vs.visitors(id, p);
		} else {
			list = vs.visitors2(id, writer, p);
		}
		for(int i=0; i<list.size(); i++){
			Date date = (Date)list.get(i).get("DAY");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String day = sdf.format(date);
			list.get(i).put("DAY", day);
			list.set(i, list.get(i));
		}
		mav.addObject("list", list);
		mav.addObject("owner", id);
		return mav;
	}
	
	@RequestMapping("/{id}/{memo}/{mode}")
	@ResponseBody
	public boolean memo(@PathVariable(name="id")String id, @PathVariable(name="memo")String memo,
												@PathVariable(name="mode")String mode, HttpSession session){
		String writer = (String)session.getAttribute("id");
		return vs.write(id, writer, memo, mode);
	}
}
