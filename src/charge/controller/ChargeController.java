package charge.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeService;

@Controller
@RequestMapping("/charge")
public class ChargeController {

	@Autowired
	ChargeService charge;
	
	// 충전하기
	@RequestMapping("/cash")
	public ModelAndView charge(HttpSession id, int point){
		ModelAndView ma = new ModelAndView("/menu/chargerst.jsp");
		int a = charge.charge((String)id.getAttribute("id"), point);
		if(a==1){
			ma.addObject("y","y");
		}
		return ma;
	}
	
	
	
}
