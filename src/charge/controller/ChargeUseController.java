package charge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeUseService;

@Controller
@RequestMapping("/charge")
public class ChargeUseController {
	@Autowired
	ChargeUseService use;
	
	@RequestMapping("/view")
	public String view(){
		return "t:menu/charge/giftcharge";
	}
	
	// 선물하기
	@RequestMapping("/gift")      
	public ModelAndView gift(HttpSession id, String take, int point){
		int a = use.gift((String)id.getAttribute("id"), take, point);
		ModelAndView ma = new ModelAndView("t:menu/charge/chargerst");
		if(a==1){
			ma.addObject("y","use");
		}else{
			ma.addObject("y","fail");
		}
		return ma;
	}
	
	// 사용내역
	@RequestMapping("/use")
	public ModelAndView use(HttpSession id){
		List li = use.chargeuse((String)id.getAttribute("id"));
		ModelAndView ma = new ModelAndView("t:menu/charge/chargeuse");
		if(li != null){
			ma.addObject("li",li);
		}else{
			ma.addObject("li",null);
		}
		return ma;
	}
}
