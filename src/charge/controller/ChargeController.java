package charge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeService;

@Controller
@RequestMapping("/charge")
public class ChargeController {

	@Autowired
	ChargeService charge;
	
	// 충전하기
	@RequestMapping("/cash")
	@ResponseBody
	public String charge(HttpSession id, int point){
		boolean b = charge.charge((String)id.getAttribute("id"), point);
		if(b){
			return "true";
		} else{
			return "false";
		}
	}
	
	// 충전내역
	@RequestMapping("/chargeAll")
	public ModelAndView chargeAll(HttpSession id){
		ModelAndView ma = new ModelAndView("t:menu/charge/chargeAll");
		List li = charge.chargeAll((String)id.getAttribute("id"));
		if(li!=null){
			ma.addObject("li",li);
		}else{
			ma.addObject("null","null");
		}
		return ma;
	}
	
	
}
