package charge.controller;

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
		return "/menu/charge/giftcharge.jsp";
	}
	
	@RequestMapping("/gift")
	public ModelAndView gift(String id, String take, int point){
		int a = use.gift(id, take, point);
		ModelAndView ma = new ModelAndView("/menu/charge/chargerst.jsp");
		if(a==1){
			ma.addObject("y","use");
		}else{
			ma.addObject("y","fail");
		}
		return ma;
	}
}
