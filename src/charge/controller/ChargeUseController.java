package charge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeUseService;

@Controller
@RequestMapping("/charge")
public class ChargeUseController {
	@Autowired
	ChargeUseService use;
	
	// 선물하기
	@RequestMapping("/gift")
	@ResponseBody
	public String gift(HttpSession id, String take, int point){
		int a = use.gift((String)id.getAttribute("id"), take, point, id);
		if(a==1){
			return "true";
		}
		return "false";
	}
	
	// 사용내역
	@RequestMapping("/use")
	public ModelAndView use(@RequestParam(defaultValue="1") int p, HttpSession id){
		List li = use.page(p, (String)id.getAttribute("id"));
		int size = use.total();
		ModelAndView ma = new ModelAndView("t:charge/chargeuse");
		if(li.size() != 0){
			ma.addObject("size",size);
			ma.addObject("li",li);
		}else{
			ma.addObject("li",null);
		}
		return ma;
	}
}
