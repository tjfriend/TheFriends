package charge.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import charge.model.ChargeService;
import charge.model.ChargeUseService;

@Controller
@RequestMapping("/charge")
public class ChargeController {

	@Autowired
	ChargeService charge;
	@Autowired
	ChargeUseService use;
	
	// 충전하기
	@RequestMapping("/cash")
	@ResponseBody
	public String charge(HttpSession id, String take, String point){
		int p = Integer.parseInt(point.substring(0, point.length()-1));
		int a = 0;
		if(take.equals("나에게")){
			a = charge.charge((String)id.getAttribute("id"), p);
		}else{
			a = use.gift((String)id.getAttribute("id"), take, p);
		}
		if(a==1){
			return "true";
		}
		return "false";
	}
	
	// 충전내역
	@RequestMapping("/chargeAll")
	public ModelAndView chargeAll(@RequestParam(defaultValue="1") int p, HttpSession id){
		ModelAndView ma = new ModelAndView("t:charge/chargeAll");
		List li = charge.chargeAll((String)id.getAttribute("id"));
		List li2 = charge.page(p);
		int size = charge.total();
		if(li!=null){
			ma.addObject("li2",li2);
			ma.addObject("size",size);
			ma.addObject("li",li);
		}else{
			ma.addObject("null","null");
		}
		return ma;
	}
	
	
}
